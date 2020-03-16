#include <adv3.h>
#include <en_us.h>

bailBondsman: Person 'bail bondsman' 'bail bondsman' @bailBondsOffice
    "{The bondsman/he} is a large, weathered looking man. His arms, fingers, and portions of his face are 
     covered in tatoos. Around his neck hangs a bounty collector's badge. A .45cal 1911 sits on one hip and a 
     taser gun on the other. "
    isHim = true
    globalParamName = 'bondsman'
;
    + HermitActorState
        isInitState = true
        specialDesc = "{The bondsman/he} is sitting at the desk on your right with another customer. You
                       overhear them discussing her husband's bail which happens to be set at $40,000. "
        noResponse = "{The bondsman/he} is helping a customer right now and cannot talk with you. "
    ;