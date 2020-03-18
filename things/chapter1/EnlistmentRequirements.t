#include <adv3.h>
#include <en_us.h>

enlistmentRequirements: Readable, Hidden 'enlistment requirements/checklist' 'Enlistment Requirements' @courtroomTable
    read = nil
    isListed = nil
    isListedInContents = nil

    dobjFor(Take) {
        action() {
            inherited();
            birthCertificateFile.discovered = true;
            "{You/he} take {the dobj/him} and see your Birth Certificate on the table. Better not forget that!\n ";
        }
    }

    readDesc() {
        local descr = '\t\tEnlistment Requirements\b';

        /* Birth Certificate */
        descr = descr + '[';
        if(notarizeBirthCertificate.totalPoints > 0) {
            descr = descr + '\u2705';
        } else {
            descr = descr + '  ';
        }
        descr = descr + '] \tNotarize Birth Certificate\n';

        /* Social Security Card */
        descr = descr + '[';
        if(ssnCardFile.isIn(gPlayerChar)) {
            descr = descr + '\u2713';
        } else {
            descr = descr + '  ';
        }
        descr = descr + '] \tSocial Security Card';

        "<<descr>>\b";

        if(!read) {
            self.read = true;
            "\b\b<b>\"Oh crap!\"</b>, you think, \"I left my driver's license at the Bail Bonds office!\"";
        }
    }
;