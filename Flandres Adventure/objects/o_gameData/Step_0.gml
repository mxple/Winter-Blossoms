/// @description Insert description here
// You can write your code in this editor
if (room != Menu and room != Credits) {
	frames += 1;
	if frames > 360 {
		time += 0.1;
		frames = 1;
	}
}
pRoom = room;
pHealth = health;