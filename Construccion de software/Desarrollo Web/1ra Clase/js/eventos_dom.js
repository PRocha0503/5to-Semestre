const main = () => {
	let nameSummit = document.getElementById("form1");
	nameSummit.onclick = () => {
		console.log("click");
	};
};

onmousemove = function (e) {
	let mouseText = document.getElementById("mousePosition");
	mouseText.innerHTML = `Posición del mouse: X:${e.clientX} Y:${e.clientY}`;
};
