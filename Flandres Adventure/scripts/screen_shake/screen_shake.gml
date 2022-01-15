/// @desc screen_shake(magnitude, frames)

function screen_shake(strength=4,frames=20) {
	if instance_exists(o_camera) {
		with (o_camera) {
			if (strength > shakeRemain) {
				shakeStrength = strength;
				shakeRemain = strength;
				shakeLength = frames;
			}
		}
	}
} 