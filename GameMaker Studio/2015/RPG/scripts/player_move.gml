// Left Movement
if (keyboard_check(ord('A')))
{  
    // Player acceleration on movement
    hspeed -= player_accel_speed;
                            
    // Sprint when holding shift, otherwise walk
    if (keyboard_check(vk_shift))
    { 
                           
        if (keyboard_check(ord('W')) || keyboard_check(ord('S')) || keyboard_check(ord('D')))
        {
            stamina -= stamina_drain / 2;       // Set to half of the stamina drain because two keys are held down
        }                                       // Because two keys pressed doubles stamina gain. So stamina_drain / 2
        else
        {
            stamina -= stamina_drain;
        }
                                    
        if (stamina <= 0) hspeed = -player_move_speed;          // Can only sprint while running. If stamina is 0, caps move speed to walk speed
        if (hspeed < -6) hspeed = -player_run_speed;           // Caps movement speed at 6 when both sideways and upwards movement keys pressed
    }
    else
        if (hspeed < -3) hspeed = -player_move_speed;
}

// Left Movement
if (keyboard_check(ord('D')))
{  
    // Player acceleration on movement
    hspeed += player_accel_speed;
                            
    // Sprint when holding shift, otherwise walk
    if (keyboard_check(vk_shift))
    { 
                           
        if (keyboard_check(ord('W')) || keyboard_check(ord('S')) || keyboard_check(ord('A')))
        {
            stamina -= stamina_drain / 2;       // Set to half of the stamina drain because two keys are held down
        }                                       // Because two keys pressed doubles stamina gain. So stamina_drain / 2
        else
        {
            stamina -= stamina_drain;
        }
                                    
        if (stamina <= 0) hspeed = player_move_speed;          // Can only sprint while running. If stamina is 0, caps move speed to walk speed
        if (hspeed > 6) hspeed = player_run_speed;           // Caps movement speed at 6 when both sideways and upwards movement keys pressed
    }
    else
        if (hspeed > 3) hspeed = player_move_speed;
}

// Upwards movement
if (keyboard_check(ord('W'))) 
{
    // Player acceleration on movement
    vspeed -= player_accel_speed;
    
    // Sprint when holding shift, otherwise walk
    if (keyboard_check(vk_shift))
    {
    
        if (keyboard_check(ord('W')) || keyboard_check(ord('S')) || keyboard_check(ord('D')))
        {
            stamina -= stamina_drain / 2;       // Set to half of the stamina drain because two keys are held down
        }                                       // Because two keys pressed doubles stamina gain. So stamina_drain / 2
        else
        {
            stamina -= stamina_drain;
        }
        if (stamina <= 0) vspeed = -player_move_speed;          // Can only sprint while running. If stamina is 0, caps move speed to walk speed
        if (vspeed < -6) vspeed = -player_run_speed;           // Caps movement speed at 6 when both sideways and upwards movement keys pressed
    }
    else
        if (vspeed < -3) vspeed = -player_move_speed;

}

// Downwards movement
if (keyboard_check(ord('S'))) 
{
    // Player acceleration on movement
    vspeed += player_accel_speed;
    
    // Sprint when holding shift, otherwise walk
    if (keyboard_check(vk_shift))
    { 
    
        if (keyboard_check(ord('W')) || keyboard_check(ord('A')) || keyboard_check(ord('D')))
        {
            stamina -= stamina_drain / 2;       // Set to half of the stamina drain because two keys are held down
        }                                       // Because two keys pressed doubles stamina gain. So stamina_drain / 2
        else
        {
            stamina -= stamina_drain;
        }
        if (stamina <= 0) vspeed = player_move_speed;           // Can only sprint while running. If stamina is 0, caps move speed to walk speed
        if (vspeed > 6) vspeed = player_run_speed;             // Caps movement speed at 6 when both sideways and upwards movement keys pressed
    }  
    else 
        if (vspeed > 3) vspeed = player_move_speed;
}
