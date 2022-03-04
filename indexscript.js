var iteration_count = 0;
var clicked = false;
var used_questions = [];
var rand_array = [];
var fragen = null;
var last_continue_click = null;
var max_time = 30000;
var start_time = Date.now();
var timer_width = 354;
var continue_offset_calculator = 0;

async function sleep(ms) { return new Promise((resolve) => setTimeout(resolve, ms)); }

async function requestResource(name) {
    return new Promise(function (resolve) {
        request = new XMLHttpRequest();
        request.open("GET", name);
        request.responseType = "json";
        request.send();
        request.onload = () => {
            resolve(request.response);
        }
    })
}

function getFragenFeld() {
    return document.getElementById("question");
}

function getAntwortFelder() {
    return [...document.getElementsByClassName("answers")];
}

function getStatusFelder() {
    return document.getElementsByClassName("statusfeld");
}

function getWeiterFeld() {
    return document.getElementById("continue");
}

function randomSort(list) {
    if (!typeof (list) === typeof ([]))
        throw new Error("List ist kein Array");
    used = [];
    newlist = [];
    while (used.length < list.length) {
        nr = Math.floor(Math.random() * 4);
        if (used.includes(nr))
            continue;
        newlist.push(list[nr]);
        used.push(nr);
    }
    return newlist;
}

// Transformiert die id's answer1 , ...2, etc zu Arraypositionen 0-3
function translateIDs(id) {
    return id.slice(6) * 1 - 1;
}

// Fügt die Parameter aus frage in das document ein
function neueParameter(frage) {
    if (!typeof (frage["frage"]) === "string")
        throw new Error("Frage ist kein String");
    if (!typeof (frage["antworten"]) === typeof ([]))
        throw new Error("Antworten ist kein Array");
    getFragenFeld().innerText = frage["frage"];
    rand_array = randomSort([0, 1, 2, 3]);
    getAntwortFelder().forEach((element, i) => { element.innerText = frage["antworten"][rand_array[i]]; });
}

async function neueFrage() {
    getAntwortFelder().forEach((a) => { a.setAttribute("state", null) });
    if (used_questions.length >= await requestResource("menge.php")) // Zurücksetzen der Fragen, sollten alle durch sein
        used_questions = [];

    do {
        nFrage = await requestResource("fragen.php");
    } while (used_questions.includes(nFrage[0]));
    used_questions.push(nFrage[0]);
    neueParameter(nFrage[1]);
}

async function main(resetorelse) {
    iteration_count = 0;
    clicked = false;
    if (resetorelse)
        for (i = 2; i >= 0; i--) {
            getStatusFelder()[i].removeAttribute("state");
            await sleep(Math.min(Date.now() - last_continue_click, 1000));
            last_continue_click -= 1000;
        }
    neueFrage();
    getWeiterFeld().innerText = "Weiter →";
    getWeiterFeld().setAttribute("visible", false);
    start_time = Date.now()
    newWidth()
}


async function clickAction(id) {
    if (clicked || getWeiterFeld().innerHTML === "Reset")
        return;
    document.getElementById("continue").setAttribute("visible", true);
    document.getElementById(id).setAttribute("state", rand_array[translateIDs(id)] === await requestResource("antwortrichtigkeit.php?id=" + used_questions[used_questions.length - 1]) ? "right" : "wrong");
    clicked = true;
    continue_offset_calculator = Date.now();
}

function clickContinueAction() {
    if (getWeiterFeld().getAttribute("visible") === "false" && !clicked)
        return;
    getWeiterFeld().setAttribute("visible", false);
    if (iteration_count > 2) { // Zurücksetzen nachdem 3 Fragen beantwortet wurden
        main(true);
        return;
    }
    for (i = 0; i < 4; i++)
        if (getAntwortFelder()[i].getAttribute("state") === "null")
            continue;
        else {
            getStatusFelder()[iteration_count].setAttribute("state", getAntwortFelder()[i].getAttribute("state"));
            last_continue_click = Date.now()
        }
    iteration_count += 1;
    clicked = false;
    if (iteration_count > 2) {
        start_time -= max_time;
        getWeiterFeld().innerText = "Reset";
        getWeiterFeld().setAttribute("visible", true);
    } else {
        neueFrage()
        start_time += Date.now() - continue_offset_calculator
        newWidth()
    };
}

main(false);

async function newWidth() {
    if (clicked)
        return
    if (Date.now() - start_time > max_time) {
        for (l = 0; l < 3; l++) {
            if (getStatusFelder()[l].hasAttribute("state"))
                continue
            getStatusFelder()[l].setAttribute("state", "wrong");
            await sleep(1000);
        }
        getWeiterFeld().innerText = "Reset";
        getWeiterFeld().setAttribute("visible", true);
        iteration_count = 3;
        clicked = true;
        return
    }
    document.getElementById("timelist").style.width = timer_width * (1 - ((Date.now() - start_time) / max_time)) + "px";
    setTimeout(newWidth, 10);
}