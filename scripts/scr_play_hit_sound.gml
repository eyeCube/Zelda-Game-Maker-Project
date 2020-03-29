if global.var_life_previous-life<3
            {
                if global.var_life_previous-life!=0
                {
                    sound_stop(snd_hit_12)
                    sound_play(snd_hit_12)
                }
            }
            else
            if global.var_life_previous-life<5
            {
            sound_stop(snd_hit_34)
            sound_play(snd_hit_34)
            }
            else
            if global.var_life_previous-life<7
            {
            sound_stop(snd_hit_56)
            sound_play(snd_hit_56)
            }
            else
            if global.var_life_previous-life<9
            {
            sound_stop(snd_hit_78)
            sound_play(snd_hit_78)
            }
            else
            {
            sound_stop(snd_hit_9)
            sound_play(snd_hit_9)
            }
