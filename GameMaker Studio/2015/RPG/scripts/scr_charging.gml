if mouse_check_button_pressed(mb_left) {
    obj_weapon.sprite_index = spr_sword_charge;
    Player1.charging = true;
}

if mouse_check_button_released(mb_left) {
    obj_weapon.iCounter = num;
    obj_weapon.sprite_index = spr_sword_swing;
    obj_weapon.alarm[0] = 14;
    Player1.charging = false;
}
