/// @description Player Movement
//check inputs
hmove = INPUT_RIGHT-INPUT_LEFT;
againstWall = tileMeetingPrecise(x+sign(dir), y, "Collisions");
on_ground = tileMeetingPrecise(x, y+1, "Collisions");

if hsp != 0 dir = sign(hsp);

//hp stuff
if y > room_height health = 0;
health = clamp(health,0,5);
flash = approach(flash,0, 1);

//step
fsm.step();

if INPUT_JUMP		fsm.trigger("jump");
if INPUT_ATTACK		fsm.trigger("attack");
					fsm.trigger("transition");
if global.pause		fsm.trigger("pause");

show_debug_message(fsm.get_current_state()+"   "+string(vsp));