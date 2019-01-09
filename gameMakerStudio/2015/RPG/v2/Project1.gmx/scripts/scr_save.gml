////////////////////
// Saving
////////////////////
/*num = instance_number(all);     // Get number of objects in room
instanceArray[num] = 0;         //Defining the instance array

ini_open(saveFile);
ini_write_real("Save", "room", room);   // Saves the current room
for ( i = 0; i < num; i += 1)
{
     instanceArray[i] = instance_find(all, i); 
     ini_write_real("Save", "object" + string(i), instanceArray[i].object_index);   //saves id to file so you know what object to create when loading
     ini_write_real( "Save", "object" + string(i) + "x", instanceArray[i].x);       //saves x to file
     ini_write_real( "Save", "object" + string(i) + "y", instanceArray[i].y);       //saves y to file
     ini_write_real( "Save", "count", num);                                         //saves the total number of instances to the file for loading later
}
ini_close();*/

file = "save1.ini";

if file_exists(file) {      // check if file exists and delete. this will basically "override" the old save file when saving
    file_delete(file);
}

ini_open(file); 
ini_write_real("Save", "Player x", obj_controller.playerX);     // players x position in room
ini_write_real("Save", "Player y", obj_controller.playerY);     // players y position in room
ini_write_real("Save", "Room", global.unpause_room);            // current room when saving, excluding the "pause" room
ini_close();
