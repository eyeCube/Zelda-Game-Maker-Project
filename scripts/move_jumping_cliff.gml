/*
arguments
0   jump speed
1   jump direction
2   jump gravity
*/




var xt, yt;
xt=lengthdir_x(argument0,argument1)
yt=lengthdir_y(argument0,argument1)


x+=xt
y+=yt

z_change-=argument2*(z_change>-8)
z+=z_change



if z<=0
{

    jump=0
    cliff_jump=0
    z=0
    
    //
    //MOVE OUTSIDE OF BARRIER PAR
    
    var move_out_dir;
    
    if jump_dir=0
    or jump_dir=180
    {
    if position_meeting(x,y-8,obj_barrier_par)=0
    move_out_dir=90
    else
    if position_meeting(x,y+8,obj_barrier_par)=0
    move_out_dir=270
    }
    if jump_dir=90
    or jump_dir=270
    {
    if position_meeting(x-8,y,obj_barrier_par)=0
    move_out_dir=180
    else
    if position_meeting(x+8,y,obj_barrier_par)=0
    move_out_dir=0
    }
    
    move_outside_solid(move_out_dir,14)
    
    //
    
    sprite_index=spr_link_walking
    hurt_sprite=spr_link_walking_hurt
    image_index=image_index_revert

}
