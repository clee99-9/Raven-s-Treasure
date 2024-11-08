// STEP EVENT

// Movement
right_key = keyboard_check(ord("D")) || keyboard_check(vk_right); 
left_key = keyboard_check(ord("A")) || keyboard_check(vk_left);
up_key = keyboard_check(ord("W")) || keyboard_check(vk_up); 
down_key = keyboard_check(ord("S")) || keyboard_check(vk_down);

// Flying 
if (keyboard_check_pressed(vk_space)) {
    is_flying = !is_flying; // Toggle flying state
}

// Speed calculation
if (is_flying) {
    xspd = (right_key - left_key) * flying_spd; // Use flying speed
    yspd = (down_key - up_key) * flying_spd; // Use flying speed
} else {
    xspd = (right_key - left_key) * move_spd; // Use normal speed
    yspd = (down_key - up_key) * move_spd; // Use normal speed
}


// Normalize movement vector if moving
if (xspd != 0 || yspd != 0) {
    var length = point_distance(0, 0, xspd, yspd);
    if (length > 0) {
        xspd = (xspd / length) * move_spd;
        yspd = (yspd / length) * move_spd;
    }

// Scale by speed after normalizing
    if (is_flying)
	{
        xspd *= flying_spd;
        yspd *= flying_spd;
    } else
	{
        xspd *= move_spd;
        yspd *= move_spd;
    }
}


// Determine if the player is moving
var is_moving = (xspd != 0 || yspd != 0);

if (is_moving) {
    if (is_flying) {
        // Use flying directional sprites
        if (xspd > 0) {
            sprite_index = flying_sprite_right; // Flying right
        } else if (xspd < 0) {
            sprite_index = flying_sprite_left; // Flying left
        } else if (yspd > 0) {
            sprite_index = flying_sprite_down; // Flying down
        } else if (yspd < 0) {
            sprite_index = flying_sprite_up; // Flying up
        }
    } else {
        // Use normal directional sprites
        if (xspd > 0) {
            sprite_index = sprite_right; // Moving right
        } else if (xspd < 0) {
            sprite_index = sprite_left; // Moving left
        } else if (yspd > 0) {
            sprite_index = sprite_down; // Moving down
        } else if (yspd < 0) {
            sprite_index = sprite_up; // Moving up
        }
    }
} else {
    // Set to a default or idle sprite when not moving
    if (is_flying) {
        sprite_index = flying_sprite; // Default flying sprite when idle
    } else {
        sprite_index = normal_sprite; // Normal sprite when idle
    }
}

// Collisions
if (!is_flying) {
    // Normal movement with collisions
    if (place_meeting(x + xspd, y, OBJ_WALL)) { 
        xspd = 0; // Stop movement on x collision
    }
    if (place_meeting(x, y + yspd, OBJ_WALL)) {
        yspd = 0; // Stop movement on y collision
    }
    // Update position if not flying
    x += xspd;
    y += yspd;
} else {
    // If flying, move freely without collision checks
    x += xspd; // Allow horizontal movement
    y += yspd; // Allow vertical movement
}


//DEPTH
depth = -bbox_bottom;


//CHECK IF PLAYER INDOORS
var is_indoor = room == Rm_House; 

// AUTOMATICALLY STOP FLYING WHEN INDOORS
if (is_indoor) {
    is_flying = false; // Stop flying if in the house
}


//SCALING
// Scale the sprite while flying
if (is_flying) {
    image_xscale = 1.2; // Increase scale for flying (adjust as needed)
    image_yscale = 1.2; // Increase scale for flying (adjust as needed)
} else {
    image_xscale = 1; // Reset to normal size
    image_yscale = 1; // Reset to normal size
}
