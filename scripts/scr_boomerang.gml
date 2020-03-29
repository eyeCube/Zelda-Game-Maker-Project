//BOOMERANGING


if dead=1
exit
if sprite_index=spr_link_shooting
exit



if instance_exists(obj_boomerang)=0
if held<=0
{

if sprite_index=spr_link_walking
or sprite_index=spr_link_pushing
or jump=1
{
        
        obj=instance_create(x+xg,y+yg,obj_boomerang)
        obj.direction=aim
        obj.initial_direction=aim
        obj.damage=global.link_boomerang_damage

        if jump=0
        {
            sprite_index=spr_link_cutting
            hurt_sprite=spr_link_cutting_hurt
            image_index_drawn=image_index
            can_move=0
            image_speed=0
            alarm[1]=3
            alarm[0]=6
        }
    
}

}
