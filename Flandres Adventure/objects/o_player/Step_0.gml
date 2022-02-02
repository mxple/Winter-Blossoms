/// @description Player Movement
//check inputs
check_inputs();
againstWall = tileMeetingPrecise(x+sign(dir), y, "Collisions");
on_ground = tileMeetingPrecise(x, y+1, "Collisions");

if hsp != 0 dir = sign(hsp);

//hp stuff
if y > room_height health = 0;
health = clamp(health,0,5);
flash = approach(flash,0, 1);

//step
fsm.step();

if input.jump {
					fsm.trigger("jump");
					fsm.trigger("coyote");
}
if input.atk		fsm.trigger("attack");
					fsm.trigger("transition");
if global.freeze and fsm.get_current_state() != "paused" {
					fsm.trigger("pause");
}
if health <= 0		fsm.trigger("death");
