const main = () => {
	//Primer Ejercico:cada vez 	que se mueve el mouse agarramos su posision  la ponemos en el elemento
	onmousemove = function (e) {
		let mouseText = document.getElementById("mousePosition");
		mouseText.innerHTML = `Posición del mouse: X:${e.clientX} Y:${e.clientY}`;
	};
	//Segundo Ejericio: Sacamos los valores y creamos un elemento con eso
	let nameSummit = document.getElementById("form1");
	nameSummit.onsubmit = (e) => {
		e.preventDefault();
		const fName = document.getElementsByName("fname")[0].value;
		const lName = document.getElementsByName("lname")[0].value;
		const p = document.createElement("p");
		const nameHTML = document.createTextNode(`${fName} ${lName}`);
		p.appendChild(nameHTML);
		const element = document.getElementById("form1");
		element.appendChild(p);
	};
};

//Tercer ejercicio: tenemos valores iniciales y agreamos columnas y filas correspondientemente
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

//Cuarto ejercico: pedimos columnas, fila y texto y lo ponemos ahi
const changeContent = () => {
	const helper = (_r = 1, _c = 1, text = "Default text") => {
		let table = document.getElementById("myTable");
		const row = table.rows[_r - 1];
		const cel = row.cells[_c - 1];
		cel.innerHTML = text;
	};
	const row = document.getElementsByName("row")[0].value;
	const column = document.getElementsByName("column")[0].value;
	const text = document.getElementsByName("setText")[0].value;
	if (row > 3 || column > 3) {
		console.error("Not in range");
	} else {
		helper(row, column, text);
	}
};

//Quito ejercico: tenemos una lista de colores y de ahi agregamos al dropdown
const pColors = [
	"White",
	"Yellow",
	"Blue",
	"Red",
	"Green",
	"Black",
	"Brown",
	"Azure",
	"Ivory",
	"Teal",
	"Silver",
	"Purple",
	"Navy blue",
	"Pea green",
	"Gray",
	"Orange",
	"Maroon",
	"Charcoal",
	"Aquamarine",
	"Coral",
	"Fuchsia",
	"Wheat",
	"Lime",
	"Crimson",
	"Khaki",
	"Hot pink",
	"Magenta",
	"Olden",
	"Plum",
	"Olive",
	"Cyan",
];
const addedColors = [];
const addColor = () => {
	let dropdown = document.getElementById("colorSelect");
	const color = pColors.pop();
	var opt = document.createElement("option");
	opt.value = color;
	opt.innerHTML = color;
	dropdown.appendChild(opt);
	addedColors.push(color);
};

const removeColor = () => {
	let dropdown = document.getElementById("colorSelect");
	const removedColor = dropdown.options[dropdown.options.length - 1];
	dropdown.remove(dropdown.options.length - 1);
	pColors.push(removedColor.innerHTML);
};

// const getFormvalue = (e) => {
// 	e.preventDefault();
// 	const fName = document.getElementsByName("fname")[0].value;
// 	const lName = document.getElementsByName("lname")[0].value;
// 	const p = document.createElement("p");
// 	const nameHTML = document.createTextNode(`${fName} ${lName}`);
// 	p.appendChild(nameHTML);
// 	const element = document.getElementById("form1");
// 	element.appendChild(p);
// };

//Ultimo ejercicio: cuando el mouse pasa por arriba, se cambia la imagen

const enlargeImage = (x) => {
	const h = Math.floor(Math.random() * (600 - 300) + 300);
	const w = Math.floor(Math.random() * (600 - 300) + 300);
	x.src = `http://placekitten.com/${h}/${w}`;
	x.style.height = `${h}px`;
	x.style.width = `${w}px`;
};
