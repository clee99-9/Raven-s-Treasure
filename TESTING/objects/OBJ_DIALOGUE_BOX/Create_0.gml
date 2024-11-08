/// @description Sets text variables
/// @param {array<string>}	text	The text we're displaying 
text[0] = "PLACEHOLDER TEXT ALERT!"
text[1] = "Dear player: If you're seeing this, we messed up!"
text_current = 0; // Used to track which line to draw
text_last = 1; // Used to check what the last line in a sequence of dialogue is
text_width = 300;
text_x = 32; // These three are for the text's position
text_y = 32;
char_current = 1; // tracks 
char_speed = 0.25; // how fast each character is drawn
text[text_current] = string_wrap(text[text_current], text_width); // breaks up the text so it doesn't overflow