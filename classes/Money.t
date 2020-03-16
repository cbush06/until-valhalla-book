#include <adv3.h>
#include <en_us.h>

class Money: Thing
    amount = 0

    isListedInInventory() {
        return self.amount > 0;
    }
    
    aName() {
        return '$<<toString(self.amount)>> GCD';
    }

    isPlural() {
        return self.amount != 1;
    }
;