/// @description Insert description here
// You can write your code in this editor
global.particles_snow_system = part_system_create_layer("Instances_1",0)
//snow
particle_snow = part_type_create();
part_type_sprite(particle_snow, s_snowflake2, 0, 0, 1);
part_type_size(particle_snow, .2, .7, 0, 0);
part_type_direction(particle_snow, 270, 270, 0, 15);
part_type_speed(particle_snow, 0.4, 0.6, 0, 0);
part_type_life(particle_snow, 350,500);
part_type_orientation(particle_snow, 0, 359, 0, 15, 0);
part_type_alpha3(particle_snow, 0.8,0.7,0.1);

particle_cloud = part_type_create();
part_type_shape(particle_cloud, pt_shape_cloud);
part_type_size(particle_cloud, 0.1, 0.4, 0.02,0);
part_type_orientation(particle_cloud, 0, 359, 0, 5, 0);
part_type_life(particle_cloud, 180, 240);
part_type_alpha3(particle_cloud, 0.001, 0.05,0.001);

emitter_snow = part_emitter_create(global.particles_snow_system);
emitter_cloud = part_emitter_create(global.particles_snow_system);
part_emitter_region(global.particles_snow_system, emitter_snow, 0, VIEW_X+VIEW_W+20, 0, 0, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(global.particles_snow_system, emitter_snow, particle_snow, 5);

part_emitter_region(global.particles_snow_system, emitter_cloud, 0, VIEW_X+VIEW_W+20, 0, VIEW_H, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(global.particles_snow_system, emitter_cloud, particle_cloud, -2);
part_system_automatic_draw(global.particles_snow_system,false);

repeat(300) {
	part_system_update(global.particles_snow_system);
}