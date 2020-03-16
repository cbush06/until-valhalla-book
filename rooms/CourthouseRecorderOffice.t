#include <adv3.h>
#include <en_us.h>

courthouseRecorderOffice: Room 'Mendocino County Courthouse, County Recorder'
    "This is a smaller office with a counter from one side of the room to the other just a few feet from
     the door you walked in. The counter is partitioned in several service areas to provide a nominal amount
     of privacy to patrons doing business. Behind the counter you see rows and rows and more rows of
     filing cabinets, each standing over six feet tall. "
    
    south = exitRecorderOffice
;
    + exitRecorderOffice: Door 'county recorder\'s/recorder office' 'County Recorder\'s Office Door'
        "A single office door leads out into the hallway. "
    ;

    + Exitable ->exitRecorderOffice 'county recorder\'s/recorder office' 'County Recorder\'s Office';

    + signInPodium: Surface, Immovable 'podium' 'Sign-in Podium'
        "An oak podium stands next to the door with a large visitor registration book resting
         on its surface. A small drawer is below the podium's surface. "
        
        specialDesc = "An oak podium stands next to the door with a large visitor registration book resting
         on its surface. "
        
        dobjFor(Open) remapTo( Open, signInPodiumDrawer )
    ;
        ++ registrationBook: Signable, Surface 'registration/visitor book' 'Registration Book'
            desc() {
                "A 3-ring binder full of pages with past visitor\'s signatures. Several lines are left
                blank on the open pages. ";

                if(self.isSigned) "Your signature is carefully written near the bottom of the page. ";
            }

            specialDesc = "A 3-ring binder full of pages with past visitor\'s signatures. Several lines are left
             blank on the open pages. "

            dobjFor(Sign) {
                action() {
                    inherited();
                    tryImplicitActionMsg(&announceImplicitDropPenAction, PutOn, registrationPen, registrationBook);
                    obeyingAuthority.awardPoints();
                }
            }
        ;

        +++ registrationPen: WritingInstrument 'pen/quill' 'pen'
            "A cheap ballpoint pen lays on the registration book. "
        ;
            
        ++ signInPodiumDrawer: OpenableContainer, Component 'podium drawer*drawers' 'drawer'
            "The podium has a small drawer below its surface. "

            dobjFor(Pull) maybeRemapTo( !isOpen, Open, self )
        ;
            +++ Money 'money/5 dollar gcd bill' 'money'
                "A $<<toString(5)>> GCD bill. "
                
                specialDesc = "A $<<toString(5)>> GCD bill sits inside the podium drawer."

                amount = 5
            ;