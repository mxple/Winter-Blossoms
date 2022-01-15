/// @description Setup Camera
// You can write your code in this editor
follow = o_player;
view_w_half = 0.5 * VIEW_W;
view_h_half = 0.5 * VIEW_H;
xTo = xstart;
yTo = ystart;

//parallax layers
bglayer1 = layer_get_id("bg1");
bglayer2 = layer_get_id("bg2");
bglayer3 = layer_get_id("bg3");
bglayer4 = layer_get_id("bg4");
bglayer5 = layer_get_id("bg5");

//screenshake
shakeLength = 0;
shakeStrength = 0;
shakeRemain = 0;
shakeBuffer = 8;