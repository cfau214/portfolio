var num;
num = room_speed * 2;

if (mouse_check_button(mb_left)) { //look for mouse pressed 
    iCounter -= 1; //reduce counter by 1
    if (iCounter == 0) //if counter is 0
    {
        scr_charging(); //Run your script;
        iCounter = num; //reset counter
    }
}

if (mouse_check_button_released(mb_left)) //if mouse released
    iCounter = num; //reset counter
