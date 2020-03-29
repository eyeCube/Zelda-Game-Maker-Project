/*
arguments
0   jump speed
1   jump direction
2   jump gravity
*/




if jump=0 exit

/////////////////////////////////////////////////////////////


var xt, yt;
xt=lengthdir_x(argument0,argument1)
yt=lengthdir_y(argument0,argument1)


if object_index=obj_link
{
    if shifting_view=0
    {
    if place_meeting(x+xt,y,obj_barrier_par)=0
    x+=xt
    if place_meeting(x,y+yt,obj_barrier_par)=0
    y+=yt
    }
}
else
{
    

var go;
go=0

        if place_meeting(x+xt,y,obj_barrier_par)=0
        and place_meeting(x+xt,y,obj_enemy_avoid_block)=0
        go=1
        
        if go
        {
            x+=xt
        }
        else
        move_contact_solid(point_direction(0,0,xt,0),ceil(abs(xt)))
        
go=0
        if place_meeting(x,y+yt,obj_barrier_par)=0
        and place_meeting(x,y+yt,obj_enemy_avoid_block)=0
        go=1
        
        if go
        {
            y+=yt
        }
        else
        move_contact_solid(point_direction(0,0,0,yt),ceil(abs(yt)))
    
    
    
    if object_index=obj_enemy_par
    {
        //
        var bound;
        bound=2
        if x>view_xview+view_wview-bound
        x=view_xview+view_wview-bound
        if x<view_xview+bound
        x=view_xview+bound
        if y>view_yview+view_hview-bound
        y=view_yview+view_hview-bound
        if y<view_yview+bound
        y=view_yview+bound
        //
    }
    
}

z_change-=argument2*(z_change>-8)
z+=z_change

if z<=0
{

    
    if object_index=obj_link
    {
        if dead=0
        {   
                jump=0
                z=0
            if sprite_index!=spr_link_knocked_down
            sprite_index=spr_link_walking
            
            hurt_sprite=spr_link_walking_hurt
            image_index=image_index_revert
        }
    }
    else
    {
        jump=0
        z=0
    }
    
    
    if abs(z_change)>2
    {
        if variable_local_exists('bounciness')
        {
            z_change=abs(z_change)*bounciness
            jump=1
            if variable_local_exists('move_speed')
            move_speed=move_speed*2/3
            if variable_local_exists('irregular')=1
            {
                direction+=random(irregular*2)-irregular
                image_xscale=choose(1,-1)
            }
        }
        
        if variable_local_exists('fragility')
        {
            life-=fragility
        }
    }

}
