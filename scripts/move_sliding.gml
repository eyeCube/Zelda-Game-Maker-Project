//movement by sliding along any barriers in the way. Does not move around objects effectively
//tends to make the object look like it's only moving in 1 of 8 directions
//(up, left, down, right, and diagonals)

//arguments
//  0   speed
//  1   object to move towards
//  2   distance to change directions (24 is good number)

/*
variables
xt      direction x
yt      direction y
times_x, times_y    times going in that direction
*/


direction=round(point_direction(x,y,obj_link.x,obj_link.y)/90)*90


var dist_change_dir;
dist_change_dir=argument2

if place_meeting(x,y,obj_barrier_par)
or place_meeting(x,y,obj_enemy_avoid_block)
dist_change_dir=1


var xt, yt, times_x, times_y, slide_x, slide_y;
xt=1
yt=1
times_x=argument0
times_y=argument0
slide_x=1
slide_y=1
if argument1.x<x
xt=-1
if (argument1.y+2)<y
yt=-1
//the +2 is cuz they wanna aim a little bit below Link's center, since his bounding box is off center.



if abs(argument1.y-y)<argument0
{
    times_y=1
}
if abs(argument1.x-x)<argument0
{
    times_x=1
}

if abs(argument1.y-y)<=1
{
    times_y=0
    slide_y=0
}
if abs(argument1.x-x)<=1
{
    times_x=0
    slide_x=0
}

if abs(argument1.y-y)<=dist_change_dir
if abs(argument1.x-x)>dist_change_dir
{
    times_y=0
}
if abs(argument1.x-x)<=dist_change_dir
if abs(argument1.y-y)>dist_change_dir
{
    times_x=0
}






var xe, ye;
xe=0
ye=0

if times_x mod 1 != 0
xe=(times_x mod 1)*xt
if times_y mod 1 != 0
ye=(times_y mod 1)*yt


repeat(floor(times_x))
{
    if place_meeting(x+xt,y,obj_barrier_par)=0
    and place_meeting(x+xt,y,obj_enemy_avoid_block)=0
    {
        x+=xt
    }
    else
    if slide_y=1
    if place_meeting(x,y+yt,obj_barrier_par)=0
    and place_meeting(x,y+yt,obj_enemy_avoid_block)=0
    {
        y+=yt
        exit
    }
}

repeat(floor(times_y))
{
    if place_meeting(x,y+yt,obj_barrier_par)=0
    and place_meeting(x,y+yt,obj_enemy_avoid_block)=0
    {
        y+=yt
    }
    else
    if slide_x=1
    if place_meeting(x+xt,y,obj_barrier_par)=0
    and place_meeting(x+xt,y,obj_enemy_avoid_block)=0
    {
        x+=xt
        exit
    }
}


if place_meeting(x,y+ye,obj_barrier_par)=0
and place_meeting(x,y+ye,obj_enemy_avoid_block)=0
    {
        y+=ye
    }
if place_meeting(x+xe,y,obj_barrier_par)=0
and place_meeting(x+xe,y,obj_enemy_avoid_block)=0
    {
        x+=xe
    }
