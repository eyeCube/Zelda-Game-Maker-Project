//SWINGING THE MAGIC ROD (and wand)



//////////////////////////////////////////////////////////////////////////////////////////

if dead=1
exit
if sprite_index=spr_link_shooting
exit
if instance_exists(obj_links_magic_rod)
exit
if instance_exists(obj_links_sword)
exit


/////////////////////////////////////////////////////////////////////////////////////////////






if likeliked=0
if held<=0
{



if sprite_index=spr_link_walking
or sprite_index=spr_link_pushing
{
    
    sprite_index=spr_link_cutting
    hurt_sprite=spr_link_cutting_hurt
    image_index_drawn=image_index
    can_move=0
    image_speed=0
    alarm[1]=2
    alarm[0]=4
    
    obj=instance_create(x+xg,y+yg,obj_links_magic_rod)
    
    obj.alarm[2]=2
    obj.alarm[3]=3
    
    obj.sprite_index=argument0
    
    
    obj.spell="Magic"
    if global.essence_din_active=1
    {
        obj.spell="Fire"
        obj.fire_charge=global.magic_wand_fire_ball_charge
        obj.charge_requirement=global.magic_rod_fire_ball_charge
    }
    if global.essence_nayru_active=1
    {
        obj.spell="Ice"
        obj.fire_charge=global.magic_wand_ice_ball_charge
        obj.charge_requirement=global.magic_rod_ice_ball_charge
    }
    if global.essence_farore_active=1
    {
        obj.spell="Wind"
        obj.fire_charge=global.magic_wand_farore_charge
        obj.charge_requirement=global.magic_rod_farore_charge_time
    }
    
    obj.direction=aim
    if aim=135 or aim=225
    obj.direction=180
    if aim=45 or aim=315
    obj.direction=0
    
    //debug
    while image_index<0 image_index+=4
    

    
    
    if (image_index mod 4)=0
    {
    obj.image_index=5
    obj.image_index_1=4
    obj.image_index_2=3
    obj.x+=4
    obj.y+=-2
    obj.xt2=2
    obj.yt2=2
    obj.xt3=-1
    obj.yt3=5
    }
    if (image_index mod 4)=2
    {
    obj.image_index=5
    obj.image_index_1=6
    obj.image_index_2=0
    obj.x+=-3
    obj.y+=0
    obj.xt2=-2
    obj.yt2=2
    obj.xt3=0
    obj.yt3=2
    }
    if (image_index mod 4)=1
    {
    obj.image_index=3
    obj.image_index_1=4
    obj.image_index_2=5
    obj.x+=0
    obj.y+=0
    obj.xt2=-2
    obj.yt2=-2
    obj.xt3=-2
    obj.yt3=-1
    }
    if (image_index mod 4)=3
    {
    obj.image_index=0
    obj.image_index_1=1
    obj.image_index_2=2
    obj.depth=2
    obj.alarm[0]=3
    obj.x-=1
    obj.y+=0
    obj.xt2=2
    obj.yt2=2
    obj.xt3=3
    obj.yt3=2
    }

}





}
