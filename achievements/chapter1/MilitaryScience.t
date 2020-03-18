#include <adv3.h>
#include <en_us.h>

militaryScienceAchievement: Achievement
    "Mastering <<toString(totalPoints)>> skills<<(totalPoints > 1) ? 's' : ''>> in modern military science."

    points = 1
    maxPoints = 1
;