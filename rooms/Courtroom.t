#include <adv3.h>
#include <en_us.h>

courtroom: Room 'Mendocino County Courthouse, Arraignment Room'
    desc() {
        if(courtDefender.isIn(courtroom)) {
            "After a night in the Mendocino County Jail, you find yourself sitting before Judge Rockwell for the third time in the past
             year and a half. You are sitting at a large wooden table toward the front of the courtroom. Seated to your right is some 
             court-appointed joke in a suit who is supposed to be your defender. He's in his 
             mid-fifties, balding, and wears fifty-cent bathroom cologne. You're the 12th defendent he's represented today, and it's only
             half-past three. ";
        }
        "The courtroom is a smaller one used primarily for arraignments. Its walls are covered in 1960s style wood panelling.
         There are two doors at the back of the room, one on either side. There is a short dais in the front with the judge's desk and a single
         door behind it leading into his quarters. ";
    }
    
    north = exitCourtroomDoor
;
    + exitCourtroomDoor: Door 'courtroom door*doors' 'courtroom door'
        "Two mahogany doors stand between the hallway outside and the Arraignment Room. "
    ;

    + Exitable ->exitCourtroomDoor 'courtroom' 'courtroom'
        dobjFor(TravelVia) {
            check() {
                if(judgeRockwell.curState != judgeArraignmentCompleteState) {
                    failCheck( 'The bailiff will not allow {you/he} to leave until the arraignment is
                     complete. ');
                }
            }
        }
    ;

    + courtroomTable: Surface, Heavy 'large wooden table/desk' 'table'
        desc() {
            if(courtDefender.isIn(courtroom)) {
                "A large wooden table with two chairs behind it. It has a worn look as if it's been in use
                 since the courthouse was first built. Scattered across it's top are a myriad of pages from your dossier
                 that your counselor is making a last-minute attempt to read through. Most of the pages are partially covered
                 by one another, flipped over, or otherwise unreadable. You can see one file in its entirety, though. ";
            }
            else {
                "A large wooden table with two chairs behind it. It has a worn look as if it's been in use
                 since the courthouse was first built. Scattered across it's top are a myriad of pages from your dossier. ";

                 if(!transcriptFile.isListed) "You see a file about you on the table. ";
            }
        }
    ;
        ++ transcriptFile: Readable 'transcript file' 'transcript'
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
                    inherited();
                    self.isListed = true;
                    self.isListedInContents = true;
                    birthCertificateFile.discovered = true;
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

        ++ birthCertificateFile: Readable, Hidden 'birth certificate file'
            read = nil
            isNotarized = nil

            name() {
                if(self.isNotarized) return 'notarized birth certificate';
                else return 'birth certificate';
            }

            notarize() {
                self.isNotarized = true;
            }

            dobjFor(Take) {
                action() {
                    inherited();
                    ssnCardFile.discovered = true;
                    "{You/he} take {the dobj/him} and see another file on the table.\n ";
                }
            }

            readDesc() {
                if(!self.read) {
                    whoAmIAchievement.awardPoints();
                    self.read = true;
                }
                
                "\n\t\t<b>CERTIFICATE OF LIVE BIRTH</b>
                 \n\t\t\t<b>STATE OF CALIFORNIA</b> 
                 \b
                 THIS CHILD
                 \n\tNAME OF CHILD:                 \t\t\t\tReginald Patrick Lunsford
                 \n\tSEX:                           \t\t\t\t\t\tMALE
                 \n\tDATE:                          \t\t\t\t\t\t05/29/2135
                 \n\tHOUR:                          \t\t\t\t\t\t1729
                 \b
                 PLACE OF BIRTH
                 \n\tPLACE OF BIRTH:                \t\t\t\tUkiah Valley Medical Center
                 \n\tSTREET ADDRESS:                \t\t\t275 Hospital Drive
                 \n\tCITY:                          \t\t\t\t\t\tUkiah
                 \n\tCOUNTY:                        \t\t\t\t\tMendocino
                 \n\tPLANNED PLACE OF BIRTH:        \tHospital
                 \b
                 FATHER OF CHILD
                 \n\tNAME OF FATHER:                \t\t\tRaymond Lunsford
                 \n\tSTATE OF BIRTH:                \t\t\t\tCalifornia
                 \n\tDATE OF BIRTH:                 \t\t\t\t11/05/2101
                 \b
                 MOTHER OF CHILD
                 \n\tNAME OF MOTHER:                \t\t\tCheryl Lunsford
                 \n\tSTATE OF BIRTH:                \t\t\t\tCalifornia
                 \n\tDATE OF BIRTH:                 \t\t\t\t03/17/2103
                 \b
                 INFORMATION CERTIFICATION
                 \n\tCERTIFIED BY:                  \t\t\t\tFather
                 \n\tDATE SIGNED:                   \t\t\t\t06/29/2135
                 \b
                 CERTIFICATION OF BIRTH
                 \n\tATTENDANT OR REGISTRAR:        \tSylvia H. Matthews
                 \n\tLICENSE NUMBER:                \t\t\tG17899
                 \n\tDATE SIGNED:                   \t\t\t\t07/08/2135
                 \n\tADDRESS OF ATTENDANT:          \t\t1120 S. Dora Street, Ukiah
                 \b
                 LOCAL REGISTRAR
                 \n\tDATE ACCEPTED 
                 \n\t\ \ \ FOR REGISTRATION:        \t\t\t08/15/2135";
            }
        ;
        ++ ssnCardFile: Readable, Hidden 'social security card file' 'social security card'
            read = nil

            readDesc() {
                if(!self.read) {
                    whoAmIAchievement.awardPoints();
                    self.read = true;
                }
                
                "\n\t\t<b>SOCIAL SECURITY</b>
                 \b
                 \t\t\ \ \ \ \ \ 557-09-1182";
            }
        ;