//mask_index = s_PlayerHB
//declare methods
event_user(15);

//input
acceptingInput = true;
input = {}
check_inputs();
 
//init sprites
sprites = {}
init_sprites(
	"idle"			,	s_playerIdle,
	"running"		,	s_playerRun,
	"jumping"		,	s_playerJump,
	"falling"		,	s_playerFall,
	"softLanding"	,	s_playerSoftLand,
	"hardLanding"	,	s_playerHardLand,
	"dying"			,	s_playerDeath,
	"attack1"		,	s_playerAttackOne,
	"attack2"		,	s_playerAttackTwo,
	"attack3"		,	s_playerAttackThree,
	"paused"		,	undefined
);

//physics constants
walkSpeed = 5;
jumpSpeed = -13;
minJump = 6;

grav = .7;
dragcoef = 10;

accel = 0.7;
deccel = 0.4;
coyote = 4;

//variables
jump = false;
drag = 0;

hsp = 0;
vsp = 0;
hspRemaining = 0;
vspRemaining = 0;

hitByAttack = ds_list_create();
combo = false;
flash = 0;


//drawing
image_index = 0;
image_speed = 0.12; //12 fps
dir = 1;

//state machine
fsm = new SnowState("paused");

fsm.
	event_set_default_function("draw", 
		function() {
			draw_sprite_ext(sprite_index, image_index, x, y, dir*image_xscale, image_yscale, 0, image_blend, image_alpha);
		})
	.add("idle", {
		enter: function() {
			sprite_index = sprites[$ fsm.get_current_state()];
			image_index = 0;
			jump = true;
		},
		step: function() {
			hsp = lerp(hsp, 0, deccel);
			collide_x();
			collide_y();		
		}
	})
	.add("running", {
		enter: function() {
			sprite_index = sprites[$ fsm.get_current_state()];
			image_index = 0;
			jump = true;
		},
		step: function() {
			player_move_x();
			apply_gravity();
			collide_x();
			collide_y();	
			if (image_index == 2 or image_index == 6) audio_play_sound(choose(sfxStep1,sfxStep2,sfxStep3),1,false);
		}
	})
	.add("jumping", {
		enter: function() {
			sprite_index = sprites[$ fsm.get_current_state()];
			image_index = 0;
			audio_play_sound(sfxJump,0,false);
			vsp+=jumpSpeed;
			jump = false;
		},
		step: function() {
			player_move_x();
			if (vsp < 0) && (!keyboard_check(global.KEY_JUMP)) vsp = max(vsp,jumpSpeed/minJump);
			apply_gravity();
			collide_x();
			collide_y();
		}
	})
	.add("falling", {
		enter: function() {
			sprite_index = sprites[$ fsm.get_current_state()];
			image_index = 0;
		},
		step: function() {
			player_move_x();
			apply_gravity();
			collide_x();
			collide_y();
		},
		leave: function() {
			var timeFalling = fsm.get_time(false);
			if timeFalling > 50 {
				screen_shake(8);
			} else if timeFalling > 30 {
				screen_shake(1.5);
			}
		}
	})
	.add("softLanding", {
		enter: function() {
			sprite_index = sprites[$ fsm.get_current_state()];
			image_index = 0;
			jump = true;
		},
		step: function() {
			player_move_x();
			apply_gravity();
			collide_x();
			collide_y();	
		}
	})
	.add("hardLanding", {
		enter: function() {
			sprite_index = sprites[$ fsm.get_current_state()];
			image_index = 0;
			audio_play_sound(sfxStep1Loud,1,false);
		}
	})
	.add("dying", {
		enter: function() {
			sprite_index = sprites[$ fsm.get_current_state()];
			image_index = 0;
			global.pausing = false;
			//audio_play_sound();
		},
		step: function() {
			hsp = approach(hsp, 0, .1);
			audio_master_gain((sprite_get_number(sprite_index)-image_index)/10);
			apply_gravity();
			collide_x();
			collide_y();
			if animation_end() {
				image_speed=0;	
				room_transition(Game_Over,TRANSMODE.OUT);
			}
		}
	})
	.add("attack1", {
		enter: function() {
			sprite_index = sprites[$ fsm.get_current_state()];
			image_index = 0;
			jump = false;
			ds_list_clear(hitByAttack);
			audio_play_sound(choose(sfxWeaponSwoosh1,sfxWeaponSwoosh2),1,false);
			if againstWall screen_shake(3,20);
		},
		step: function() {
			//anim curves!!?
			if image_index < 1 {
				hsp = 7*dir;
				vsp = 0
				screen_shake(1);
			}
			else hsp = 0;
			
			apply_gravity();
			collide_x();
			collide_y();
			attack(s_playerAttackOneHB,2);
			
			if INPUT_ATTACK combo = true;
		}
	})
	.add("attack2", {
		enter: function() {
			sprite_index = sprites[$ fsm.get_current_state()];
			image_index = 0;
			jump = false;
			ds_list_clear(hitByAttack);
			audio_play_sound(choose(sfxWeaponSwoosh3,sfxWeaponSwoosh4),0,false);
		},
		step: function() {
			//replace later
			if image_index < 1 {
				hsp = 10*dir;
				vsp = 0;
				screen_shake(2);
			}
			else if !combo {
				vsp = 0;
				hsp = 0;
			} else hsp = approach(hsp, 0, 1);
			
			apply_gravity();
			collide_x();
			collide_y();
			attack(s_playerAttackTwoHB,3);
			if againstWall and image_index==4 screen_shake(4,25);
			if INPUT_ATTACK combo = false;
		}
	})
	.add("attack3", {
		enter: function() {
			sprite_index = sprites[$ fsm.get_current_state()];
			image_index = 0;
			jump = false;
			ds_list_clear(hitByAttack);
		},
		step: function() {
			if image_index < 4 {
				hsp = 0;
				vsp = 0;
			} else if image_index = 4 {
				hsp = 160*dir;
				screen_shake(5);
			} else {
				hsp = 0.5*dir;
			}
			collide_x();
			collide_y();
			if againstWall and image_index==4 screen_shake(7,30);
			attack(s_playerAttackThreeHB,5);
			if(image_index == 5) audio_play_sound(sfxWeaponSwoosh5,1,false);
			
		},
		leave: function() {
			//formality
			combo = false;
		}
	})
	.add("paused", {
		enter: function() {
			image_speed = 0;
			maskHB = mask_index;
			mask_index = noone;
		},
		step: function() {
			//unpause
			//if !global.pause fsm.change(fsm.get_previous_state(), undefined, function() {} );
		},
		leave: function() {
			//change mnum
			image_speed = 0.12;	
			mask_index = maskHB;
		}
	})
	.add_transition("jump", ["idle","running","softLanding"], "jumping")
	.add_transition("coyote", "falling", "jumping", function() { return (tileMeetingPrecise(x, y+coyote, "Collisions")); }, function() { vsp = 0; show_debug_message("coyote"); })
	.add_transition("attack", ["idle","running","jumping","falling","softLanding"], "attack1")
	.add_transition("transition", "jumping", "running", function() { return ((on_ground) and vsp > 0); })
	.add_transition("transition", "idle", "running", function() { return (input.hmove != 0); })
	.add_transition("transition", "attack1", "attack2", function() { return (animation_end() and combo); })
	.add_transition("transition", "attack2", "attack3", function() { return (animation_end() and !combo); })
	.add_transition("transition", ["jumping","running","idle"],"falling", function() { return (vsp > 4 and !on_ground); })
	.add_transition("transition", "idle","falling", function() { return (!on_ground); })
	.add_transition("transition", ["attack1","attack2","attack3"], "falling", function() { return (animation_end() and !on_ground); })
	.add_transition("transition", ["hardLanding","softLanding","attack1","attack2","attack3"], "running", function() { return (animation_end() and input.hmove); })
	.add_transition("transition", ["hardLanding","softLanding","attack1","attack2","attack3"], "idle", function() { return (animation_end()); })
	.add_transition("transition", "running", "idle", function() { return (on_ground and input.hmove == 0); })
	.add_transition("transition", "falling", "hardLanding", function() { return (on_ground and fsm.get_time(false) > 50); })
	.add_transition("transition", "falling", "softLanding", function() { return (on_ground); })
	.add_wildcard_transition("death", "dying", function() { return (fsm.get_current_state() != "dying"); })
	.add_wildcard_transition("pause", "paused");
