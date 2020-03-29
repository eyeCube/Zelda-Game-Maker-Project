if visible=0 exit



var temp_dir;
temp_dir=point_direction(obj_link.x,obj_link.y,x,y)



with obj_links_sword
{
    x+=obj_link.xg
    y+=obj_link.yg
}



            
if collision_rectangle(x-sprite_width/2+xg,y-sprite_height/2+yg-z,x+sprite_width/2+xg,y+sprite_height/2+yg-z,obj_links_sword,1,0)>0
{

    
    if obj_links_sword.alarm[2]<=0
    if obj_links_sword.hit>=0
    {
    
        if hit<=2
        {
        
        if invincible=0
        {
            
                var go, vt;
                go=0
                vt=10
                
                
                if forward_immune=1
                {
                    if image_index=0
                    if obj_link.x>x-vt
                    go=1
                    if image_index=1
                    if obj_link.y<y+vt
                    go=1
                    if image_index=2
                    if obj_link.x<x+vt
                    go=1
                    if image_index=3
                    if obj_link.y>y-vt
                    go=1
                }
                
                if obj_links_sword.damage>0
                if res_physical=0
                if sword_bounce=1
                go=1
                
                
                if go=1
                {
                    obj=instance_create(x,y-z,obj_particle)
                    obj.alarm[0]=3
                    obj_links_sword.hit=-4
                    
                    if forward_immune=1
                    {
                        stunned=max(physical_stun,stunned)
                        stopped=stunned
                    }
                    
                    if grabbed_link=0
                    {
                        knockback=(global.link_force+obj_links_sword.force)/mass*global.knockback_force
                        knockback_dir=temp_dir
                    }
            
                    with obj_link
                    {
                        knockback=other.sword_push_away*global.link_sword_kick*2
                        knockback_dir=temp_dir-180
                    }
                    
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        exit
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                }
            
            if object_index=obj_tektite
            {
                image_index=0
            }
            
            knockback=(global.link_force+obj_links_sword.force)/mass*global.knockback_force
            knockback_dir=temp_dir
            
            
            
            obj_links_sword.hit=1
            scr_stab()
            
            
            
            
            global.var_life_previous=life
            
            if physical_defense<obj_links_sword.damage
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
            }
            else
            stunned=max(physical_stun,stunned)
            stopped=stunned
            
            life-=obj_links_sword.shock*res_lightning_damage
            
            
    
            if life<global.var_life_previous
            {
            
                life-=obj_links_sword.light*res_light
                
                hit=global.link_sword_hit+extra_hit
                scr_play_hit_sound()
                
                
            
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

}



with obj_links_sword
{
    x-=obj_link.xg
    y-=obj_link.yg
}



