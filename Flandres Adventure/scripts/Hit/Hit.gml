
function hit(damage){
	hp -= damage;
	flash = true;
	if (hp > 0)
	{
		state = ENEMYSTATE.HIT;
	}
	else
	{
		state = ENEMYSTATE.DEAD;
	}
}

