function ageRange() {
let min=18;
let max=50;
let random = Math.floor(Math.random() * (+max - +min)) + +min;
console.log ("Random Number Generated:" + random );
            }

const age = document.getElementById("age");
function ageRange() {
age.addEventListener("input", function (event) {
if (age.validity.rangeUnderflow) {
age.setCustomValidity(alert("Value out of range!"));
             } else {
age.setCustomValidity("");
             }
             })};


function clickButton() {
document.getElementById("btn").innerHTML = "Form sent.";
        }