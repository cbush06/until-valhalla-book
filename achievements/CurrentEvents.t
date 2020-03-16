#include <adv3.h>
#include <en_us.h>

currentEventsAchievement: Achievement
    "Discovering <<toString(totalPoints)>> facts<<(totalPoints > 1) ? 's' : ''>> about current world events."

    points = 1
    maxPoints = 2
;
