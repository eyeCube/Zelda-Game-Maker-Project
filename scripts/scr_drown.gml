if dead=0
{

    if position_meeting(x,y,obj_teleporter)=0
    {
        dead=1
    }
    else
    {
        global.link_image_index=image_index
        global.link_aim=aim
    }
                
    image_index=0
    image_index_mod=0
    sprite_index=sprite_drown
    image_speed=.33
    stunned=0
    stopped=0
    shocked=0
    frozen=0
    burned=0
    
    can_move=0
    
    knockback=0
    
    depth=15
    
    scr_splash(x,y)
    
    


if position_meeting(x,y,obj_teleporter)=1
with instance_position(x,y,obj_teleporter)
{
    
    if tele=0
    {
            alarm[1]=alarm1
            
            tele=1
            
            with obj_enemy_par
            {
                stunned=30
                stopped=30
            }
            
            
            if link_xto=-1
            global.link_x=obj_link.x
            else
            global.link_x=link_xto
            
            if link_yto=-1
            global.link_y=obj_link.y
            else
            global.link_y=link_yto
            
            
            
            
            
            global.link_z=144
            
            
            
            if variable_local_exists("move_outside")=1
            global.link_move_outside=1
            else
            global.link_move_outside=0
            
            
            if variable_local_exists("event_id")=1
            global.event[event_id]=1
    
    }
}

}
