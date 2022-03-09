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

let rowN = 2;
let columnN = 2;
const insertRow = () => {
	let table = document.getElementById("sampleTable");
	var row = table.insertRow(rowN);
	for (let i = 0; i < columnN; i++) {
		let cel = row.insertCell(i);
		cel.innerHTML = `Row ${rowN + 1} column ${i + 1}`;
	}
	rowN++;
};

const insertColumn = () => {
	let table = document.getElementById("sampleTable");

	for (let i = 0; i < rowN; i++) {
		const row = table.rows[i];
		let cel = row.insertCell(columnN);
		cel.innerHTML = `Row ${i + 1} column ${columnN + 1}`;
	}

	columnN++;
};
