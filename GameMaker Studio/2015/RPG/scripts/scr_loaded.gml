////////////////////
// Loading
////////////////////
/*ini_open(saveFile);
num = ini_read_real("Save", "count", 0);            //get the number of instances
room_goto(ini_read_real("Save", "room", World));    // loads room last used
for ( i = 0; i < num; i += 1)
{
     myID = ini_read_real( "Save", "object" + string(i), 0);        //loads id from file
     myX = ini_read_real( "Save", "object" + string(i) + "x", 0);   //loads x from file
     myY = ini_read_real( "Save", "object" + string(i) + "y", 0);   //loads y from file
          
     instance_create( myX, myY, myID);
}
ini_close();*/

//file = get_open_filename("*.*", "saveFile.ini");
file = "save1.ini";
ini_open(file);

if(room == rm_main_menu) {
        
        // Load required objects to start playing.
        scr_instanceload();
        
        obj_controller.playerX = ini_read_real("Save", "Player x", obj_controller.playerX); // sets players x position from save file
        obj_controller.playerY = ini_read_real("Save", "Player y", obj_controller.playerY); // sets player y position from save file
        Player1.x = obj_controller.playerX;
        Player1.y = obj_controller.playerY;
        Player1.level = ini_read_real("Save", "Level", 1);
        Player1.money = ini_read_real("Save", "Money", 0);
        Player1.experience = ini_read_real("Save", "Experience", 0);
        Player1.health_max = ini_read_real("Save", "Health", 100);
        Player1.atk = ini_read_real("Save", "Damage", Player1.atk);
        Player1.damage = Player1.atk;
           
        rm = ( ini_read_real("Save", "Room", rm_cave1) );
        room_set_persistent(rm, true);
        
        ///////////////////
        // Play Music
        /////////////////// 
        
        if ( audio_is_playing(music_current) )  // Stop menu music before starting new game.
            audio_stop_sound(music_current);
       
        if (rm == rm_cave1 || 
            rm == rm_cave2 || 
            rm == rm_cave3 || 
            rm == rm_cave4 ||       // Check the room that is being loaded to play appropriate music.
            rm == rm_cave5 ||
            rm == rm_cave6 || 
            rm == rm_caveT1 || 
            rm == rm_caveT1LS || 
            rm == rm_caveTBoss || 
            rm == rm_cave5Side   ) {
            
                audio_play_sound(music_cave, 10, true);         // Start new music track.
                audio_sound_gain(music_cave, music_volume, 0);  // Set default volume.   
                music_current = music_cave;
            }
        
        if (rm == rm_Maze1L ||
            rm == rm_Maze2L ||
            rm == rm_Maze3  ||      // Check the room that is being loaded to play appropriate music.
            rm == rm_Maze4  ||
            rm == rm_Maze5  ||
            rm == rm_Maze6    ) {
            
                audio_play_sound(music_jungle, 10, true);         // Start new music track.
                audio_sound_gain(music_jungle, music_volume, 0);  // Set default volume.
                music_current = music_jungle;
            }
        
        // Go to room.
        room_goto(rm);
        
        //room_goto(ini_read_real("Save", "Room", rm_cave1) );
        
        // Set Player's max health pool to appropriate level after loading.
        Player1.health = Player1.health_max;
}
else {
        obj_controller.playerX = ini_read_real("Save", "Player x", obj_controller.playerX); // sets players x position from save file
        obj_controller.playerY = ini_read_real("Save", "Player y", obj_controller.playerY); // sets player y position from save file
        global.unpause_room = ini_read_real("Save", "Room", rm_cave1);                      // room player will be located after loading. if no save file, defaults to level 1 
        Player1.level = ini_read_real("Save", "Level", 1);
        Player1.money = ini_read_real("Save", "Money", 0);
        Player1.experience = ini_read_real("Save", "Experience", 0);
        Player1.health_max = ini_read_real("Save", "Health", 100);
        Player1.atk = ini_read_real("Save", "Damage", Player1.atk);
        Player1.damage = Player1.atk;
        Player1.health = Player1.health_max;
        
        ///////////////////
        // Play Music
        /////////////////// 
        if ( audio_is_playing(music_current) )  // Stop menu music before starting new game.
            audio_stop_sound(music_current);
            
        rm = global.unpause_room;   // Set rm to room being loaded.
           
        if (rm == rm_cave1 || 
            rm == rm_cave2 || 
            rm == rm_cave3 || 
            rm == rm_cave4 ||       // Check the room that is being loaded to play appropriate music.
            rm == rm_cave5 ||
            rm == rm_cave6 || 
            rm == rm_caveT1 || 
            rm == rm_caveT1LS || 
            rm == rm_caveTBoss || 
            rm == rm_cave5Side   ) {
            
                audio_play_sound(music_cave, 10, true);         // Start new music track.
                audio_sound_gain(music_cave, music_volume, 0);  // Set default volume.   
                music_current = music_cave;
            }
        
        if (rm == rm_Maze1L ||
            rm == rm_Maze2L ||
            rm == rm_Maze3  ||      // Check the room that is being loaded to play appropriate music.
            rm == rm_Maze4  ||
            rm == rm_Maze5  ||
            rm == rm_Maze6    ) {
            
                audio_play_sound(music_jungle, 10, true);         // Start new music track.
                audio_sound_gain(music_jungle, music_volume, 0);  // Set default volume.
                music_current = music_jungle;
            }
}

window_set_cursor(cr_none);         // Disable the mouse cursor while not in menu.

ini_close();
