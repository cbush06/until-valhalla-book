#include <adv3.h>
#include <en_us.h>

modify libMessages
    announceImplicitDropPenAction(action, ctx) {
        return '(you carefully place the pen back on the registration book) \n';
    }
;