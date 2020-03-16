#include <adv3.h>
#include <en_us.h>

outsideRecruitingCenter: OutdoorRoom 'Outside of Global Coalition Recruiting Center, Ford St., Ukiah, CA '
    "Following a 20 minute walk from the courthouse, you're standing in front of a small stripmall
     that's home to the Global Coalition Recruting Center, a Little Ceasar's Pizzeria, and a Subway
     Sandwich Shop. You're facing <b>North</b>. "
    
    north = gcRecruitingCenter
;
    + enterRecruitingCenter: Door->exitRecruitingCenter 'gc recruiting center/door' 'recruiting center doors'
        "The front door sits at the far right end of the strip mall beneath a large, plain sign that reads
        <q>GLOBAL COALITION RECRUITING CENTER</q>. "
    ;
    + Enterable ->enterRecruitingCenter 'gc recruiting center/door' 'recruiting center doors'
        "The front door sits at the far right end of the strip mall beneath a large, plain sign that reads
        <q>GLOBAL COALITION RECRUITING CENTER</q>. "
    ;