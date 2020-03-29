//based on move_patrol
//  --ignores solid objects

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


x+=lengthdir_x(argument0,direction)
y+=lengthdir_y(argument0,direction)
