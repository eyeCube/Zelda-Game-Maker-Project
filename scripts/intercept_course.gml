/*
**  Usage:
**      intercept_course(origin,target,tspeed,pspeed)
**
**  Given:
**      origin      instance with position (x,y)
**      tx          target x
**      ty          target y
**      tdir        target direction
**      tspeed      target speed
**      pspeed      speed of the projectile
**
**  Returns:
**      course direction required to intercept
**      a moving target at a given speed,
**      or (-1) if no solution found
**
**  GMLscripts.com
*/
{
    var origin,target,pspeed,dir,alpha,phi,beta;
    origin = argument0;
    tx = argument1;
    ty = argument2;
    tspeed = argument3;
    tdir = argument4;
    pspeed = argument5;
    dir = point_direction(origin.x,origin.y,tx,ty);
    alpha = tspeed / pspeed;
    phi = degtorad(tdir - dir);
    beta = alpha * sin(phi);
    if (abs(beta) >= 1) {
        return (-1);
    }
    dir += radtodeg(arcsin(beta));
    return dir;
}
