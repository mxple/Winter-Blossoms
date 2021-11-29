/// @desc screen_shake(magnitude, frames)

function screen_shake(strength,frames){
	with (o_camera) {
		if (strength > shakeRemain) {
			shakeStrength = strength;
			shakeRemain = strength;
			shakeLength = frames;
		}
	}
}