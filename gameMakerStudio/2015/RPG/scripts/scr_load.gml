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
        instance_create(x, y, Player1);
        instance_create(x, y, obj_healthbar);
        instance_create(x, y, par_weapons);
        instance_create(x, y, obj_weapon);
        obj_controller.playerX = ini_read_real("Save", "Player x", obj_controller.playerX); // sets players x position from save file
        obj_controller.playerY = ini_read_real("Save", "Player y", obj_controller.playerY); // sets player y position from save file
        Player1.x = obj_controller.playerX;
        Player1.y = obj_controller.playerY;
        room_goto(ini_read_real("Save", "Room", rm_cave1) );
}
else {
    obj_controller.playerX = ini_read_real("Save", "Player x", obj_controller.playerX); // sets players x position from save file
    obj_controller.playerY = ini_read_real("Save", "Player y", obj_controller.playerY); // sets player y position from save file
    global.unpause_room = ini_read_real("Save", "Room", rm_cave1);                         // room player will be located after loading. if no save file, defaults to level 1 
}
Player1.health = 100;
ini_close();
