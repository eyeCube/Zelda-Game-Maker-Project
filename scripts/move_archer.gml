/*

based on move_sliding, but stays a certain distance from the target, always facing the target.



//arguments
//  0   speed
//  1   object to move towards
//  2   distance to change directions (should be low, 8-16)
    3   min distance the monster wants to be from target
    4   max distance the monster wants to be from target


variables
xt      direction x
yt      direction y
times_x, times_y    times going in that direction

*/




var xt, yt, times_x, times_y;
xt=1
yt=1
times_x=argument0
times_y=argument0
if argument1.x<x
xt=-1
if (argument1.y+2)<y
yt=-1



if point_distance(x,y,obj_link.x,obj_link.y)<argument3
{
    
    if image_index=0
    {
        xt=-1
    }
    if image_index=1
    {
        yt=1
    }
    if image_index=2
    {
        xt=1
    }
    if image_index=3
    {
        yt=-1
    }

}

if point_distance(x,y,obj_link.x,obj_link.y)>argument4
{
    
    if image_index=0
    {
        xt=1
    }
    if image_index=1
    {
        yt=-1
    }
    if image_index=2
    {
        xt=-1
    }
    if image_index=3
    {
        yt=1
    }

}



if point_distance(x,y,obj_link.x,obj_link.y)>argument3
if point_distance(x,y,obj_link.x,obj_link.y)<argument4
{

    if image_index=0
    or image_index=2
    times_x=0
    if image_index=1
    or image_index=3
    times_y=0

}


    /*
    if abs(argument1.y-y)<=argument2+1
    {
        times_x=0
    }
    if abs(argument1.x-x)<=argument2+1
    {
        times_y=0
    }
    */
    
    if abs(argument1.y-y)<=argument2
    if abs(argument1.x-x)>argument2
    {
        times_y=0
    }
    if abs(argument1.x-x)<=argument2
    if abs(argument1.y-y)>argument2
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
    if place_free(x+xt,y)
    {
        x+=xt
    }
}

repeat(floor(times_y))
{
    if place_free(x,y+yt)
    {
        y+=yt
    }
}

if place_free(x,y+ye)
    {
        y+=ye
    }
if place_free(x+xe,y)
    {
        x+=xe
    }
