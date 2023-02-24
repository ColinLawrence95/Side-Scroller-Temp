// Moves instance away from wall  (Provides Object Overlap Protection)
var dir;
var move_dis = 32;  // pixels to move away from other object in collision

// If both instances are in the same location, set direction random
if (x == other.x && y == other.y)
    dir = random(360);

// Move in opposite direction of object in collision
else
    dir = point_direction(other.x,other.y,x,y);

// Move to new location but away from oPlayer and other enemy

var dx = lengthdir_x(move_dis,dir);
var dy = lengthdir_y(move_dis,dir);

if (!place_meeting(x+dx,y,oPlayer)) x += dx;
if (!place_meeting(x,y+dy,oPlayer)) y += dy;
if (!place_meeting(x+dx,y,oGrunt)) x+=dx;
if (!place_meeting(y,y+dy,oGrunt)) y +=dy;