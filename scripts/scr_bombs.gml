//BOMBS



if dead=1 exit
if sprite_index=spr_link_shooting
or sprite_index=spr_link_cutting
or sprite_index=spr_link_holding
or sprite_index=spr_link_pulling
or sprite_index=spr_link_knocked_down
exit
if stunned>0 exit


if instance_number(obj_bomb)<2
if global.link_bomb_quantity>0
if likeliked=0
if held<=0
{

        if sprite_index=spr_link_walking
        or sprite_index=spr_link_pushing
        {
            if image_index=0
            {
            bomb_obj=instance_create(round(obj_link.xg+obj_link.x+lengthdir_x(6,obj_link.image_index*90+45)),round(obj_link.yg+obj_link.y+lengthdir_y(6,obj_link.image_index*90+45))+3,obj_bomb)
            }
            else
            {
            bomb_obj=instance_create(round(obj_link.yg+obj_link.x+lengthdir_x(6,obj_link.image_index*90-45)),round(obj_link.yg+obj_link.y+lengthdir_y(6,obj_link.image_index*90-45))+3,obj_bomb)
            bomb_obj.depth=2
            }
            
            bombing=1
            sprite_index=spr_link_cutting
            hurt_sprite=spr_link_cutting_hurt
            image_index_drawn=image_index
            can_move=0
            image_speed=0
            alarm[1]=3
            alarm[0]=4
            
            bomb_obj.timer=global.link_bomb_timer
            bomb_obj.alarm[1]=bomb_obj.timer/3
            
                if image_index=2
                bomb_obj.x-=2
        }
        
        else
        {
            bomb_obj=instance_create(round(obj_link.x),round(obj_link.y),obj_bomb)
            if z>0
            {
                bomb_obj.move_speed=max(check_left,check_right,check_up,check_down)*global.link_speed*global.link_throw_bombs_aerial_mod/(1+((jump_dir_real=-1) *    1   ))
                bomb_obj.move_dir=aim
                bomb_obj.z_change=z_change
                bomb_obj.jump=1
            }
            bomb_obj.z=z
            
            bomb_obj.timer=global.link_bomb_timer/3
            bomb_obj.alarm[1]=bomb_obj.timer/3
        }
    
        
        

    bomb_obj.damage=global.link_bomb_damage
    bomb_obj.size=global.link_bomb_radius
    bomb_obj.knockback=global.link_bomb_knockback            

    
    global.link_bomb_quantity-=1

}
