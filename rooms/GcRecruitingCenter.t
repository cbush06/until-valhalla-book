#include <adv3.h>
#include <en_us.h>

gcRecruitingCenter: Room 'Global Coalition Recruiting Center, Ford St., Ukiah, CA ' 'recruiting center'
    "A small, open office with several desks abutted to the left and right walls. A single, uniformed GC
     soldier is seated at a desk in the far back, right corner. As you approach him, you can read <q>Ganci</q>
     on his name tape. "
    
    south = exitRecruitingCenter
;
    + exitRecruitingCenter: Door 'center/recruiting center/gc/gc recruiting center/door' 'recruiting center'
        "The front door leading out in front of the strip mall is covered in several stickers puporting
        great and exciting careers that will allow you to see the world and beyond. "
    ;
    + Exitable ->exitRecruitingCenter 'center/recruiting center/gc/gc recruiting center/door' 'recruiting center'
        "The front door leading out in front of the strip mall is covered in several stickers puporting
        great and exciting careers that will allow you to see the world and beyond. "
    ;