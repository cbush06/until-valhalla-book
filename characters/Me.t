#include <adv3.h>
#include <en_us.h>

me: Person 'me/self/myself/i' 'Me' @courtroom

    bulkCapacity = 3

    isHim = true
    globalParamName = 'me'

    addMoney( amt ) {
        money.amount += amt;
    }

    subMoney( amt ) {
        money.amount -= amt;
    }

    hasEnoughMoney( amt ) {
        return money.amount >= amt;
    }

    notifyInsert(obj, newCont) {
        if(obj.ofKind(Money)) {
            me.addMoney(obj.amount);
            "You added $<<obj.amount>> GCD to your money.";
            exit;
        }
        inherited(obj, newCont);
    }
;
    + meInitialState: ActorState
        isInitState = true
        stateDesc = "You are 18 years old and, though you still have a youthful face, it's obvious to anyone you 
            meet that the world has not passed on exacting its toll from you. At 6 feet tall with a fair, Irish 
            complexion, longer, dark black hair, and blue eyes, you've never had a problem winning affection from 
            an attractive girl. "
    ;

+ Wearable 'clothes/attire/wardrobe/vest/pants/boots/shirt/undershirt' 'clothes'
    "Your warddrobe consists of a dark brown unzipped vest with a gray undershirt, a pair of black work pants, 
     and a pair of dark brown work boots. "
    
    specialDesc = "You're wearing a vest, undershirt, black pants, and a pair of boots."
    isPlural = true
    wornBy = me
    dobjFor(Remove)
    {
        verify() { illogical( 'Going around naked is really not an option. ' ); }
    }
;

+ backpack: BagOfHolding, StretchyContainer, Wearable 'backpack/pack' 'backpack'
    "It's a very old and worn backpack. There are a couple of small holes, but none large enough for
     something to fall out of. "

    specialDesc = "You carry an old, brown backpack on your shoulders. "
    addedMessage = nil

    minBulk = 1
    bulkCapacity = 100000
    wornBy = me
    
    notifyInsert(obj, newCont) {
        if(obj.ofKind(Money)) {
            me.addMoney(obj.amount);
            exit;
        }
        inherited(obj, newCont);
        addedMessage = '{You/he} added ' + obj.theName + ' to your pack.';
    }

    afterAction() {
        if(addedMessage != nil) {
            "<<addedMessage>>";
            addedMessage = nil;
        }
    }
;

+ money: Money 'money' 'money'
    "You have $<<toString(self.amount)>>."
    amount = 5
    bulk = 0
    specialDesc = "You have $<<toString(self.amount)>>."
;