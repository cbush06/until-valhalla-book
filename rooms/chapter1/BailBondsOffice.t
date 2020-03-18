#include <adv3.h>
#include <en_us.h>

bailBondsOffice: Room 'AAA Bail Bonds, N State St., Ukiah, CA'
    "A small office with large windows looking out onto the street. <q>AAA Bail Bonds 24/7</q> is hand-painted on
     the windows. There are a couple desks immediately as you walk in the door and a few small offices further
     back in the building. The office smells like cheap bathroom deodorizer. "

    smellDesc = "The entire office smells like the cheap, pink hockey pucks you find in urinals. "
    
    out asExit(exitBailBondsOffice)
    
    east = enterBackRoomDoor
    west = exitBailBondsOffice
;
    + SimpleOdor 'bathroom deodorizer/deodorant' 'bathroom smell'
        "The entire office smells like the cheap, pink hockey pucks you find in urinals. "
    ;

    + exitBailBondsOffice: Door 'bail bonds office door*doors' 'bail bonds door'
        "The front door of the bail bonds office. To the right is a window with 
        large red letters that read <q>AAA Bail Bonds 24/7.</q> A flyer
        advertising the office's services is taped to the window. "
    ;

    + Fixture, SenseConnector 'bail bonds office window*windows' 'office window'
       "A large glass window opens from the bail bonds office out onto the street. A small flyer
        advertising the services offered by the office is taped to the window. "

        specialDesc = "A large glass window opens from the bail bonds office out onto the street. A small flyer
        advertising the services offered by the office is taped to the window. "
        
        locationList = [ bailBondsOffice, outsideCourthouse ]
        connectorMaterial = glass
        transSensingThru(sense) {
            return sense == sound ? distant : transparent;
        }
    ;
        ++ Readable, Fixture 'bail bonds services flyer' 'AAA Bail Bonds Flyer'
            "\t\tAAA Bail Bonds
            \n\t\t\ \ \ Open 24/7
            \b
            We offer the following services:
            \n\t- Bail Bonds up to $100,000
            \n\t- Bounty recovery
            \n\t- Property recovery/reposession "
        ;

    + enterBackRoomDoor: Door 'back room door*doors/counterfeit room door*doors' 'back room door'
        "A single door in the far back of the bail bonds office. "
    ;

backRoom: Room 'The Back Room'
    "A small, dark room lit only by a single lamp in the back right corner and the glow from
     two massive computer screens. "

    west = exitBackRoomDoor
;
    + driversLicense;
    + exitBackRoomDoor: Door ->enterBackRoomDoor 'back room door*doors/counterfeit room door*doors' 'back room door'
        "A single door leads back into the bail bonds office. "
    ;
    + Exitable ->exitBackRoomDoor 'back room door*doors/counterfeit room door*doors' 'back room door'
        "A single door leads back into the bail bonds office. "
    ;