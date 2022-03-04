let iteration_count = 0;
let clicked = false;
let used_questions = [];
let last_continue_click = null;
let max_time = 30000;
let start_time = Date.now();
let timer_width = 354;
let continue_offset_calculator = 0;

async function sleep(ms) { return new Promise((resolve) => setTimeout(resolve, ms)); }

async function requestResource(name) {
    return new Promise(function (resolve) {
        request = new XMLHttpRequest();
        request.open("GET", name);
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
    return [...document.getElementsByClassName("statusfeld")];
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
    delete used;
    return newlist;
}

// Transformiert die id's answer1 , ...2, etc zu Arraypositionen 0-3
function translateIDs(id) {
    return id.slice(6) * 1 - 1;
}

// Fügt die Parameter aus frage in das document ein
function neueParameter(frage, antworten) {
    if (!typeof (frage) === String)
        throw new Error("frage ist kein String");
    if (!typeof (antworten) === typeof ([]))
        throw new Error("antworten ist kein Array");
    getFragenFeld().innerText = frage;
    rand = randomSort([...Array(4).keys()]);
    getAntwortFelder().forEach((element, i) => { element.innerText = antworten[rand[i]]; });
}

async function neueFrage() {
    getAntwortFelder().forEach((a) => { a.setAttribute("state", null) });
    if (used_questions.length >= JSON.parse(await requestResource("menge.php"))) // Zurücksetzen der Fragen, sollten alle durch sein
        used_questions = [];
    do {
        nFrage = JSON.parse(await requestResource("fragen.php"));
    } while (used_questions.includes(nFrage[0]));
    used_questions.push(nFrage[0]);
    neueParameter(nFrage[1], JSON.parse(await requestResource("antworten.php?id=" + nFrage[0])));
    delete nFrage;
}

async function main(resetorelse) {
    iteration_count = 0;
    clicked = false;
    if (resetorelse)
        for (i = 2; i >= 0; i--) {
            getStatusFelder()[i].removeAttribute("state");
            await sleep(Math.min(Date.now() - last_continue_click, 1000)).then(() => { last_continue_click -= 1000; });
        }
    neueFrage();
    getWeiterFeld().innerText = "Weiter →";
    getWeiterFeld().setAttribute("visible", false);
    start_time = Date.now();
    newWidth();
}


async function clickAction(id) {
    if (clicked || getWeiterFeld().innerHTML === "Reset")
        return;
    document.getElementById("continue").setAttribute("visible", true);
    document.getElementById(id).setAttribute("state", await requestResource("antwortrichtigkeit.php?id=" + used_questions[used_questions.length - 1]) === document.getElementById(id).innerText ? "right" : "wrong");
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
            last_continue_click = Date.now();
        }
    iteration_count += 1;
    clicked = false;
    if (iteration_count > 2) {
        start_time -= max_time;
        getWeiterFeld().innerText = "Reset";
        getWeiterFeld().setAttribute("visible", true);
    } else {
        neueFrage();
        start_time += Date.now() - continue_offset_calculator;
        newWidth();
    };
}

main(false);

// Adjusts the timer's width
async function newWidth() {
    if (clicked)
        return;
    if (Date.now() - start_time > max_time) {
        iteration_count = 3;
        clicked = true;
        for (i = 0; i < 3; i++) {
            if (getStatusFelder()[i].hasAttribute("state"))
                continue;
            getStatusFelder()[i].setAttribute("state", "wrong");
            await sleep(1000);
        }
        getWeiterFeld().innerText = "Reset";
        getWeiterFeld().setAttribute("visible", true);
        return;
    }
    document.getElementById("timelist").style.width = timer_width * (1 - ((Date.now() - start_time) / max_time)) + "px";
    setTimeout(newWidth, 10);
}
