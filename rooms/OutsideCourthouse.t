#include <adv3.h>
#include <en_us.h>

outsideCourthouse: OutdoorRoom 'Front of Mendocino County Courthouse, N State St., Ukiah, CA '
    "You're standing in front of the Mendocino County Courthouse at the corner of N State St. and 
     E Perkins St. It's slightly overcast outside and a comfortable 91&deg;F. A giant Oak tree
     casts shade over the sidewalk. A bail bondsman advertises his 24/7 services across the street.
     Just in front of the bail bonds office is a news stand. "
    
    southEast = enterBailBondsOffice
    northEast = enterNewsStand
    west = courthouseFrontDoorOutside
    north = outsideRecruitingCenter
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
        
    + enterNewsStand: Enterable ->newsStand 'news stand' 'news stand'
        "A small news stands is across the street in front of a bail bonds office."
    ;

    + enterBailBondsOffice: Door ->exitBailBondsOffice 'bail bonds office door*doors' 'bail bonds door'
        "A small office with large windows looking out onto the street. <q>AAA Bail Bonds 24/7</q> is hand-painted on
         the windows. There are a couple desks immediately as you walk in the door and a few small offices further
         back in the building. The office smells like cheap bathroom deodorizer. "
    ;

    + courthouseFrontDoorOutside: Door ->courthouseFrontDoorInside 'courthouse/courtroom' 'courthouse front door'
        "Two massive mahogany doors with brass handles and brass fixtures lead into the Mendocino County
         Courthouse."
    ;