#include <adv3.h>
#include <en_us.h>

class Signable: Thing
    isSigned = nil

    sign() {
        self.isSigned = true;
    }

    unsign() {
        self.isSigned = nil;
    }

    successSignedMsg = '{You/he} carefully sign {the dobj/he}. '
    alreadySignedMsg = '{That dobj/he} {is} already signed. '
    noWritingInstrumentMsg = '{You/he} need a writing instrument to sign {the dobj/he} with. '
    dobjFor(Sign) {
        verify() {
            /* If it's already signed, illogical */
            if(self.isSigned) {
                illogical(alreadySignedMsg);
            }

            /* If you don't have something to write with, illogical */
            local hasWritingInstrument = nil;
            foreach(local inventoryItem in gActor.contents) {
                if(inventoryItem.ofKind(WritingInstrument)) {
                    hasWritingInstrument = true;
                    break;
                }
            }

            if(!hasWritingInstrument) {
                illogical(noWritingInstrumentMsg);
            }
        }
        action() {
            gDobj.isSigned = true;
            "<<successSignedMsg>> \n";
        }
    }
;