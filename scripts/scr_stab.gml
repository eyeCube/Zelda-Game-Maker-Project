
    if obj_links_sword.dies_if_button_unpressed
    {
        obj_links_sword.hit=-40
        obj_links_sword.stab=8
        with obj_link
        {
            image_index_mod=1
            if image_index=3
            image_index_mod=0
        }
    }
