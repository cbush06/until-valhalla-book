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

    notifyRemove(obj) {
        if(obj == courtDefender) {
            "<.p>Your defender left some files on the table.";
        }
    }
    
    north = exitCourtroomDoor
;
    + exitCourtroomDoor: Door 'courtroom door*doors' 'courtroom door'
        "Two mahogany doors stand between the hallway outside and the Arraignment Room. "
    ;

    + Exitable ->exitCourtroomDoor 'court courtroom/room' 'courtroom'
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
        /*
         * Table Contains: Transcript, Enlistment Requirements, Birth Certificate, and Social Security Card
         */
        desc() {
            if(courtDefender.isIn(courtroom)) {
                "A large wooden table with two chairs behind it. It has a worn look as if it's been in use
                 since the courthouse was first built. Scattered across it's top are a myriad of pages from your dossier
                 that your counselor is making a last-minute attempt to read through. Most of the pages are partially covered
                 by one another, flipped over, or otherwise unreadable. You can see one file in its entirety, though. ";
            }
            else {
                "A large wooden table with two chairs behind it. It has a worn look as if it's been in use
                 since the courthouse was first built. ";

                 if(transcriptFile.isIn(courtroomTable)) {
                     "Scattered across it are some files. ";
                 }

                 if(!transcriptFile.isListed) {
                     "You see a file about you on the table. There's also 3 more files hidden below it. You may want to read and take these. ";
                 }
            }
        }
    ;