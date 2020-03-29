if invincible=1 exit

var temp_dir;
temp_dir=point_direction(obj_link.x,obj_link.y,x,y)
            

if collision_rectangle(x-sprite_width/2,y-sprite_height/2-z,x+sprite_width/2,y+sprite_height/2-z,obj_links_sword,1,0)>0
{

    
    if obj_links_sword.alarm[2]<=0
    {
    
        if hit<=0
        {
            
            global.var_life_previous=life
            
            obj_links_sword.hit=1
            scr_stab()
            
            life-=obj_links_sword.damage*res_physical
            life-=obj_links_sword.fire*res_fire
            burned=max(burned,(obj_links_sword.fire*res_fire*global.burn_time))
            
            if res_poison>0
            life-=round(obj_links_sword.poison*res_poison)
            poisoned=max(poisoned,(obj_links_sword.poison*res_poison*global.poison_time))
            
            
            shocked=round(obj_links_sword.shock*res_lightning*global.shock_time)
                if shocked>0
                {
                stunned=max(shocked,stunned)
                stopped=stunned
                }
                else
                stunned=max(physical_stun,stunned)
            life-=obj_links_sword.shock*res_lightning_damage
            
            knockback=(global.link_force+obj_links_sword.force)/mass*global.knockback_force
                    knockback_dir=temp_dir
            
            
            
            if life<global.var_life_previous
            {
            
                life-=obj_links_sword.light*res_light
            
                hit=global.link_sword_hit+extra_hit
                
                scr_play_hit_sound()
            
            
            
                //
                teleport+=teleport_amount_gained*random(1)
                //
                    
                
                if obj_links_sword.dies_if_button_unpressed=1
                if obj_links_sword.stab<=0
                {
                    with obj_links_sword instance_destroy()
                }
            
            }
                    
                    //if shocked>0
                    //hit=shocked
                
        }
        
        with obj_link
        {
            knockback=other.sword_push_away*global.link_sword_kick
            knockback_dir=temp_dir-180
        }
        
    }

}
