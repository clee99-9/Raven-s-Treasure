/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(ord("E")))
	{
	var _inst = instance_create_layer(x, y, "Dialogue", OBJ_DIALOGUE_BOX);
	with(_inst)
		{
		text[0] = "As soon as Duke got that wig, he kicked us to the curb... I thought we were friends, but I guess I was wrong...";
		text_last = 0;
		text_width = 1856;
		text_x = 0;
		text_y = 810;
		text[text_current] = string_wrap(text[text_current], text_width);
		}
	}