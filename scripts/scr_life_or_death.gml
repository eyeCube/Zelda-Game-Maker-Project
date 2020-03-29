if life<=0
if dead=0
{

    dead=1
    
    speed=0
    if hit<death_timer
    hit=death_timer
    alarm[10]=death_timer
    
    image_index_to_draw=round(image_index)
    image_index-=image_speed
    image_speed=0

}
