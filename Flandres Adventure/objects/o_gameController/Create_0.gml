/// @description
particles_disabled = [Menu,Credits,rGameOver];
temp = 0;
timer1=0;
//music
current_song = sfxNone;
next_song = sfxNone;
loop = true;

//particles
global.particles_main_system = part_system_create();
//fog
time = 10;
alarm[1] = time;
fogSize = 1;
particle_fog = part_type_create();
part_type_shape(particle_fog, pt_shape_cloud);
part_type_size(particle_fog, fogSize, fogSize, 0, 0);
part_type_direction(particle_fog, 180, 180, 0, 0);
part_type_speed(particle_fog, -0.15, 0.2, 0, 0);		//SPEED
part_type_alpha3(particle_fog, 0.01,0.1,0.01);			//ALPHA
part_type_life(particle_fog, 120, 180);					//LIFE

//fireflies
time2 = 10;
alarm[2] = time;
particle_firefly = part_type_create();
part_type_shape(particle_firefly, pt_shape_disk);
part_type_size(particle_firefly, 0, 1, 0, 0.02);
part_type_direction(particle_firefly, 180, 180, 0, 0);
part_type_alpha3(particle_firefly, 0.01,0.3,0.01);			//ALPHA
part_type_life(particle_firefly, 120, 180);					//LIFE