const main = () => {
	let nameSummit = document.getElementById("form1");
	nameSummit.onclick = () => {
		console.log("click");
	};
};

let rowN = 3;
const insertRow = () => {
	let table = document.getElementById("sampleTable");
	var row = table.insertRow(rowN - 1);
	var cell1 = row.insertCell(0);
	var cell2 = row.insertCell(1);
	cell1.innerHTML = `Row ${rowN} column 1`;
	cell2.innerHTML = `Row ${rowN} column 1`;
	rowN++;
};

onmousemove = function (e) {
	let mouseText = document.getElementById("mousePosition");
	mouseText.innerHTML = `Posición del mouse: X:${e.clientX} Y:${e.clientY}`;
};
