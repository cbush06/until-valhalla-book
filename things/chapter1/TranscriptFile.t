#include <adv3.h>
#include <en_us.h>

transcriptFile: Readable 'transcript file' 'transcript' @courtroomTable
    read = nil
    isListed = nil
    isListedInContents = nil

    dobjFor(Take) {
        check() {
            if(courtDefender.isIn(courtroom)) {
                failCheck( 'You wouldn\'t try to steal a file from the counselor while he\'s in the room. ' );
            }
        }
        action() {
            self.isListedInContents = true;
            enlistmentRequirements.isListedInContents = true;
            enlistmentRequirements.discovered = true;
            gDobj.moveInto(gActor);
            "{You/he} take {the dobj/him} and see another file on the table.\n ";
        }
    }

    readDesc() {
        if(!self.read) {
            whoAmIAchievement.awardPoints();
            self.read = true;
            isListed = true;
            isListedInContents = true;
        }
        
        "\n\t\t\t\t\t<b>TRANSCRIPT</b>
        \n\t\t<b>DEPOSITION w/ MR. & MRS. PHILLIPS</b>
        \n\t\t\t\t<b>TAKEN MAY 30, 2135</b>
        \n\t\t\t<b>AT HALE & PHILLIPS LAW, LLC</b>
        \b-------------------------------------------------------------------------------------------
        \n<b>OFFICIALS PRESENT:</b>
        \n\t[1] \tDeputy Samuel Garrity \t(DET)
        \n\t[2] \tMr. Patrick Laremy \t\t(PROS)
        \b
        <b>DEPOSED PRESENT:</b>
        \n\t[1] \tMr. Walter Phillips \t\t(WP)
        \n\t[2] \tMrs. Lindsey Phillips \t(LP)
        \b
        <b>OTHERS PRESENT:</b>
        \n\t[1] \tMr. Fredrick Hale \t\t(FH)
        \n-------------------------------------------------------------------------------------------
        \b
        1400\n
        \tDET\tCan you describe for the record your accusation 
        \n\t\t\tagainst Mr. Reginald Lunsford?
        \b
        \n\tWP\t\tIt's like I told the cops earlier, he just turned 
        \n\t\t\t18 and we know he spent the night of his birthday 
        \n\t\t\twith our daughter who is only 17. That's statutory 
        \n\t\t\trape under California law.
        \b
        \n\tDET\tDo you have any evidence? Is your daughter willing
        \n\t\t\tto sign an affidavit or testify against him?
        \b
        \n\tWP\t\tYou'll have an affidavit. If you need evidence,
        \n\t\t\tyou'll have that, too.
        \b
        \n\tDET\tWhat do you hope for, outcome-wise, from these
        \n\t\t\tcharges?
        \b
        \n\tFH\t\tWe want Mr. Lunsford...
        \b
        \n\tWP\t\tLet me talk Fred. Detective, I really don't
        \n\t\t\tgive a damn what happens to that little shit as
        \n\t\t\tlong as he isn't in my daughter's life anymore.
        \b
        \n\tDET\tForgive me for stating the obvious, but have you
        \n\t\t\ttold Mr. Lunsford this?
        \b
        \n\tWP\t\tYou know as well as I do that you can't reason with
        \n\t\t\ttrash like him!
        \b
        \n##################### END INTERVIEW #########################";
    }
;