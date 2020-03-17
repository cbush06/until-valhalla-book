#include <adv3.h>
#include <en_us.h>

ssnCardFile: Readable, Hidden 'social security card file' 'social security card' @courtroomTable
    read = nil
    
    dobjFor(Take) {
        action() {
            self.isListed = true;
            self.isListedInContents = true;
            inherited();
        }
    }

    readDesc() {
        if(!self.read) {
            self.isListed = true;
            self.isListedInContents = true;
            whoAmIAchievement.awardPoints();
            self.read = true;
        }
        
        "\n\t\t<b>SOCIAL SECURITY</b>
            \b
            \t\t\ \ \ \ \ \ 557-09-1182";
    }
;