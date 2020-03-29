//KEEPING THEM FROM OVERLAPPING


if global.show_inventory=1 exit


//with other enemies

var temp_var;
temp_var=collision_rectangle(x-spritewidth/3,y-spriteheight/3-z,x+spritewidth/3,y+spriteheight/3-z,obj_moblin,1,0)
temp_var=collision_rectangle(x-spritewidth/3,y-spriteheight/3-z,x+spritewidth/3,y+spriteheight/3-z,obj_moblin_sword,1,0)




if temp_var>0
if temp_var!=id
if abs(temp_var.z-z)<16
if (temp_var.direction+180 mod 360)!=direction //this is to keep them from pushing into each other if they're facing opposite ways
{

    if stunned>0 exit
    if dead=1 exit
    
    
    
    var temp1, temp2;
    
    temp1=lengthdir_x(move_speed*argument0,point_direction(temp_var.x,temp_var.y-temp_var.z,x,y-z))
    temp2=lengthdir_y(move_speed*argument0,point_direction(temp_var.x,temp_var.y-temp_var.z,x,y-z))
    
    
    if place_meeting(x+temp1,y+temp2,obj_barrier_par)=0
    if place_meeting(x+temp1,y+temp2,obj_enemy_avoid_block)=0
    {
    
        x+=temp1
        y+=temp2
        
    }

}
