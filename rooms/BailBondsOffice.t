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

counterfeitRoom: Room 'The Back Room'
    "A small, dark room lit only by a single lamp in the back right corner and the glow from
     two massive computer screens. "

    west = exitBackRoomDoor
;
    + driversLicense: Readable 'drivers license/driver\'s license/driver license' 'driver\'s license'
        "\t\ \ \ <b>CALIFORNIA</b>
         \n\t<b>DRIVER LICENSE</b>
         \b
         <font color=blue>DL</font> \tC2837229
         \n<font color=blue>EXP</b> \t05/29/2157
         \n<font color=blue>DOB</b> \t05/29/2135
         \b
         \ \ <font bgcolor=red color=white>AGE 21 IN 2156</font>
         \n \ <font bgcolor=blue color=white>PROVISIONAL UNTIL</font>
         \n \ \ \ <font bgcolor=blue color=white>AGE 18 IN 2153</font>
         \b
         <font color=blue>CLASS</font> C
         \n<font color=blue>END</font> NONE
         \n<font color=blue>RSTR</font> NONE
         \b
         \b
         <font color=blue>LN</font> LUNSFORD
         \n<font color=blue>FN</font> REGINALD
         \n1701 TANYA LN
         \nUKIAH, CA 95482
         \b
         \n<font color=blue>SEX</font> M
         \n<font color=blue>HAIR</font> BLK \t\t\t\t\t<font color=blue>EYES</font> BLU
         \n<font color=blue>HGT</font> 6'-00\" \t\t\t\t\t<font color=blue>WGT</font> 181 lb
         \b
         \n\t \t \t \t \t \t \t<font color=blue>ISS</font>
         \n<font color=blue>DD</font> 05/31/215150119/32FD/57 \t05/31/2151"
    ;
    + exitBackRoomDoor: Door ->enterBackRoomDoor 'back room door*doors/counterfeit room door*doors' 'back room door'
        "A single door leads back into the bail bonds office. "
    ;
    + Exitable ->exitBackRoomDoor 'back room door*doors/counterfeit room door*doors' 'back room door'
        "A single door leads back into the bail bonds office. "
    ;