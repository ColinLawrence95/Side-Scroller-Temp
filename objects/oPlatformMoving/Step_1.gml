// Select target
var _targetX = endX, _targetY = endY;
if (goingToStart) {
	_targetX = startX;
	_targetY = startY;
}

// Set movement
hsp = sign(_targetX - x) * currentSpeed;
vsp = sign(_targetY - y) * currentSpeed;