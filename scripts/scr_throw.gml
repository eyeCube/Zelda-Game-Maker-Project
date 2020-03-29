//throwing stuff like pots and rocks


if dead=1
exit
if sprite_index!=spr_link_holding
exit
if held>0
exit
if instance_exists(obj_thrown_object)=1
exit



sprite_index=spr_link_cutting
hurt_sprite=spr_link_cutting_hurt
image_index_drawn=image_index
can_move=0
image_speed=0
alarm[1]=3
alarm[0]=6
lift=0


with lift_obj
{
    if type='thrown'
    {
    
        obj=instance_create(x,y+8,obj_thrown_object)
        obj.z=14
        
        if sprite_index=spr_beamos
        {
            obj.y+=8
            
            obj.timer=timer
            obj.damage=damage
            obj.knockback=knockback
            obj.size=size
            
            if position_meeting(x,y+16,obj_barrier_par)
            {
            with obj move_outside_solid(90,8)
            }
            if position_meeting(x,y,obj_barrier_par)
            {
            with obj move_outside_solid(180,8)
            }
            if position_meeting(x-8,y,obj_barrier_par)
            {
            with obj move_outside_solid(0,8)
            }
            
        }
        
        else
        {
        
            if position_meeting(x,y+16,obj_barrier_par)
            {
            with obj move_outside_solid(90,8)
            }
            if position_meeting(x+16,y,obj_barrier_par)
            {
            with obj move_outside_solid(180,16)
            }
            if position_meeting(x-8,y,obj_barrier_par)
            {
            with obj move_outside_solid(0,8)
            }
            if position_meeting(x,y-8,obj_barrier_par)
            {
            with obj move_outside_solid(270,8)
            }
        
        }
        
        obj.contents=contents
        obj.contents_chance=contents_chance
        obj.image_index_random=image_index_random
        obj.image_index=image_index
        obj.particle_sprite=particle_sprite
        
        obj.move_speed=global.link_throw-weight+1
    
    }
    
    if type='bomb'
    {
        obj=instance_create(x,y+12,obj_bomb)
        obj.size=size
        obj.damage=damage
        obj.knockback=knockback
        obj.timer=timer
        obj.alarm[1]=max(1,alarm[1])
        obj.mode=mode
        obj.bounciness=bounciness
        obj.move_dir=obj_link.image_index*90
        obj.z=14
        obj.move_speed=global.link_throw_bombs
        
            if obj_link.image_index!=1
            with obj
            {
                if place_meeting(x,y,obj_barrier_par)
                {
                    move_outside_solid(270,12)
                }
            }
            else
            with obj
            {
                if place_meeting(x,y,obj_barrier_par)
                {
                    if place_meeting(x-8,y,obj_barrier_par)
                    {
                        move_outside_solid(0,12)
                    }
                    else
                    if place_meeting(x+8,y,obj_barrier_par)
                    {
                        move_outside_solid(180,12)
                    }
                }
            }
    }
    
    obj.jump=1
    obj.z_change=2
    obj.direction=obj_link.image_index*90
    obj.weight=weight
    obj.sprite_index=sprite_index
    
    create_loot=0
    instance_destroy()
}
