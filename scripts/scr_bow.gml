//shooting the bow



if dead=1
exit
if can_move=0
exit
if sprite_index=spr_link_shooting
exit


if likeliked=0
if can_shoot=1
if held<=0
{



    if sprite_index=spr_link_walking
    or sprite_index=spr_link_pushing
    {
    
        sprite_index=spr_link_shooting
        sprite_index_drawn=spr_link_shooting
        hurt_sprite=spr_link_shooting_hurt
        image_speed=0
        
        notched=0
        
        image_index_mod=0
        
        alarm[3]=global.link_bow_draw_time
    
    }





}
