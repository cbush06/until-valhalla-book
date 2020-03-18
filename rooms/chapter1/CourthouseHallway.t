#include <adv3.h>
#include <en_us.h>

courthouseHallway: Room 'Mendocino County Courthouse, Main Hallway'
    "A long, marble hallway lined with doors on both sides. Most are offices for various
     county officials. A few offices like the Tax Office, Records Office, and Licensing Office
     are open to the public. The east end of the hallway leads directly into the courthouse
     foyer. "

     east = courthouseFoyer
;   
    + Enterable ->courthouseFoyer 'foyer' 'courthouse foyer'
        "A 14 feet high vaulted, oak ceiling caps marble walls and floors. It's an intimidating entrance to
         an already intimidating place. A long hallway continues straight ahead. "
    ;

    + Exitable ->courthouseFoyer 'hallway' 'courthouse main hallway'
        "The east end of the hallway leads directly into the courthouse foyer. "
    ;

    + enterCourtroomDoor: Door->exitCourtroomDoor 'courtroom door*doors/court door*doors' 'courtroom door'
        specialDesc = "Two mahogany doors on the left side of the hallway lead into the
         arraignment courtroom. "
    ;

    + enterRecorderOffice: Door->exitRecorderOffice 'county recorder\'s/recorder/assessor\'s/assessor/clerk\'s/clerk office door*doors' 'County Recorder\'s Office Door'
        specialDesc = "A single office door with a placard reading \'Assessor-Clerk-Recorder\' on it leads
         into the County Recorder\'s office. "
    ;