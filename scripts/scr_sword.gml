//SWINGING THE SWORD


/*
argument0: sprite
argument1: damage
argument2: key sword is assigned to
argument3: light damage
argument4: extra force
*/


if dead=1
exit
if sprite_index=spr_link_shooting
exit
if instance_exists(obj_links_magic_rod)
exit
if bombing=1
exit


if likeliked=0
if held<=0
{



if sprite_index=spr_link_walking
or sprite_index=spr_link_pushing
or sprite_index=spr_link_cutting
{

    with obj_links_sword instance_destroy()

    //when you swing your sword you douse the fire
    burned=0
    
    
    image_index_drawn=image_index
    sprite_index=spr_link_cutting
    hurt_sprite=spr_link_cutting_hurt
    can_move=0
    image_speed=0
    alarm[1]=3 //sprite index changes
    alarm[11]=4 //can move after this many frames
    alarm[0]=6 //sprite returns to normal
    
    
    obj=instance_create(round(x),round(y)-round(z),obj_links_sword)
    
    obj.charge_button=argument2

    obj.alarm[2]=2
    obj.alarm[3]=3
    obj.alarm[4]=4
    obj.alarm[10]=5
    
    obj.sprite_index=argument0
    if obj.sprite_index=spr_links_sword_master
    {
    
        obj.damage=argument1
        /*if global.essence_din_active=0
        if global.essence_nayru_active=0
        if global.essence_farore_active=0
        obj.damage=argument1*/
        
        obj.fire=global.essence_din_active*global.essence_din_fire
        obj.shock=global.essence_nayru_active*global.essence_nayru_shock
        obj.poison=global.essence_farore_active*global.essence_farore_poison
        
        obj.light=argument3
        obj.force=argument4
        
        
        if global.essence_din_active=1
        obj.sprite_index=spr_links_sword_master_din
        if global.essence_nayru_active=1
        obj.sprite_index=spr_links_sword_master_nayru
        if global.essence_farore_active=1
        obj.sprite_index=spr_links_sword_master_farore
    
    }
    
    else
    {
        obj.damage=argument1
        obj.fire=0
        obj.light=0
        obj.beam=0
        obj.shock=0
        obj.poison=0
        obj.force=argument4
    }
    
    
    obj.ice=0
    
    obj.beam=((global.link_life/global.link_life_max)>=1)*global.link_sword_beam
    
    obj.direction=aim
    
    //debug
    while image_index<0 image_index+=4
    
    
        if (image_index mod 4)=0
        {
        if argument0=spr_links_sword_razor
        {
            obj.image_index=8
            obj.image_index_1=9
            obj.image_index_2=10
        }
        else
        {
            obj.image_index=5
            obj.image_index_1=4
            obj.image_index_2=3
        }
        
        
        
        obj.x+=swordxt1[0]
        obj.y+=swordyt1[0]
        obj.xt2=swordxt2[0]
        obj.yt2=swordyt2[0]
        obj.xt3=swordxt3[0]
        obj.yt3=swordyt3[0]
        obj.xt4=swordxt4[0]
        obj.yt4=swordyt4[0]
        }
        if (image_index mod 4)=2
        {
        obj.image_index=5
        obj.image_index_1=6
        obj.image_index_2=0
        obj.x+=swordxt1[2]
        obj.y+=swordyt1[2]
        obj.xt2=swordxt2[2]
        obj.yt2=swordyt2[2]
        obj.xt3=swordxt3[2]
        obj.yt3=swordyt3[2]
        obj.xt4=swordxt4[2]
        obj.yt4=swordyt4[2]
        }
        if (image_index mod 4)=1
        {
        obj.image_index=3
        obj.image_index_1=4
        obj.image_index_2=5
        obj.x+=swordxt1[1]
        obj.y+=swordyt1[1]
        obj.xt2=swordxt2[1]
        obj.yt2=swordyt2[1]
        obj.xt3=swordxt3[1]
        obj.yt3=swordyt3[1]
        obj.xt4=swordxt4[1]
        obj.yt4=swordyt4[1]
        }
        if (image_index mod 4)=3
        {
        obj.image_index=0
        obj.image_index_1=1
        obj.image_index_2=2
        obj.depth=2
        obj.alarm[0]=3
        obj.x+=swordxt1[3]
        obj.y+=swordyt1[3]
        obj.xt2=swordxt2[3]
        obj.yt2=swordyt2[3]
        obj.xt3=swordxt3[3]
        obj.yt3=swordyt3[3]
        obj.xt4=swordxt4[3]
        obj.yt4=swordyt4[3]
        }

}





}
