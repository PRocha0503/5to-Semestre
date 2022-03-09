var element = document.getElementById("firstButton");
let activate = false;
element.onclick = function (event) {
	activate = !activate;
	activate
		? (document.getElementById("hide").style.display = "block")
		: (document.getElementById("hide").style.display = "none");
	console.log("Se pico el botton");
};
