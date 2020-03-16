#include <adv3.h>
#include <en_us.h>

countyRecorder: Person 'county recorder clerk' 'County Recorder Clerk' @courthouseRecorderOffice
    "{The countyrecorder/she} is a short lady in her late 50s, early 60s with an endearing smile
     that blushes her cheeks. Her brown hair is shortly cut and is just now becoming speckled with 
     gray and white. Dark-rimmed bifocals frame smiling eyes and a peach shirt brings out the
     warmth in her cheeks. "

    isHer = true
    globalParamName = 'countyrecorder'
;
    + countyRecorderGreetingState: InConversationState
        specialDesc = "{The countyrecorder/she} is standing behind the service counter giving you her full attention. "
        stateDesc = "{The countyrecorder/she} is standing behind the service counter giving you her full attention. "
    ;
        ++ countyRecorderGreetingReadyState: ConversationReadyState
            isInitState = true
            specialDesc = "{The countyrecorder/she} gives you a welcoming smile as you enter her office. "
            stateDesc = "{The countyrecorder/she} is smiling at you waiting for you to introduce yourself. "
        ;
        +++ HelloTopic, StopEventList
            [ 'Hey, sweetie! Thank you so much for coming by. What can I help you with?<.convnode servicerequest> ',
              'Good afternoon! I\'m so glad you came by to see me. What can I do for you?<.convnode servicerequest> ',
              'Hello! It\'s so good to have you drop by today. Is there anything I can do for you?<.convnode servicerequest> '
            ]
        ;

        ++ countyRecorderPostMeetingReadyState: ConversationReadyState
            specialDesc = "{The countyrecorder/she} is busy stamping some documents and filing them away. "
            stateDesc = "{The countyrecorder/she} is busy stamping some documents and filing them away. "
        ;
        +++ HelloTopic, StopEventList
            [ 'Hey, again! What can I do for you?<.convnode servicerequest> ',
              'I\'m so glad you thought of something I can help you with. What is it?<.convnode servicerequest> '
            ]
        ;

    + ConvNode 'servicerequest';
        ++ SpecialTopic 'notarize' ['notarize', 'notarize .*']
            topicResponse() {
                local notarizePattern = R'notarize (.+)';
                local notarizeWhat = '';
                
                if(rexMatch(notarizePattern, gAction.getOrigText())) {
                    notarizeWhat = rexGroup(1)[3];
                }
                else {
                    "Eager to help, she asks, <q>What would you like notarized?</q> ";
                    notarizeWhat = inputManager.getInputLine(nil, nil);
                }

                if(notarizeWhat.compareIgnoreCase('birth certificate') == 0) {
                    "She smiles and says, <q>I can certainly do that. If you'll hand it to me,
                     I'll take care of that right away.</q> ";
                }
                else {
                    "With a hint of disappointment in her voice, she says, <q>I'm sorry sweetie, I'm not able to notarize that. 
                     Let me know if there is anything else I can help you with.</q> ";
                     countyRecorder.setCurState(countyRecorderPostMeetingReadyState);
                }
            }

            noteInvocation(actor) {
                /* do something */
            }
        ;
        ++ DefaultAnyTopic
            "Sadly, she says, <q>I'm sorry sweetie, I can't help you with that.</q> "
            noteInvocation(actor) {
                countyRecorder.setCurState(countyRecorderPostMeetingReadyState);
            }
        ;
    
    + GiveTopic @birthCertificateFile
        topicResponse() {
            "She takes the birth certificate, carefully positions her stamp at the bottom, right-hand
             corner, and squeezes with all her might. When she removes the stamp, you see a perfectly
             imprinted notary seal.
             \b
             Next, she carefully removes the cap from an old Parker fountain pen and signs her
             notary seal.
             \b
             Then she looks up at you with an enormous smile and says, <q>There you go sweetheart!
             If there's ever anything else I can help you with, you just come right on back. By
             the way, would you mind signing our registration book by the door? We like to record
             how helpful we've been!</q>
             \b
             She then hands the birth certificate back to you. ";
             birthCertificateFile.notarize();
        }
    ;