if timer <= 0 {
  speed = 0.5 + random(1);
  direction_target = direction + 180 + irandom_range(-90,90);
  timer = irandom_range(120,360);
  turn_speed = random_range(2,4);
} else {
  var angle_dif = angle_difference(direction, direction_target);
  direction -= min(abs(angle_dif),turn_speed) * sign(angle_dif);
  timer -= 1; 
}

if x<VIEW_X-150 x = VIEW_X+VIEW_W+100;
if x>VIEW_X+VIEW_W+150 x = VIEW_X-100;

if y<VIEW_Y-150 y = VIEW_Y+VIEW_H+100;
if y>VIEW_Y+VIEW_H+150 y = VIEW_Y-100;