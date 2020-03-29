//sword parry against Link.
//arg0:     id of entity wielding sword


if visible=0 exit
if argument0.aggro=0 exit
if argument0.hit>0 exit


var temp_dir;
temp_dir=point_direction(obj_link.x,obj_link.y,x,y)

if obj_links_sword.alarm[2]<=0
{
    
    if obj_links_sword.hit=0
    {
    
        obj=instance_create(mean(obj_links_sword.x,x),mean(obj_links_sword.y,y),obj_particle)
        obj.alarm[0]=3
    
            
            obj_links_sword.hit=-1
            scr_stab()
        
        
        with argument0
        {
            
            knockback=(global.link_force+obj_links_sword.force)/mass*global.knockback_force
            knockback_dir=temp_dir
            
        }
        
        
        //gets shocked if Link's sword is lightning enchanted
        if enemy_id.res_lightning>0
        if enemy_id.hit<=0
        if obj_links_sword.shock>0
        {
            //obj_links_sword.hit=1
        
            with enemy_id
            {
                global.var_life_previous=life
                
                shocked=max(shocked,obj_links_sword.shock*res_lightning*global.shock_time)
                stunned=shocked
                stopped=shocked
                life-=obj_links_sword.shock*res_lightning_damage
                hit=shocked
                
                scr_play_hit_sound()
            }
    
        }
            
    }
            
            
}
        
        with obj_link
        {
            knockback=argument0.sword_push_away*global.link_sword_kick+argument1
            knockback_dir=temp_dir-180
        }




