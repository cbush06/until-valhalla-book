#include <adv3.h>
#include <en_us.h>

DefineTAction(Sign);

VerbRule(Sign)
    ('sign') singleDobj
    : SignAction
    verbPhrase = 'sign/signing (what)'
;

modify Thing
    cannotSignMsg = '{That dobj/he} {is} not something {you/he} can sign. '
    dobjFor(Sign)
    {
        check() { 
            if(!gDobj.ofKind(Signable)) {
                reportFailure(cannotSignMsg);
                exit;
            }
        }
    }
;