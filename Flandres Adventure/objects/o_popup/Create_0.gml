global.freeze = true;
global.pausing = false;

destroyInteractable = -1;

maxDarkenAlpha = 0.75;
maxSpriteAlpha = 1;
maxTextAlpha = 1;

upperText = "";
bottomText = "";
upperTextFont = menuFontSaves;
bottomTextFont = menuFontSaves;
textAlpha=-0.5;

sprite_index = noone;
spriteAlpha = -0.25;

spriteSize = 1;

sfx = sfxDing;
audio_play_sound(sfx,0,false);

darkenAlpha = 0;
darken = surface_create(GUI_W,GUI_H);

fsm = new SnowState("in");
fsm.
	event_set_default_function("draw", 
		function() {
			//draw darkened
			if !surface_exists(darken) darken = surface_create(GUI_W,GUI_H);
			surface_set_target(darken);
			draw_clear_alpha(c_black,darkenAlpha);
			surface_reset_target();
			draw_surface(darken,0,0);

			//draw text
			var c = c_white;
			draw_set_halign(fa_middle);

			draw_set_font(upperTextFont);
			draw_text_color(GUI_W/2,GUI_H/7,upperText,c,c,c,c,textAlpha+0.25);

			draw_set_font(bottomTextFont);
			draw_text_color(GUI_W/2,4*GUI_H/5,bottomText,c,c,c,c,textAlpha);

			//draw sprite
			draw_sprite_ext(sprite_index,0,GUI_W/2,GUI_H/3+(spriteAlpha*GUI_H/6),spriteSize,spriteSize,0,c_white,spriteAlpha);
		})
	.add("in", {
		step: function() {
			textAlpha = approach(textAlpha, maxTextAlpha, 0.02);
			spriteAlpha = approach(spriteAlpha, maxSpriteAlpha, 0.02);
			darkenAlpha = approach(darkenAlpha, maxDarkenAlpha, 0.02);
			if spriteAlpha >= 1 fsm.change("idle");
		}
	})
	.add("idle", {
		step: function() {
			if INPUT_SPECIAL fsm.change("out");	
		}
	})
	.add("out", {
		step: function() {
			textAlpha = approach(textAlpha, -1, 0.05);
			spriteAlpha = approach(spriteAlpha, -1, 0.05);
			darkenAlpha = approach(darkenAlpha, -1, 0.05);
			if darkenAlpha < 0 {
				o_player.acceptingInput = true;
				global.freeze = false;
				global.pausing = true;
				if destroyInteractable != -1 instance_destroy(destroyInteractable);
				instance_destroy();
			}
		}
	});
	