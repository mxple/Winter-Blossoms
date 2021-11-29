
function approach(a, b, amount) {
    return (a + clamp(b - a, -amount, amount));
}

function wave(from, to, duration, offset) {
	var a4 = (to-from)/2;
	return from + a4 + sin((((current_time * 0.001) + duration + offset) / duration) * (pi*2)) * a4;
}

function within(myVar, searchList) {
	for (var i = 0; i<array_length_1d(searchList); i++) {
		if myVar == searchList[i] return true
	}
	return false;
}