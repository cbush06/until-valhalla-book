#include <adv3.h>
#include <en_us.h>

enlistmentRequirements: Readable, Hidden 'enlistment requirements/checklist' 'Enlistment Requirements' @courtroomTable
    isListed = nil
    isListedInContents = nil

    dobjFor(Take) {
        action() {
            inherited();
            birthCertificateFile.discovered = true;
            "{You/he} take {the dobj/him} and see another file on the table.\n ";
        }
    }

    readDesc() {
        local descr = '\t\tEnlistment Requirements\b';
        descr = descr + '[';
        if(notarizeBirthCertificate.totalPoints > 0) {
            descr = descr + '\u2705';
        } else {
            descr = descr + ' ';
        }
        descr = descr + '] Notarize Birth Certificate';
        "<<descr>>\b";
    }
;