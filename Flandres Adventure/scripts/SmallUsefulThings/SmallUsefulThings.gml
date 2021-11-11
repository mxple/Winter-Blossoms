
function approach(a, b, amount) {
    return (a + clamp(b - a, -amount, amount));
}