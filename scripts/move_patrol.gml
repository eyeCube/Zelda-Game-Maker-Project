//based on move_sliding, but doesn't move towards object.
//instead moves in random direction which changes.
//use in step event

//arguments
//  0   speed
//  1   how often to change direction (1-100, 100 being every step)
//  2   min time to change direction
//  3   value (should be negative) of when can_change_direction stops patroller. A very low value like -100 would mean that they would never stop, but just keep going.
//  4   directions the entity moves in

/*
vars
can_change_direction- set to random(30)*choose(1,-1) in creation event,
set it to subtract by 1 in Status in step event
set direction to random in create event
*/


if random(100)<argument1
if can_change_direction<=0
{
    direction=round((random(360)/(360/argument4)))*(360/argument4)
    
    can_change_direction=argument2
}


///////////////////////////////////////////////////////////////
if can_change_direction<argument3 exit
///////////////////////////////////////////////////////////////


var xt, yt;
xt=round(lengthdir_x(1,direction))
yt=round(lengthdir_y(1,direction))
times_x=argument0
times_y=argument0



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
    else
    {
        direction=round((random(360)/(360/argument4)))*(360/argument4)
        can_change_direction=argument2
    }
}

repeat(floor(times_y))
{
    if place_free(x,y+yt)
    {
        y+=yt
    }
    else
    {
        direction=round((random(360)/(360/argument4)))*(360/argument4)
        can_change_direction=argument2
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
