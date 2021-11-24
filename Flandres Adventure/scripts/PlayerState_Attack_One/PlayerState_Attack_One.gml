function PlayerState_Attack_One(){
	hsp = 0;
	vsp = 0;

	//start attack animation
	if (sprite_index != s_playerAttackOne)
	{
		sprite_index = s_playerAttackOne;
		image_index = 0;
		ds_list_clear(hitByAttack);
	}

	//check for hits
	mask_index = s_playerAttackOneHB;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x,y,o_enemy,hitByAttackNow,false);
	if (hits > 0)
	{
		for (var i = 0; i < hits; i++)
		{
			//if not yet hit by slash
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, hitID) == -1)
			{
				ds_list_add(hitByAttack, hitID);
				with (hitID)
				{
					Hit(2);
				}			
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
	mask_index = s_playerIdle;

	if (animation_end())
	{
		sprite_index = s_playerIdle;
		pState = PLAYERSTATE.FREE;
	}
}