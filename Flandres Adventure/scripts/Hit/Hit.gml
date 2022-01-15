
function hit(damage){
	hp -= damage;
	damageTaken = damage;
	knockback = true;
	if (hp > 0)
	{
		state = ENEMYSTATE.HIT;
	}
	else
	{
		state = ENEMYSTATE.DEAD;
	}
}

