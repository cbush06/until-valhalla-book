#include <adv3.h>
#include <en_us.h>

judgeRockwell: Person 'judge donald rockwell/your honor' 'Judge Rockwell' @courtroom
    "In his early 50s, with a peppered gray beard, slightly receding hairline, and stern features, Judge Donald Rockwell is an imposing
     man. Judge Rockwell spent 18 years as a trial lawyer and was appointed to the Mendocino County Superior Court only 3 years ago. "
     isHim = true
     isProperName = true
     globalParamName = 'judge'
;    
    + pleaInConversationState: InConversationState
        specialDesc = "{The judge/he} listening intently. You can see his depth of thought and how he's parsing and weighing each word you say. "
        stateDesc = "He's listening intently. "
    ;
        ++ pleaConversationReadyState: ConversationReadyState
            isInitState = true
            specialDesc = "{The judge/he} yells your name impatiently, \"Reggie...Reggie!...Reginald Lunsford, if I have to call your name one 
                           more time!\"  "
            stateDesc = "He's staring at you waiting for an acknowledgement. "
        ;
        +++ HelloTopic
            "{The judge/he} addresses you with a low, resounding voice, <q>Son, you've been charged with statutory rape by Ms. Phillips's father. 
             How do you plea?</q>
             <.convnode respaboutcharges> "
        ;
    
    + armyInConversationState: InConversationState
        specialDesc = "{The judge/he} is looking at you expectantly. His brows are furrowed with concern. "
        stateDesc = "He's anxiously awaiting your decision. "
    ;
        ++ armyConversationReadyState: ConversationReadyState
            specialDesc = "{The judge/he} is impatiently drumming his fingers and awaiting your decision about
                           joining the GC Army. "
            stateDesc = "He's drumming his fingers and waiting for your decision. "
        ;
        +++ HelloTopic
            "We don't have all day boy. You need to hurry up and make your decision. Are you going to join
             or not?<.convnode joinarmy> "
        ;
    
    + judgeArraignmentCompleteState: HermitActorState
        specialDesc = "{The judge/he} is reading through his docket for the rest of the day. He has several
                       more cases to hear after yours. "
        noResponse = "{The judge/he} is busy preparing for his next hearing. Besides, you have little time to
                      get to the recruiter's office and enlist. "
    ;

    + ConvNode 'respaboutcharges'
        noteActive() {
            courtDefender.setCurState(postJudgeConversationState);
        }
    ;
        ++ SpecialTopic 'plead guilty' ['plead', 'guilty']
            "{The judge/he} looks disappointed, even sad. <q>Reggie, you need to reconsider that plea.</q><.convstay> "
        ;
        ++ SpecialTopic 'plead not guilty' ['plead', 'not', 'not guilty']
            "{The judge/he} gives you a serious look and says, <q>I'm glad to hear that. Now look here, you've been in my courtroom way too 
             often lately, leaving you with a colorful record. Despite all that, I believe you when you say you're not guilty. Unfortunately, what 
             I believe doesn't really matter in this situation. Mr. Phillips has a whole army of lawyers behind him and he has it in for you. Even 
             though you are eligible for the <i>Romeo and Juliet</i> exception in this case, it might not matter with his crosshairs on you.</q>
             \b
             {The judge/he} leans forward on his desk and continues, <q>Reggie, Mr. Phillips told me he'll withdraw the charges if you remove 
             yourself completely from this town and Abbi's life. I have a tremendous amount of respect for your father, you know we served together in 
             the GC Army. I want to help you out of this mess and to get your life straight. If you agree, I'm going to set you up with a Recruiter I 
             know that will get you a good job in the Army. With your enlistment contract in hand, Mr. Phillips will drop the charges and we 
             can put this whole mess behind you.</q>
             \b
             After a pause, he asks, <q>What do you say?</q><.convnode joinarmy>  "
             noteInvocation(actor) {
                 judgeRockwell.setCurState(armyInConversationState);
             }
        ;
    + ConvNode 'joinarmy'
        noteActive() {
            courtDefender.setCurState(postPleaState);
        }
    ;
        ++ SpecialTopic 'join' ['join', 'army', 'yes']
            "{The judge/he} gives you a half-smile. <q>Good choice, Reggie. Damn good choice. Your father would be so proud.
             \b
             I want you to go straight to the Army Recruiting Center on Ford Rd. I'll call Sergeant First Class Ganci so
              he's expecting you. By 1700, you <i>will</i> be on a plane head for Fort Benning, Georgia.</q>
             \b
             {The judge/he} nods at the bailiff who promptly opens the courtroom doors for you.
             \b
             Your counselor leaves the courthouse.
             \b
             <b>The door leading to the hallway is to the East</b>. "
            noteInvocation(actor) {
                judgeRockwell.setCurState(judgeArraignmentCompleteState);
                courtDefender.moveInto(nil);
                exitCourtroomDoor.isOpen = true;
            }
        ;
        ++ SpecialTopic 'not join' ['not join', 'no']
            "{The judge/he} glares at you. <q>Your future is riding on this decision, boy. You'd better rethink that answer.</q><.convstay> "
        ;