/*
**  usage:
**      diff = angle_difference(angle1,angle2);
**
**  given:
**      angle1    first direction in degrees, real
**      angle2    second direction in degrees, real
**
**  returns:
**      difference of the given angles in degrees, -180 to 180
**
**  GMLscripts.com
*/
{
    return ((((argument0 - argument1) mod 360) + 540) mod 360) - 180;
}
