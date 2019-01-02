
///////////////
// Resume
///////////////
if (obj_controller.pause)
{
    obj_controller.pause = false;
    room_goto(global.unpause_room);      // goes to previous room when resuming, aka the current room
    Player1.x = obj_controller.playerX;  // sets the player x position to the stored x value. if loading, playerX is modified so this will move the player to the loaded position
    Player1.y = obj_controller.playerY;  // sets the player y position to the stored y value. if loading, playerY is modified so this will move the player to the loaded position
    Player1.visible = true;              // because Player1 is persistent, this makes the sprite visible again when the player resumes the game
    obj_gui.visible = true;              // because the gui is persistent, this makes the healthbar visible again when the player resumes the game
    obj_weapon.visible = true;           // because the weapon object is persistent, this makes the sprite visible again when the player resumes the game
    audio_sound_gain(music_current, music_volume, 100);     // Restore music volume when leaving menu.
    window_set_cursor(cr_none);          // Disable mouse cursor.
}

///////////////
// Pause
///////////////
else if (!obj_controller.pause)
{
    global.unpause_room = room;
    obj_controller.playerX = Player1.x;  // stores players x position, can be modified by loading before resuming game
    obj_controller.playerY = Player1.y;  // stores players y position, can be modified by loading before resuming game
    obj_controller.pause = true;         
    Player1.visible = false;             // because Player1 is persistent, this makes the sprite invisible while pause is active
    obj_weapon.visible = false;          // because the weapon object is persistent, this makes the sprite invisible while pause is active
    obj_gui.visible = false;             // because the gui object is persistent, this makes the healthbar invisible while pause is active
    audio_sound_gain(music_current, music_volume_faded, 100);   // Dim music volume while in menu.
    room_goto(rm_pause);                 // load the pause room
    window_set_cursor(cr_default);       // Enable mouse cursor.
}
