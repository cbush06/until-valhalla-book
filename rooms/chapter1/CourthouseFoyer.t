#include <adv3.h>
#include <en_us.h>

courthouseFoyer: Room 'Mendocino County Courthouse, Foyer'
    "A 14 feet high vaulted, oak ceiling caps marble walls and floors. It's an intimidating entrance to
     an already intimidating place. A long hallway continues straight ahead. "

    west = courthouseHallway
    east = courthouseFrontDoorInside
;
    + courthouseFrontDoorInside: Door 'courthouse door*doors' 'courthouse front door'
        "Two massive and intimidating mahogany doors stand between this foyer and the rest of the world. "
    ;

    + courthouseFoyerBench: Heavy 'bench' 'bench'
        desc = "A long, wooden bench with a high back and broad arms. It's been worn smooth from years
         and years of use. "
        
        specialDesc = "A long, wooden bench sits to the right of the courthouse doors. "

        dobjFor(LookUnder) remapTo(LookUnder, underCourthouseFoyerBench)

        iobjFor(PutUnder) remapTo(PutUnder, DirectObject, underCourthouseFoyerBench) 
    ;
        ++ underCourthouseFoyerBench: NameAsOther, Underside, Component
            targetObj = courthouseFoyerBench

            dobjFor(LookUnder) {
                action() {
                    "You see a $<<toString(5)>> GCD bill. ";
                    exit;
                }
            };
        ;
        +++ moneyUnderBench: Money 'money/5 dollar gcd bill' 'money'
            "A $<<toString(5)>> GCD bill. "
            specialDesc = "There's something under the bench. "
            amount = 5
        ;

    + Enterable ->courthouseHallway 'hallway' 'courthouse hallway'
        "A long, marble hallway leads away to the west. It is lined with doors on both sides. "
    ;
    
    + Exitable ->courthouseFrontDoorInside 'courthouse/foyer' 'Front of Mendocino County Courthouse, N State St., Ukiah, CA '
        "Two massive and intimidating mahogany doors stand between this foyer and the rest of the world. "
    ;