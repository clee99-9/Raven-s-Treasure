// CREATE EVENT FOR (OBJECT PLAYER)
xspd = 0;
yspd = 0;

move_spd = 1.75; // Movement Speed
flying_spd = 2.25;

is_flying = false; // State to check if player is flying
normal_sprite = SPR_PLAYER; // Normal sprite
flying_sprite = SPR_PLAYER_FLYING; // Default flying sprite

// Directional sprites for normal movement
sprite_left = SPR_PLAYER_LEFT;
sprite_right = SPR_PLAYER_RIGHT;
sprite_up = SPR_PLAYER_UP;
sprite_down = SPR_PLAYER_DOWN;

// Directional sprites for flying
flying_sprite_left = SPR_PLAYER_FLYING_LEFT;
flying_sprite_right = SPR_PLAYER_FLYING_RIGHT;
flying_sprite_up = SPR_PLAYER_FLYING_UP;
flying_sprite_down = SPR_PLAYER_FLYING_DOWN;

// Set the initial sprite
sprite_index = normal_sprite;  // Start with the normal sprite

// Set depth to ensure player is above the wall
depth = -1; // Ensure this is lower than the wall's depth

