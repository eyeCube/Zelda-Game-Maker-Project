if aggro=0

{

    if point_distance(x,y,argument0.x,argument0.y)<argument1
    {
        var pd;
        pd=point_direction(x,y,obj_link.x,obj_link.y)
        
        if image_index=0
        if pd>=(360-argument2)
        or pd<=argument2
        aggro=1
        if image_index=1
        if pd>=(90-argument2)
        if pd<=(90+argument2)
        aggro=1
        if image_index=2
        if pd>=(180-argument2)
        if pd<=(180+argument2)
        aggro=1
        if image_index=3
        if pd>=(270-argument2)
        if pd<=(270+argument2)
        aggro=1
        
        if aggro=1
        {
            x=round(x)
            y=round(y)
        }
    }

}
