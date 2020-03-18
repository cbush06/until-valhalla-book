#include <adv3.h>
#include <en_us.h>

whoAmIAchievement: Achievement
    "Learning <<toString(totalPoints)>> fact<<(totalPoints > 1) ? 's' : ''>> about your past."

    points = 1
    maxPoints = 4
;