#include <adv3.h>
#include <en_us.h>

gameMain: GameMainDef
    initialPlayerChar = me
;

versionInfo: GameID
    name = 'Until Valhalla'
    byline = 'by Clinton Bush'
    authorEmail = 'Clinton Bush <cbush06@gmail.com>'
    desc = 'An exciting story about one lost youth\'s path from failure to glory '
    version = '1'
    IFID = 'b8563851-6257-77c3-04ee-278ceaeb48ac'

    showAbout()
    {
        "Reggie Lunsford has 2 things in life he can brag about, a mile-long juvie record and and a longer list of trophy girlfriends. 
         Reggie turned 18 on May 29th, the same day his latest girl's parents filed statutory rape charges against him. Apparently, this 
         is the easiest way to remove the one blemish from Abbi's, otherwise, spotless life. Reggie just doesn't mix with her 
         4.7 GPA, Honor's Society membership, 500 hours of volunteer work, cheerleading awards, National A Capella trophies, 
         and a 4 year academic scholarship to Harvard. No, instead of the date he had planned that Monday evening, Reggie finds 
         himself standing before Judge Rockwell for the 3rd time in the past 18 months. This is where Reggie's story ends. This is
         where your story begins...";
    }
;
