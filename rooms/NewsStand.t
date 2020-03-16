#include <adv3.h>
#include <en_us.h>

newsStand: OutdoorRoom 'A Small News Stand, N State St., Ukiah, CA ' 'news stand'
    "A small, street-side news stand. "

    roomFirstDesc = "A news stand with stacks and stacks of two local newspapers and shelf after shelf
                     covered in News Week and Times magainzes. "

    out asExit(outsideCourthouse)

    specialContentsLister: ParagraphLister {
        /* list only items intended to be listed */
        isListed(obj) { return obj.isListed(); }

        /* show a list item */
        showListItem(obj, options, pov, infoTab)
        {
            /* show the object's special description */
            obj.showSpecialDescWithInfo(infoTab[obj], pov);
        }

        /* use the object's special description grouper */
        listWith(obj) { return obj.specialDescListWith; }
    }
    
    west = exitNewsStand
;

+ cashBox: Decoration 'cash box' 'cash box'
    "The vendor has a small cash box sitting on the cart's ledge next to his chair. "

    isListed = true

    notImportantMsg = 'The cash box is not important to you and you would certainly not
                       consider stealing it after all the trouble you\'ve been in recently. '
;

+ timeMagazineCopies: Readable, Fixture 'magazines/stack/copies' 'Stack of Time magazine Copies'
    "Copies of Time magazine line the top row of shelves on the front of the news stand. After all these 
     years, it still sports its familiar red border around the front cover with the large red letters
     <FONT COLOR=RED>TIME</FONT>. "

    isListed = true

    specialDesc = "Copies of Time magazine line the top row of shelves on the front of the news stand. 
      After all these years, it still sports its familiar red border around the front
      cover with the large red letters <FONT COLOR=RED>TIME</FONT>. "
;

+ timeMagazine: Readable 'time magazine' 'Time magazine'
    paid = nil
    read = nil
    cost = 5
    costStr = '$' + toString(self.cost) + ' GCD'

    isListed = nil
    initDesc = "A copy of Time magazine, Vol 325, No 20"
    specialDesc = "Time magazine"
    desc = "Time magazine"
    alreadyBoughtMsg = '{You/he} have already bought a copy of {the iobj/him}. '
    notEnoughMoneyMsg = '{You/he} do not have enough money to buy {the dobj/him}. '
    payMsg = '{You/he} hand {the iobj/him} a <<costStr>> bill for {the dobj/him}. '
    
    dobjFor(Take)
    {
        check() { failCheck( '{You/he} cannot take {the dobj/him}. You must purchase it for <<costStr>>.' ); }
    }

    dobjFor(BuyFrom) 
    {
        verify() { 
            if(gIobj != newsVendor) illogical( '{You/he} cannot buy {the dobj/him} from {the iobj/him}. ' ); 
            if(self.paid) illogicalAlready( alreadyBoughtMsg );
        }
        check() { if(!me.hasEnoughMoney(self.cost)) failCheck( notEnoughMoneyMsg ); }
        action() {
            "<<payMsg>>";
            self.paid = true;
            self.isListed = true;
            self.moveInto( me );
        }
    }

    iobjFor(PayFor)
    {
        verify() { 
            if(gDobj != newsVendor) illogical( '{You/he} cannot pay {the dobj/him} for {the iobj/him}. ' );
            if(self.paid) illogicalAlready( alreadyBoughtMsg );
        }
        check() { if(!me.hasEnoughMoney(self.cost)) failCheck( notEnoughMoneyMsg ); }
        action() {
            "<<payMsg>>";
            self.paid = true;
            self.isListed = true;
            self.moveInto( me );
        }
    }

    readDesc() {
        if(!self.paid) {
            "You must pay the {The newsvendor/he} for the magazine, first. All news papers and magazines
                are priced <<costStr>>. ";
        }
        else {
            if(!self.read) {
                currentEventsAchievement.awardPoints();
                self.read = true;
            }
            "\n\t\t\t\t\t<B><FONT COLOR=RED>TIME</FONT></B> ";
        }
    }
;

+ newsWeekCopies: Readable, Fixture 'magazines/stack/copies' 'Stack of Newsweek magazine Copies'
    "The news stand's second row of shelves is covered in News Week magazines. Like the Time magazine,
     little has changed in their logo over the years, it's still a read rectangle with 
     <FONT COLOR=WHITE BGCOLOR=RED>NEWSWEEK</FONT> across the top of its cover. "

    isListed = true

    specialDesc = "The news stand's second row of shelves is covered in Newsweek magazines. Like the Time magazine,
     little has changed in their logo over the years, it's still a read rectangle with 
     <FONT COLOR=WHITE BGCOLOR=RED>NEWSWEEK</FONT> across the top of its cover. "
;

+ newsWeekMagazine: Readable 'newsweek magazine' 'Newsweek magazine'
    paid = nil
    read = nil
    cost = 5
    costStr = '$' + toString(self.cost) + ' GCD'

    isListed = nil
    initDesc = "A copy of Newsweek magazine, dated May 25, 2153"
    specialDesc = "Newsweek magazine"
    alreadyBoughtMsg = '{You/he} have already bought a copy of {the iobj/him}. '
    notEnoughMoneyMsg = '{You/he} do not have enough money to buy {the dobj/him}. '
    payMsg = '{You/he} hand {the iobj/him} a <<costStr>> bill for {the dobj/him}. '
    
    dobjFor(Take)
    {
        check() { failCheck( '{You/he} cannot take {the dobj/him}. You must purchase it for <<costStr>>.' ); }
    }

    dobjFor(BuyFrom) 
    {
        verify() { 
            if(gIobj != newsVendor) illogical( '{You/he} cannot buy {the dobj/him} from {the iobj/him}. ' ); 
            if(self.paid) illogicalAlready( alreadyBoughtMsg );
        }
        check() { if(!me.hasEnoughMoney(self.cost)) failCheck( notEnoughMoneyMsg ); }
        action() {
            "<<payMsg>>";
            self.paid = true;
            self.isListed = true;
            self.moveInto( me );
        }
    }

    iobjFor(PayFor)
    {
        verify() { 
            if(gDobj != newsVendor) illogical( '{You/he} cannot pay {the dobj/him} for {the iobj/him}. ' );
            if(self.paid) illogicalAlready( alreadyBoughtMsg );
        }
        check() { if(!me.hasEnoughMoney(self.cost)) failCheck( notEnoughMoneyMsg ); }
        action() {
            "<<payMsg>>";
            self.paid = true;
            self.isListed = true;
            self.moveInto( me );
        }
    }

    readDesc() {
        if(!self.paid) {
            "You must pay the {The newsvendor/he} for the magazine, first. All news papers and magazines
                are priced <<costStr>>. ";
        }
        else {
            if(!self.read) {
                currentEventsAchievement.awardPoints();
                self.read = true;
            }
            "\n\t\t\t\t\t<B><FONT COLOR=WHITE BGCOLOR=RED>NEWSWEEK</FONT></B> ";
        }
    }
;

+ exitNewsStand: Exitable ->outsideCourthouse 'news stand' 'news stand'
    "A small, street-side news stand. "
;