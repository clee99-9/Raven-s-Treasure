if place_meeting(x, y, OBJ_PLAYER) && !instance_exists(OBJ_WARP) 
{
var inst = instance_create_depth(0, 0, -9999, OBJ_WARP);
inst.target_x = target_x;
inst.target_y = target_y;
inst.target_rm = target_rm;
}
