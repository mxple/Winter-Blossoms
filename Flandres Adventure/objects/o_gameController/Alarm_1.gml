/// @description fog particle
alarm_set(1, time);

if !within(room,particles_disabled) {

	repeat(40) {
		var randomX = irandom_range(VIEW_X-700, VIEW_X+VIEW_W+700);
		var randomY = irandom_range(room_height-50,room_height+15);
		part_particles_create(global.particles_main_system, randomX, randomY, particle_fog, 1);
	}
	
} 