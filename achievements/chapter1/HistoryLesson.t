#include <adv3.h>
#include <en_us.h>

historyLessonAchievement: Achievement
    "Studying <<toString(totalPoints)>> source<<(totalPoints > 1) ? 's' : ''>> of history."

    points = 1
    maxPoints = 1
;