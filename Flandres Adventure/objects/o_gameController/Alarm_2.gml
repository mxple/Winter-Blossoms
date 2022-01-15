/// @description Insert description here
alarm_set(2, time2);

if room = Room2{

	var randomX = irandom_range(VIEW_X-100, VIEW_X+VIEW_W+100);
	var randomY = irandom_range(VIEW_Y-50, VIEW_Y+VIEW_H+50);
	part_particles_create(global.particles_main_system, randomX, randomY, particle_firefly, 1);
} 