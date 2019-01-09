
// Load required objects to start playing.
scr_instanceload();


// Starting area when making a new game.
room_goto(rm_cave1);


// Teleport player to starting location of area.
obj_controller.alarm[0] = 1;



// Stop menu music before starting new game.
if ( audio_is_playing(music_current) )
    audio_stop_sound(music_current);

// Play starting music.         
audio_play_sound(music_cave, 10, true);         // Start new music track.
audio_sound_gain(music_cave, music_volume, 0);  // Change Volume    
music_current = music_cave;


window_set_cursor(cr_none); // Disable mouse cursor while not in menu.
