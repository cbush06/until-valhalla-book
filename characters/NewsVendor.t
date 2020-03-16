#include <adv3.h>
#include <en_us.h>

newsVendor: Person 'news vendor' 'News Vendor' @newsStand
    "The news vendor is an elderly man. He's wearing khaki slacks, a cheap, striped button-up shirt,
     and some old loafers. "
    isHim = true
    isListed = true
    globalParamName = 'newsvendor'
;
    + newsVendorPreGreetingState: InConversationState
        specialDesc = "{The newsvendor/he} is sitting up in his chair listening to you. "
        stateDesc = "{The newsvendor/he} is sitting up in his chair listening to you. "
    ;
        ++ newsVendorPreGreetingReadyState: ConversationReadyState
            isInitState = true
            specialDesc = "{The newsvendor/he} is napping in his chair sitting next to the news stand. You hear
                           him snore every so often. His glasses are sitting on a shelf next to a beat-up, old
                           cash box. "
            stateDesc = "He's sleeping in his chair. "
        ;
        +++ HelloTopic, StopEventList
            [ 'He awakes with a start and squints at you before quickly donning his glasses. Speaking 
               with a raspy whistle in his voice, the vendor says, <q>Oh...oh...hello, there. I was 
               just catching a little shuteye. Let me know if you would like to buy anything. They\'re 
               <<timeMagazine.costStr>> each, the Time and Newsweek magazines.
               \b
               By the way, I just finished an interesting article on the Farshing War. Would you like 
               to read it?</q> 
               <.convnode take-article> ',

              'The old man snaps awake from another light nap. He looks up at you with a familiar smile,
               <q>Howdy again, boy! If you find something you like, magazines are all <<timeMagazine.costStr>>
               a piece. I also have a very interesting article about the Farshing Wars I finished reading
               this morning. It\'s by Dr. Fraunhofer, he\'s got to be one of the greatest minds of the
               century. Do you wanna borrow it?</q>
               <.convnode take-article>'
            ]
        ;
    
    + newsVendorPostGreetingState: InConversationState
        specialDesc = "{The newsvendor/he} is sitting up in his chair listening to you. "
        stateDesc = "{The newsvendor/he} is sitting up in his chair listening to you. "
    ;
        ++ newsVendorPostGreetingReadyState: ConversationReadyState
            specialDesc = "{The newsvendor/he} is lounging in his chair while browsing through the classifieds of the
             Mendocino Beacon newspaper. The paper's cover article discusses the spread of \"The Jello\" Virus. "
            stateDesc = "He's reading the Mendocino Beacon newspaper. "
        ;
        +++ HelloTopic, StopEventList
            [ 'Putting down his newspaper, the old man asks, <q>Did you change your mind about reading that article?</q>
               <.convnode takearticle> ',

              'He puts his paper down and gives you friendly smile, <q>If you changed your mind, I\'d still be glad
               to give you that history paper.</q>'
            ]
        ;
    
    + newsVendorPostAcceptState: HermitActorState
        specialDesc = "{The newsvendor/he} is lounging in his chair while browsing through the classifieds of the
         Mendocino Beacon newspaper. The paper's cover article discusses the spread of \"The Jello\" Virus. "
        noResponse = "Without putting down his paper, he says, <q>All magazines are <<timeMagazine.costStr>>.</q> "
    ;

    + ConvNode 'take-article';
        ++ YesTopic, SuggestedYesTopic
            "He replies, with a slight grin, <q>Here you go! I think you'll really enjoy it, even if you're not a 
             history buff. It covers the timeline of the war and examines its lasting implications.</q> "
            noteInvocation( actor ) {
                historyArticle.discovered = true;
                historyArticle.moveInto( backpack );
                newsVendor.setCurState( newsVendorPostAcceptState );
            }
        ;
        ++ NoTopic, SuggestedNoTopic
            "Trying to hide his dismay, he says, <q>Oh, okay then. Let me know if you change your mind. It's a really 
             great read.</q> "
            noteInvocation( actor ) {
                newsVendor.setCurState( newsVendorPostGreetingReadyState );
            }
        ;

    + historyArticle: Hidden, Readable 'history article' 'history article'
        read = nil

        readDesc() {
            if(!self.read) {
                historyLessonAchievement.awardPoints();
                self.read = true;
            }
            
            "\n\t\t<b>THE FARSHING WAR AND ITS LASTING IMPACT</b>
             \n\t\t\t\t<b>by DR. WERNER VON FRAUNHOFER</b>
             \n\t\t\t\t\t\t<b>May 31, 2153</b>
             \b
             Today marks the 33rd anniversary of our first detection of the Kyron's mothership. 
             \nNo doubt, the scientists at the Arecibo observatory, on the night of May 31, 2120, 
             \ncould never have foreseen the history unfolding before their eyes as they realized 
             \nthe object they initially thought an asteroid was <i>slowing down</i>.
             \b
             The world's social and polictical orders, as they had been known for more than a century,
             \nchanged nearly overnight. The United Nations realized, with only three years until 
             \narrival, <i>Earth</i> needed to prepare to combat any threat the <q>object</q> might 
             \npose and to greet it with a unified front and a single message from all of humanity. 
             \nThus, the UN began transforming itself into today's Global Coalition. At first, it 
             \nconsisted only of the UN's permanent members (China, France, Russia, the United Kingdom, 
             \nand the United States), but 30 more nations joined in the following 18 months. 
             \b
             Readiness for whatever was coming toward Earth was the GC's primary mission, and it
             \nstarted by overseeing the international build-up of military forces and Research
             \nand Development into long-distance space travel, faster-than-light drives, advanced
             \nweaponry, linguistics, super-light-speed communications, planetary defense systems,
             \nand more. These efforts required more than just funding and political like-mindedness,
             \nthey required manpower on a scale unrivaled by any event in all of human history.
             \b
             Skilled manpower had to be developed rapidly and efficiently. The GC created ten
             \ninternational universities, two in each of the United Nation's original, permanent
             \nmembers (China, France, Russia, the United Kingdom, and the United States). Military
             \nservice men and women had to be trained, as well. Each of these five nations retrofitted
             \ntheir largest military training centers to train citizens for the GC army and advanced/space
             \nwarfare. A draft was implemented globally to staff both military and civilian occupations.
             \nBy the time the Kyron finally arrived, the GC Army had a total of 1.6bn uniformed and
             \ncivilian members.
             \b
             On August 1, 2123 at 1117 hours EST, the Kyron ship attained a geosynchronous orbit over
             \nNew York City, New York. Contact was initiated shortly after at 1125 hours EST when
             \nthe Kyron hijacked a Ku-band satellite signal and began broadcasting a written message
             \nin English advertising their peaceful intentions and desires to meet with leaders of
             \nhuman society. America responded in the affirmative requesting a neutral setting to
             \nensure the safety of their representatives and ours. At 1146 hours EST, a platform descended
             \nfrom the Kyron ship to a holding altitude of 22,000ft directly above the One World Trade
             \nCenter. The Secretary of State, Camelia Bordeaux, and her envoy of 12 GC Space Marines
             \narrived at the platform via helicopter. What proceeded from that meeting was the 22nd
             \ncentury equivalent of Nicolaus Copernicus's revelation that the Sun was at the center of
             \nour Solar System and Christopher Columbus's first meeting with Native American's all
             \nrolled into one momentuous event.
             \b
             Three months of introductions and negotiations followed. Mankind soon discovered the Kyron
             \nwere looking to trade for materials they needed to repair their generation ship and our
             \npermission to set up an outpost on our moon. The Kyron were explorers seeking to
             \nreplenish their supplies and equipment and to use Earth and her moon as stop along
             \ntheir way. Earth's leaders came together and agreed to their requests in return for
             \ntechnology. With a quick handshake began mankind's second technological revolution.
             \b
             Ten years later, another comet-sized mass headed toward Earth (and slowing down) was detected.
             \nThe Kyron warned us that it was not their people and it was not friendly. They began fortifying
             \ntheir ships and preparing for war. The Farshing ship was detected on July 22, 2133 and arrived
             \njust beyond our moon on October 4, 2134. Initially, they attacked and destroyed the Kyron
             \noutpost and proceeded to mount an offensive against Earth. The GC coordinated a world-wide
             \noffensive with the Kyron. After 7 months, the war came to an end with a fatal blow dealt
             \nby the Kyron self-destructing their mothership directly below the Farshing mothership. The war
             \nexacted a massive toll on both races: 1.5bn humans died and 300,000 of the 450,000 Kyron died.
             \b
             Despite these losses, a beautiful, new society emerged from Earth's ashes. Today, we enjoy
             \na world created from the best of our two civilizations. Thanks to the Kyron's amazing
             \ntechnologies and the efforts of both Kyron and human scientists, we have moved technology
             \nforward exponentially, cured nearly every disease known to mankind, and made Faster-than-Light
             \n(FTL) travel a reality. With the Kyron's assistance, we are building a fleet of spacefaring
             \nresearch vessels, war vessels, and generation ships to expand mankind's and the Kyron's reach
             \ninto the depths of the universe.
             \b
             Like a Phoenix, we have arisen from the ashes of the Farshing war victoriously, beautifully,
             \nwith grandeur, and aspirations that cannot be shaken by even the worst of storms. Man's
             \nirrational fears of little green men have given way to a friendship, a partnership, that
             \nwill take us to the places we could only have dreamt of before.
             ";
        }
    ;