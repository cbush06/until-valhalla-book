#include <adv3.h>
#include <en_us.h>

DefineTIAction(BuyFrom);

VerbRule(BuyFrom)
    ('buy' | 'purchase') singleDobj 'from' singleIobj
    : BuyFromAction
    verbPhrase = 'purchase/purchasing (what) from (what)'
;

DefineTIAction(PayFor);

VerbRule(PayFor)
    'pay' singleDobj 'for' singleIobj
    : PayForAction
    verbPhrase = 'pay/paying (what) for (what)'
;

modify Thing
    cannotPurchaseMsg = '{That dobj/he} {is} not something {you/he} can purchase. '
    dobjFor(BuyFrom)
    {
        verify() { illogical(cannotPurchaseMsg); }
    }

    cannotPayForMsg = '{You/he} cannot pay {the dobj/him} for {the iobj/him}. '
    iobjFor(PayFor)
    {
        verify() { illogical(cannotPayForMsg); }
    }
;