// Pablo Rocha
// A01028638
// 03/03/2020

const firstRepeat = (word) => {
	const letters = [];
	for (let letter of word) {
		if (word.split(letter).length - 1 === 1) {
			return letter;
		}
	}
	return "No unique character";
};
console.log("First repeat");
console.log(firstRepeat("abacddbec"));
console.log(firstRepeat("aaedeedr"));
console.log(firstRepeat("abc"));

const exchange = (array, i1, i2) => {
	let inter = array[i1];
	array[i1] = array[i2];
	array[i2] = inter;
};

const bubbleSort = (array) => {
	let sorted = false;
	let changes = 0;
	while (!sorted) {
		changes = 0;
		for (let i = 0; i < array.length - 1; i++) {
			if (array[i] > array[i + 1]) {
				changes++;
				exchange(array, i, i + 1);
			}
		}
		if (changes === 0) {
			sorted = true;
		}
	}
	return array;
};

console.log("Buuble Sort");
console.log(bubbleSort([5, 1, 4, 2, 8]));
console.log(bubbleSort([2, 1, 45, 62, 88]));
console.log(bubbleSort([53, 11, 24, 22, 28]));

const merge = (left, right) => {
	let arr = [];
	while (left.length && right.length) {
		if (left[0] < right[0]) {
			arr.push(left.shift());
		} else {
			arr.push(right.shift());
		}
	}
	return [...arr, ...left, ...right];
};

const mergeSort = (array) => {
	const half = array.length / 2;
	if (array.length < 2) {
		return array;
	}
	const left = array.splice(0, half);
	return merge(mergeSort(left), mergeSort(array));
};

console.log("Merge Sort");
console.log(mergeSort([2, 33, 6, 3, 8, 5, 6, 0]));
console.log(mergeSort([27, 373, 66, 53, 48, 53, 26, 0]));
console.log(mergeSort([42, 343, 64, 34, 58, 45, 64, 40]));

const revertArray = (array) => {
	const revArray = [];
	array.forEach((element) => {
		revArray.unshift(element);
	});
	return revArray;
};

console.log("Revert Array");
console.log(revertArray([1, 2, 3, 4]));
console.log(revertArray([4, 5, 6, 7]));
console.log(revertArray([8, 9, 10, 11]));

const revertArrayInPlace = (array) => {
	for (let i = 0; i < Math.floor(array.length / 2); i++) {
		[array[i], array[array.length - 1 - i]] = [
			array[array.length - 1 - i],
			array[i],
		];
	}
	return array;
};

console.log("Revert Array in Place:");
console.log(revertArrayInPlace([1, 2, 3, 4]));
console.log(revertArrayInPlace([4, 5, 6, 7]));
console.log(revertArrayInPlace([8, 9, 10, 11]));

class Vector {
	constructor(x, y, z) {
		this.x = x;
		this.y = y;
		this.z = z;
	}

	sum(vector) {
		const x = vector.x + this.x;
		const y = vector.y + this.y;
		const z = vector.z + this.z;
		return new Vector(x, y, z);
	}

	res(vector) {
		const x = vector.x - this.x;
		const y = vector.y - this.y;
		const z = vector.z - this.z;
		return new Vector(x, y, z);
	}

	setMagnitude() {
		this.magnitude = Math.sqrt(this.x ** 2 + this.y ** 2 + this.z ** 2);
		return this.magnitude;
	}

	getUnitVector() {
		const x = this.x / this.magnitude;
		const y = this.y / this.magnitude;
		const z = this.z / this.magnitude;
		return new Vector(x, y, z);
	}

	multiply(num) {
		const x = this.x * num;
		const y = this.y * num;
		const z = this.z * num;
		return new Vector(x, y, z);
	}

	isOctagonal(vector) {
		if (this.x * vector.x + this.y * vector.y + this.z * vector.z === 0) {
			return true;
		}
		return false;
	}
}

const vec1 = new Vector(1, 2, 3);
const vec2 = new Vector(1, 2, 3);
const vectExtra = new Vector(2, 3, 4);
console.log("Vector: ", vec1);
console.log("Vector: ", vec2);
console.log("Vector: ", vectExtra);
console.log("Vector sum: ", vec1.sum(vec2));
console.log("Vector sum: ", vec2.sum(vec2));
console.log("Vector sum: ", vectExtra.sum(vec2));
console.log("Vector res: ", vec1.res(vec2));
console.log("Vector res: ", vec2.res(vec2));
console.log("Vector res: ", vectExtra.res(vec2));
vec1.setMagnitude();
vec2.setMagnitude();
vectExtra.setMagnitude();
console.log("Vector mag: ", vec1);
console.log("Vector mag: ", vec2);
console.log("Vector mag: ", vectExtra);
console.log("Vector UV: ", vec1.getUnitVector());
console.log("Vector UV: ", vec2.getUnitVector());
console.log("Vector UV: ", vectExtra.getUnitVector());
console.log("Vector mul: ", vec1.multiply(2));
console.log("Vector mul: ", vec2.multiply(2));
console.log("Vector mul: ", vectExtra.multiply(2));

const mcd = (num1, num2) => {
	const max = num1 < num2 ? num1 : num2;
	for (let i = max; i > 0; i--) {
		if (num1 % i === 0 && num2 % i === 0) {
			return i;
		}
	}
};

console.log("MCD: ", mcd(100, 80));
console.log(mcd(100, 80));
console.log(mcd(10, 9));
console.log(mcd(18, 9));

console.log("Octagonal:");
console.log(vec1.isOctagonal(vec2));
const vec3 = new Vector(1, 2, 3);
console.log(vec1.isOctagonal(vec3));
const vec4 = new Vector(4, 2, 3);
console.log(vec1.isOctagonal(vec4));

const hackerSpeak = (string) => {
	let hs = "";
	for (let i in string) {
		switch (string[i]) {
			case "o" || "O":
				hs = hs + 0;
				break;
			case "i" || "I":
				hs = hs + 1;
				break;
			case "e" || "E":
				hs = hs + 3;
				break;
			case "a" || "A":
				hs = hs + 4;
				break;
			case "s" || "S":
				hs = hs + 5;
				break;
			default:
				hs = hs + string[i];
		}
	}
	return hs;
};

console.log("Hacker Speak: ");
console.log(hackerSpeak("Javascript es divertido"));
console.log(hackerSpeak("Hola es divertido"));
console.log(hackerSpeak("Comer es rico"));

const fact = (num) => {
	const factArr = [];
	for (let i = num; i > 0; i--) {
		if (num % i === 0) {
			factArr.push(i);
		}
	}
	return factArr.reverse();
};

console.log("Fact: ");
console.log(fact(12));
console.log(fact(13));
console.log(fact(14));

const removeDuplicates = (array) => {
	return [...new Set(array)];
};

console.log("Remove Dup: ", removeDuplicates([1, 0, 1, 1, 0, 0]));
console.log(removeDuplicates([1, 0, 1, 1, 0, 0]));
console.log(removeDuplicates([1, 0, 0, 0, 0, 0]));
console.log(removeDuplicates([1, 0, 2, 2, 3, 3]));
