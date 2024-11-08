/// @description draws text + sprite
draw_set_font(FNT_DIALOGUE);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);

var _len = string_length(text[text_current]);
if (char_current < _len)
    {
    char_current += char_speed;
    }
draw_sprite(SPR_DIALOGUE_BOX, 0, 0, 810)
var _str = string_copy(text[text_current], 1, char_current);
draw_text(text_x, text_y,  _str);