facingRight = (hsp>0);
facingDown = (vsp>0);

if (hsp>0) dir = 1;
else if (hsp<0) dir = -1;
if knockback dir *= -1
switch (state)
{
	case ENEMYSTATE.IDLE: EnemyState_Idle(); break;
	case ENEMYSTATE.HUNT: EnemyState_Hunt(); break;
	case ENEMYSTATE.JUMP: EnemyState_Jump(); break;
	case ENEMYSTATE.ATTACK: EnemyState_Attack(); break;
	case ENEMYSTATE.HIT: EnemyState_Hit(); break;
	case ENEMYSTATE.SPECIAL: EnemyState_Special(); break;
	case ENEMYSTATE.DEAD: EnemyState_Dead(); break;

}