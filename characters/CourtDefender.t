#include <adv3.h>
#include <en_us.h>

courtDefender: Person 'counselor/lawyer/defender/joke' 'Counselor' @courtroom
    "A slightly balding man in his mid-fifties wearing a cheap brown suit with an unbuttoned collar and no tie.
    You can hardly concentrate for the offensive cologne he must have bought at a dollar store and bathed in 
    prior to coming to work this morning. "
    isHim = true
    globalParamName = 'counselor'
    smellDesc = "Smells like he fell into a vat of 50 cent cologne you might buy at the local dollar store. It's truly nauseating. "
;
    + preJudgeConversationState: InConversationState
        isInitState = true
        specialDesc = "{The counselor/he} is hurriedly flipping through your file to familiarize himself
        with your case. "
        stateDesc = "He's flipping through your file. "
    ;
        ++ HelloTopic, EventList
            [
                'He puts your record down and glares at you. <q>Look, just sit over there and stay quiet.</q> ',
                'Again, he quits flipping through your files. <q>There\'s nothing I need to hear from you or say to you.</q> ',
                'Obviously aggravated now, he says, <q>Shut up. Let me do the talking while you sit there looking pretty for the judge.</q>'
            ]
        ;

    + postJudgeConversationState: InConversationState
        specialDesc = "{The counselor/he} is carelessly leaning back in his chair, listening to {The judge/he}'s conversation
        with you. Your record is strewn all over the table in front of the two of you. "
        stateDesc = "{The counselor/he} is listening to the conversation between you and {The judge/he}."
    ;
        ++ HelloTopic, EventList
            [
                '<q>Don\'t mind me, your counselor, over here. You can obviously represent yourself.</q> ',
                '<q>Oh...now you want my advice! I see 20 of you delinquents every day, and you know what? You\'re all the same! You think you know everything...</q> ',
                '<q>Look, just keep on talking your way out of trouble with the judge. What am I here for anyway? It\'s not like I\'m your lawyer or anything.</q> '
            ]
        ;
    + postPleaState: InConversationState
        specialDesc = "{The counselor/he} packed all his papers into his folder. He's sitting straight up in his chair as if ready to leave any 
                       minute. "
        stateDesc = "{The counselor/he} is sitting in his chair as if ready to leave any minute."
    ;
        ++ HelloTopic, EventList
            [
                '<q>Why are you talking to me? Seems you have it all worked out.</q> ',
                '<q>Look boy, I\'ve got nothing for you. You and the judge have it all worked out.</q> ',
                '<q>Stop talking to me. It looks like the judge already worked out your case for you.</q> '
            ]
        ;