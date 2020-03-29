
    image_index=0
    sprite_index=spr_enemy_falling
    
    image_speed=.1
    alarm[11]=23
    x=argument0
    y=argument1
    
    can_push="no"
    
    
    if variable_local_exists("event_id")=1
    global.event[event_id]=1
    
    falling=1
