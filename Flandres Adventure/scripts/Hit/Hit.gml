// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Hit(damage){
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