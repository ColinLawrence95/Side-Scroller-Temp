/// @description Insert description here
var w_half = w * 0.5;

//Draw text/speech box
draw_set_colour(c_black);
draw_set_alpha(0.5);
draw_roundrect_ext(x - w_half - margin, y - h - (margin * 2), x + w_half + margin, y, 10, 10, false);
draw_sprite(sText_Marker, 0, x, y);
draw_set_alpha(1);

//Draw words in box
DrawSetText(c_white, fNPC1, fa_center, fa_top);
draw_text(x, y - h - margin, txtCurrent);