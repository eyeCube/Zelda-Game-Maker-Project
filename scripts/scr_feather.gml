if sprite_index=spr_link_walking
or sprite_index=spr_link_pushing
{

    if jump=0
    if dead=0
    if held=0
    if likeliked=0
    {
    
        burned=0
        
        
        jump=1
        z_change=global.link_jump_height-global.link_wet_jump_penalty*wet
        
        imagespeed=0
        imagexflip=1
        imageyflip=1
        imageangle=0
        imagespin=0
        
        if wet=0
        jump_speed=global.link_jump_speed-((global.link_speed_boost>0)*global.link_boost_jump_penalty)
        else
        {
            jump_speed=global.link_jump_speed_wet
            scr_splash(x+xg,y+yg+4)
        }
        
        alarm[6]=alarm6
        
        image_index_revert=image_index
        
        
        jump_dir=image_index*90
        jump_dir_real=aim
        
        if check_up=0
        if check_down=0
        if check_left=0
        if check_right=0
        {
            jump_dir_real=-1
        }
        
        
            if image_index=0
            {
            sprite_index=spr_link_rolling_horizontal
            hurt_sprite=spr_link_rolling_horizontal_hurt
            imagespin=-90
            }
            
            if image_index=1
            {
            sprite_index=spr_link_rolling_vertical
            hurt_sprite=spr_link_rolling_vertical_hurt
            imagespeed=1
            }
            
            if image_index=2
            {
            sprite_index=spr_link_rolling_horizontal
            hurt_sprite=spr_link_rolling_horizontal_hurt
            imagespin=90
            imagexflip=-1
            }
            
            if image_index=3
            {
            sprite_index=spr_link_rolling_vertical
            hurt_sprite=spr_link_rolling_vertical_hurt
            imagespeed=1
            imageyflip=-1
            }
            
            image_index=0
        
    }
    
}
