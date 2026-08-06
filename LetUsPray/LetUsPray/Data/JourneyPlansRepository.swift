import Foundation

enum JourneyPlansRepository {
    private static let missionariesPlan = PrayerPlan(
        id: "pray-for-missionaries",
        title: "Pray for Missionaries",
        subtitle: "Pray for those taking the Gospel to the nations.",
        description: "A 16-day prayer journey supporting missionaries and the people they serve.",
        category: .encouragement,
        durationDays: 16,
        accentColorName: "encouragement",
        coverIcon: "airplane",
        days: []
    )

    private static let missionaryPlaceholderFocus = JourneyMissionInformation(
        countryOrPeopleGroup: "Country / People Group Placeholder",
        approximatePopulation: "Approximate Population Placeholder",
        approximateChristianPercentage: "Approximate Christian Percentage Placeholder",
        prayerFocus: "Mission Prayer Focus Placeholder"
    )

    private static func missionaryPlaceholderDay(_ number: Int) -> JourneyDay {
        JourneyDay(
            dayNumber: number,
            title: "Day \(number) Title Placeholder",
            chapterReference: "Scripture Reference Placeholder",
            summary: "Summary Placeholder",
            primaryScripture: JourneyScripture(
                reference: "Scripture Reference Placeholder",
                text: "Scripture Text Placeholder"
            ),
            devotional: "Devotional Placeholder",
            reflections: (1...3).map { reflectionNumber in
                JourneyReflection(
                    id: "pray-for-missionaries-\(number)-reflection-\(reflectionNumber)",
                    scripture: JourneyScripture(
                        reference: "Reflection Scripture Placeholder",
                        text: "Reflection Text Placeholder"
                    ),
                    prayer: "Reflection Prayer Placeholder"
                )
            },
            closingPrayer: "Closing Prayer Placeholder",
            missionFocus: missionaryPlaceholderFocus
        )
    }

    static let allPlans: [JourneyPlan] = PrayerPlansRepository.allPlans
        .filter { $0.id == "easter" }
        .map {
            JourneyPlan(
                metadata: $0,
                days: [
                    JourneyDay(
                        dayNumber: 1,
                        title: "The Promise of the Messiah",
                        chapterReference: "Isaiah 53",
                        summary: "Long before the cross and the empty tomb, God promised to send a Savior. Every prophecy pointed toward Jesus Christ, revealing His perfect plan of redemption fulfilled through His Son.",
                        primaryScripture: JourneyScripture(
                            reference: "Isaiah 53:5–6",
                            text: "But He was pierced through for our transgressions, He was crushed for our iniquities; The chastening for our well-being fell upon Him, And by His scourging we are healed. All of us like sheep have gone astray, Each of us has turned to his own way; But the LORD has caused the iniquity of us all To fall on Him."
                        ),
                        devotional: """
                        Before there was an empty tomb, there was a promise.

                        Long before Jesus was born in Bethlehem, before the cross was raised on Calvary, and before the stone was rolled away, God was already revealing His plan to rescue humanity. From the very beginning, when sin entered the world, God promised that evil would not have the final word. Throughout generations, He spoke through His prophets, pointing His people toward the coming Messiah—the One who would bear our sins, restore our relationship with the Father, and bring lasting hope.

                        Isaiah painted a remarkable picture of this coming Savior centuries before Jesus walked the earth. He described a Servant who would willingly suffer, not because He deserved punishment, but because we did. Every wound, every sorrow, and every sacrifice would become part of God's perfect plan of redemption. What appeared to be defeat would ultimately become the greatest victory in history.

                        As we begin this Easter journey, we remember that the cross was never an accident or an afterthought. It was the fulfillment of God's faithful promise. Easter begins with a God who keeps His Word, whose love reaches across generations, and whose plan has always been to bring His people home through Jesus Christ.
                        """,
                        reflections: [
                            JourneyReflection(
                                id: "easter-1-reflection-1",
                                scripture: JourneyScripture(
                                    reference: "Genesis 3:15",
                                    text: "And I will put enmity Between you and the woman, And between your seed and her seed; He shall bruise you on the head, And you shall bruise him on the heel."
                                ),
                                prayer: "Heavenly Father, thank You that from the very beginning You promised a Savior. Even when humanity fell into sin, Your plan of redemption had already begun. Help me trust that Your promises never fail."
                            ),
                            JourneyReflection(
                                id: "easter-1-reflection-2",
                                scripture: JourneyScripture(
                                    reference: "Micah 5:2",
                                    text: "But as for you, Bethlehem Ephrathah, Too little to be among the clans of Judah, From you One will go forth for Me to be ruler in Israel. His goings forth are from long ago, From the days of eternity."
                                ),
                                prayer: "Lord, thank You for fulfilling every promise concerning the Messiah. Strengthen my faith as I remember that Your plans are always perfect and Your timing is always right."
                            ),
                            JourneyReflection(
                                id: "easter-1-reflection-3",
                                scripture: JourneyScripture(
                                    reference: "Luke 24:25–27",
                                    text: "And He said to them, 'O foolish men and slow of heart to believe in all that the prophets have spoken!...' Then beginning with Moses and with all the prophets, He explained to them the things concerning Himself in all the Scriptures."
                                ),
                                prayer: "Lord Jesus, open my heart to understand the Scriptures more deeply. Help me see that all of God's Word points to You and the salvation You came to accomplish."
                            )
                        ],
                        closingPrayer: "Heavenly Father, thank You for being a God who always keeps His promises. Long before the cross, You prepared the way for our salvation through Your Son, Jesus Christ. As I begin this Easter journey, help me see the beauty of Your redemptive plan and the depth of Your love for the world. Strengthen my faith as I follow the footsteps of Christ from promise to fulfillment, from sacrifice to resurrection. May this journey draw me closer to Jesus and fill my heart with renewed hope, gratitude, and worship. In Jesus' name, Amen."
                    ),
                    JourneyDay(
                        dayNumber: 2,
                        title: "The King Enters Jerusalem",
                        chapterReference: "Matthew 21",
                        summary: "Jesus entered Jerusalem as the promised King, fully aware that the path before Him would lead to the cross. His humility, obedience, and love reveal the heart of God's salvation.",
                        primaryScripture: JourneyScripture(
                            reference: "Matthew 21:8–9",
                            text: "Most of the multitude spread their garments in the road, and others were cutting branches from the trees and spreading them in the road. The multitudes going before Him, and those who followed after were crying out, 'Hosanna to the Son of David; Blessed is He who comes in the name of the Lord; Hosanna in the highest!'"
                        ),
                        devotional: """
                        The streets of Jerusalem were filled with excitement as Jesus entered the city. Crowds welcomed Him with palm branches and joyful praise, recognizing Him as the promised Son of David. Their cries of "Hosanna" expressed hope that the long-awaited King had finally come.

                        Yet Jesus entered the city unlike any earthly ruler. He did not arrive on a mighty war horse but on a humble donkey, fulfilling the words spoken centuries earlier by the prophet Zechariah. His kingdom would not be established through military power but through sacrificial love.

                        The people celebrated because they expected immediate freedom from Roman rule. Jesus came to offer something even greater—the freedom found through forgiveness of sin and reconciliation with God. Every step He took into Jerusalem brought Him closer to the cross, where He would willingly give His life for the salvation of the world.

                        As we continue this Easter journey, we remember that Jesus is still our King. He invites us not only to praise Him with our words but also to follow Him with humble, obedient hearts.
                        """,
                        reflections: [
                            JourneyReflection(
                                id: "easter-2-reflection-1",
                                scripture: JourneyScripture(
                                    reference: "Zechariah 9:9",
                                    text: "Rejoice greatly, O daughter of Zion!... Behold, your king is coming to you; He is just and endowed with salvation, Humble, and mounted on a donkey."
                                ),
                                prayer: "Lord Jesus, thank You for fulfilling every prophecy and revealing Yourself as the humble King who came to save."
                            ),
                            JourneyReflection(
                                id: "easter-2-reflection-2",
                                scripture: JourneyScripture(
                                    reference: "John 12:12–13",
                                    text: "On the next day the great multitude who had come to the feast... took the branches of the palm trees and went out to meet Him, and began to shout, 'Hosanna! Blessed is He who comes in the name of the Lord, even the King of Israel.'"
                                ),
                                prayer: "Help me welcome You with sincere worship and recognize You as the true King of my life every day."
                            ),
                            JourneyReflection(
                                id: "easter-2-reflection-3",
                                scripture: JourneyScripture(
                                    reference: "Philippians 2:8",
                                    text: "Being found in appearance as a man, He humbled Himself by becoming obedient to the point of death, even death on a cross."
                                ),
                                prayer: "Teach me to follow Your example of humility and obedience, trusting the Father's will above my own."
                            )
                        ],
                        closingPrayer: "Heavenly Father, thank You for sending Jesus, the humble King who entered Jerusalem with perfect love and unwavering obedience. As the crowds welcomed Him with praise, help me welcome Him into every area of my life with genuine faith and wholehearted devotion. Teach me to follow my Savior with humility, trusting His purposes even when the road is difficult. May my life honor the King who willingly walked toward the cross so that I might receive eternal life. In Jesus' name, Amen."
                    ),
                    JourneyDay(
                        dayNumber: 3,
                        title: "A Servant Who Washes Feet",
                        chapterReference: "John 13",
                        summary: "On the night before His crucifixion, Jesus demonstrated true greatness through humble service. He calls every believer to love others with the same servant's heart.",
                        primaryScripture: JourneyScripture(
                            reference: "John 13:14–15",
                            text: "If I then, the Lord and the Teacher, washed your feet, you also ought to wash one another's feet. For I gave you an example that you also should do as I did to you."
                        ),
                        devotional: """
                        The King who entered Jerusalem to the praises of the crowds now knelt before His disciples with a basin of water and a towel. The One who created the universe chose the position of the lowest servant. In that simple yet powerful act, Jesus revealed the true character of God's kingdom.

                        Peter struggled to understand why his Master would wash his feet. Like many of us, he expected greatness to look like power and honor. Instead, Jesus showed that true greatness is found in humility, sacrificial love, and serving others without seeking recognition.

                        Jesus knew the cross was only hours away. He knew betrayal, suffering, and death awaited Him. Yet His attention remained fixed on loving His disciples until the very end. His actions remind us that love is demonstrated not only through words but through willing service.

                        As we continue our Easter journey, may we learn to follow the example of our Savior. The hands that would soon bear the nails first washed dusty feet. That same love calls us to humbly serve one another for the glory of God.
                        """,
                        reflections: [
                            JourneyReflection(
                                id: "easter-3-reflection-1",
                                scripture: JourneyScripture(
                                    reference: "Mark 10:45",
                                    text: "For even the Son of Man did not come to be served, but to serve, and to give His life a ransom for many."
                                ),
                                prayer: "Lord Jesus, thank You for showing me that true greatness is found in serving others with humility and love."
                            ),
                            JourneyReflection(
                                id: "easter-3-reflection-2",
                                scripture: JourneyScripture(
                                    reference: "Philippians 2:3–4",
                                    text: "Do nothing from selfishness or empty conceit, but with humility of mind regard one another as more important than yourselves; do not merely look out for your own personal interests, but also for the interests of others."
                                ),
                                prayer: "Father, remove pride from my heart and teach me to value and serve others with genuine humility."
                            ),
                            JourneyReflection(
                                id: "easter-3-reflection-3",
                                scripture: JourneyScripture(
                                    reference: "Galatians 5:13",
                                    text: "For you were called to freedom, brethren; only do not turn your freedom into an opportunity for the flesh, but through love serve one another."
                                ),
                                prayer: "Help me use the freedom You have given me to lovingly serve those around me each day."
                            )
                        ],
                        closingPrayer: "Heavenly Father, thank You for the perfect example of Jesus Christ, who humbled Himself to serve others even as He prepared to give His life for the world. Teach me to follow His example by laying aside pride, loving sacrificially, and serving with joy. May my life reflect the humility of my Savior, and may every act of kindness point others to Him. Shape my heart to become more like Christ each day. In Jesus' name, Amen."
                    ),
                    JourneyDay(
                        dayNumber: 4,
                        title: "The New Covenant",
                        chapterReference: "Luke 22",
                        summary: "At the Last Supper, Jesus established the New Covenant through His body and blood, inviting all who believe in Him into a restored relationship with God through His sacrifice.",
                        primaryScripture: JourneyScripture(
                            reference: "Luke 22:19–20",
                            text: "And when He had taken some bread and given thanks, He broke it and gave it to them, saying, 'This is My body which is given for you; do this in remembrance of Me.' And in the same way He took the cup after they had eaten, saying, 'This cup which is poured out for you is the new covenant in My blood.'"
                        ),
                        devotional: """
                        As Jesus shared one final meal with His disciples, He transformed an ancient Passover celebration into something entirely new. The bread and the cup were no longer only reminders of Israel's deliverance from Egypt—they now pointed to the greater deliverance that would come through His own sacrifice.

                        Jesus knew that within hours His body would be broken and His blood would be poured out. Yet instead of focusing on His own suffering, He lovingly prepared His disciples to understand the meaning of the cross. He was establishing a New Covenant, one that would offer forgiveness, reconciliation, and eternal life to everyone who places their faith in Him.

                        The Old Covenant revealed humanity's need for salvation. The New Covenant fulfilled that need through Jesus Christ, the perfect Lamb of God. His sacrifice accomplished what no earthly sacrifice could ever achieve: complete forgiveness of sin and direct access to the Father.

                        As we continue this Easter journey, may we remember that every time we reflect on the Lord's Supper, we celebrate not only His sacrifice but also the everlasting covenant of grace secured through His love.
                        """,
                        reflections: [
                            JourneyReflection(
                                id: "easter-4-reflection-1",
                                scripture: JourneyScripture(
                                    reference: "1 Corinthians 11:26",
                                    text: "For as often as you eat this bread and drink the cup, you proclaim the Lord's death until He comes."
                                ),
                                prayer: "Lord Jesus, help me remember Your sacrifice with gratitude and proclaim Your saving work through the way I live."
                            ),
                            JourneyReflection(
                                id: "easter-4-reflection-2",
                                scripture: JourneyScripture(
                                    reference: "Hebrews 9:15",
                                    text: "For this reason He is the mediator of a new covenant, so that... those who have been called may receive the promise of the eternal inheritance."
                                ),
                                prayer: "Father, thank You for the New Covenant established through Christ, giving me the hope of eternal life."
                            ),
                            JourneyReflection(
                                id: "easter-4-reflection-3",
                                scripture: JourneyScripture(
                                    reference: "Jeremiah 31:33",
                                    text: "But this is the covenant which I will make with the house of Israel after those days,' declares the LORD, 'I will put My law within them and on their heart I will write it; and I will be their God, and they shall be My people.'"
                                ),
                                prayer: "Write Your truth upon my heart and help me live each day as one who belongs completely to You."
                            )
                        ],
                        closingPrayer: "Heavenly Father, thank You for establishing the New Covenant through the sacrifice of Your Son, Jesus Christ. Thank You that His body was given and His blood was poured out so that I could receive forgiveness, reconciliation, and eternal life. Help me never take this incredible gift for granted. As I remember His sacrifice, deepen my love for Him and strengthen my commitment to faithfully follow Him each day. May my life continually proclaim the grace and mercy found only in Jesus Christ. In Jesus' name, Amen."
                    ),
                    JourneyDay(
                        dayNumber: 5,
                        title: "Gethsemane",
                        chapterReference: "Matthew 26",
                        summary: "In the Garden of Gethsemane, Jesus willingly surrendered to the Father's will. His perfect obedience became the pathway to our redemption.",
                        primaryScripture: JourneyScripture(
                            reference: "Matthew 26:39",
                            text: "And He went a little beyond them, and fell on His face and prayed, saying, 'My Father, if it is possible, let this cup pass from Me; yet not as I will, but as You will.'"
                        ),
                        devotional: """
                        As the night grew darker, Jesus entered the Garden of Gethsemane knowing exactly what lay ahead. The betrayal, the trials, the suffering, and the cross were no surprise to Him. Yet in that quiet place of prayer, we see both His true humanity and His perfect obedience.

                        The weight of humanity's sin rested before Him. Jesus experienced deep sorrow and anguish, yet He never turned away from the Father's plan. Instead, He surrendered His own will completely, choosing obedience over comfort and sacrifice over escape.

                        Gethsemane reminds us that true strength is often found in surrender. Jesus trusted His Father even when the path led through suffering. His willingness to obey opened the way for our forgiveness and reconciliation with God.

                        As we continue this Easter journey, may we learn from our Savior's example. When life is difficult and God's path seems costly, may we also pray, "Not my will, but Yours be done," trusting that the Father's plans are always good.
                        """,
                        reflections: [
                            JourneyReflection(
                                id: "easter-5-reflection-1",
                                scripture: JourneyScripture(
                                    reference: "Luke 22:43",
                                    text: "Now an angel from heaven appeared to Him, strengthening Him."
                                ),
                                prayer: "Father, thank You that You strengthen Your children in times of weakness. Help me rely on Your strength instead of my own."
                            ),
                            JourneyReflection(
                                id: "easter-5-reflection-2",
                                scripture: JourneyScripture(
                                    reference: "Hebrews 5:8",
                                    text: "Although He was a Son, He learned obedience from the things which He suffered."
                                ),
                                prayer: "Lord Jesus, teach me to trust and obey the Father even when the path is difficult."
                            ),
                            JourneyReflection(
                                id: "easter-5-reflection-3",
                                scripture: JourneyScripture(
                                    reference: "Philippians 2:8",
                                    text: "Being found in appearance as a man, He humbled Himself by becoming obedient to the point of death, even death on a cross."
                                ),
                                prayer: "Help me walk in humility and obedience, following the perfect example of Christ."
                            )
                        ],
                        closingPrayer: "Heavenly Father, thank You for the perfect obedience of Jesus Christ. In the garden, He willingly surrendered Himself to Your will so that I could receive forgiveness and eternal life. Teach me to trust You in every circumstance, especially when the path is difficult. Give me courage to surrender my plans, my fears, and my future into Your hands, knowing that Your purposes are always good. May the example of Jesus inspire me to walk in faithful obedience every day. In Jesus' name, Amen."
                    ),
                    JourneyDay(
                        dayNumber: 6,
                        title: "The Cross",
                        chapterReference: "John 19",
                        summary: "At the cross, Jesus willingly gave His life as the perfect sacrifice for the sins of the world. Through His death, God's justice and mercy met, opening the way for salvation to everyone who believes.",
                        primaryScripture: JourneyScripture(
                            reference: "John 19:17–18",
                            text: "They took Jesus, therefore, and He went out, bearing His own cross, to the place called the Place of a Skull, which is called in Hebrew, Golgotha. There they crucified Him, and with Him two other men, one on either side, and Jesus in between."
                        ),
                        devotional: """
                        The road that began in Bethlehem and continued through the streets of Jerusalem now led to Golgotha. There, the Son of God willingly stretched out His hands upon the cross. Nails did not hold Him there—His love did. Jesus chose to endure suffering so that sinful humanity could be reconciled to a holy God.

                        The cross reveals both the seriousness of sin and the greatness of God's love. Every accusation, every wound, every drop of blood reminds us of the cost of our redemption. Jesus became the perfect sacrifice, accomplishing what no animal sacrifice or human effort could ever accomplish.

                        What looked like defeat to the world was, in reality, the greatest victory in history. At the cross, justice was satisfied, mercy was extended, and the debt of sin was paid in full. Through Christ's sacrifice, forgiveness became available to all who place their faith in Him.

                        As we stand before the cross today, may we never lose our sense of wonder. The Savior who had every right to judge us chose instead to save us. His sacrifice calls us to respond with humble gratitude, wholehearted worship, and faithful obedience.
                        """,
                        reflections: [
                            JourneyReflection(
                                id: "easter-6-reflection-1",
                                scripture: JourneyScripture(
                                    reference: "Romans 5:8",
                                    text: "But God demonstrates His own love toward us, in that while we were yet sinners, Christ died for us."
                                ),
                                prayer: "Father, thank You for loving me even while I was still a sinner and for giving Your Son to save me."
                            ),
                            JourneyReflection(
                                id: "easter-6-reflection-2",
                                scripture: JourneyScripture(
                                    reference: "2 Corinthians 5:21",
                                    text: "He made Him who knew no sin to be sin on our behalf, so that we might become the righteousness of God in Him."
                                ),
                                prayer: "Lord Jesus, thank You for taking my place so that I could receive Your righteousness and stand forgiven before God."
                            ),
                            JourneyReflection(
                                id: "easter-6-reflection-3",
                                scripture: JourneyScripture(
                                    reference: "1 Peter 2:24",
                                    text: "And He Himself bore our sins in His body on the cross, so that we might die to sin and live to righteousness; for by His wounds you were healed."
                                ),
                                prayer: "Help me live each day in the freedom You purchased through Your sacrifice and walk in the righteousness You have given me."
                            )
                        ],
                        closingPrayer: "Heavenly Father, thank You for the immeasurable love You demonstrated through the cross of Jesus Christ. Thank You that His sacrifice accomplished what I could never achieve on my own—forgiveness, reconciliation, and eternal life. Help me never take the cross for granted. Let the truth of Christ's sacrifice shape the way I live, love, forgive, and worship. May I always remember that my hope is found not in my own goodness but in the finished work of Jesus Christ on the cross. In Jesus' name, Amen."
                    ),
                    JourneyDay(
                        dayNumber: 7,
                        title: "It Is Finished",
                        chapterReference: "John 19",
                        summary: "Jesus' final words from the cross declared that the work of redemption was complete. Through His finished work, every believer can rest in the assurance of God's saving grace.",
                        primaryScripture: JourneyScripture(
                            reference: "John 19:30",
                            text: "Therefore when Jesus had received the sour wine, He said, 'It is finished!' And He bowed His head and gave up His spirit."
                        ),
                        devotional: """
                        As Jesus hung upon the cross, He spoke three powerful words that forever changed history: "It is finished." This was not a cry of defeat but a declaration of victory. The mission the Father had entrusted to Him had been perfectly completed.

                        Every prophecy concerning the suffering Messiah had been fulfilled. Every requirement of God's justice had been satisfied. The debt of sin that humanity could never repay was paid in full through the sacrifice of Jesus Christ. Nothing needed to be added, and nothing could ever improve what He had accomplished.

                        Because Jesus finished the work of redemption, salvation is not earned through human effort but received by faith. We do not strive to gain God's acceptance; we rest in the finished work of Christ. His sacrifice is complete, sufficient, and eternal.

                        As we conclude the first week of this Easter journey, may our hearts be filled with gratitude and confidence. The cross stands as the eternal reminder that God's love has accomplished everything necessary for our salvation. In Christ, the work is finished.
                        """,
                        reflections: [
                            JourneyReflection(
                                id: "easter-7-reflection-1",
                                scripture: JourneyScripture(
                                    reference: "Hebrews 10:12",
                                    text: "But He, having offered one sacrifice for sins for all time, SAT DOWN AT THE RIGHT HAND OF GOD."
                                ),
                                prayer: "Lord Jesus, thank You that Your perfect sacrifice was offered once for all, providing complete forgiveness through Your finished work."
                            ),
                            JourneyReflection(
                                id: "easter-7-reflection-2",
                                scripture: JourneyScripture(
                                    reference: "Ephesians 2:8–9",
                                    text: "For by grace you have been saved through faith; and that not of yourselves, it is the gift of God; not as a result of works, so that no one may boast."
                                ),
                                prayer: "Father, help me rest in Your grace and never rely on my own efforts for the salvation You freely give through Christ."
                            ),
                            JourneyReflection(
                                id: "easter-7-reflection-3",
                                scripture: JourneyScripture(
                                    reference: "Romans 8:1",
                                    text: "Therefore there is now no condemnation for those who are in Christ Jesus."
                                ),
                                prayer: "Thank You for removing my condemnation through Jesus. Help me live each day in the freedom and assurance of Your saving grace."
                            )
                        ],
                        closingPrayer: "Heavenly Father, thank You that through Jesus Christ the work of redemption has been fully accomplished. Thank You that I do not have to earn Your love or strive for Your acceptance, because Christ has already paid the full price for my salvation. Fill my heart with peace as I rest in His finished work. May I never lose sight of the cross, and may my life continually reflect gratitude, worship, and joyful obedience to the Savior who gave everything for me. In Jesus' name, Amen."
                    ),
                    JourneyDay(
                        dayNumber: 8,
                        title: "The Empty Tomb",
                        chapterReference: "Matthew 28",
                        summary: "The tomb could not hold Jesus. His resurrection is the greatest victory in history, proving His power over sin, death, and the grave, and giving every believer an unshakable hope.",
                        primaryScripture: JourneyScripture(
                            reference: "Matthew 28:5–6",
                            text: "The angel said to the women, 'Do not be afraid; for I know that you are looking for Jesus who has been crucified. He is not here, for He has risen, just as He said. Come, see the place where He was lying.'"
                        ),
                        devotional: """
                        The silence of the tomb was broken by the greatest news the world has ever heard: "He is not here, for He has risen." The stone was not rolled away so Jesus could leave—it was rolled away so the world could witness that the tomb was empty. Death had been defeated, and the promises of God had been fulfilled.

                        Everything Jesus had taught, every miracle He performed, and every promise He made was confirmed through His resurrection. The cross demonstrated His love, but the empty tomb declared His victory. Sin no longer held the final word, and death no longer had ultimate power over those who belong to Him.

                        The resurrection changed the course of history forever. Because Jesus lives, our faith is not built upon a memory but upon a living Savior who reigns forever. His victory became our victory, and His life became the source of our eternal hope.

                        As we begin the second week of this Easter journey, let us rejoice with hearts full of gratitude and awe. The tomb is empty, Christ is alive, and every promise of God stands secure through our risen Lord.
                        """,
                        reflections: [
                            JourneyReflection(
                                id: "easter-8-reflection-1",
                                scripture: JourneyScripture(
                                    reference: "John 11:25",
                                    text: "Jesus said to her, 'I am the resurrection and the life; he who believes in Me will live even if he dies.'"
                                ),
                                prayer: "Lord Jesus, thank You for being the resurrection and the life. Because You live, I have hope that nothing in this world can take away."
                            ),
                            JourneyReflection(
                                id: "easter-8-reflection-2",
                                scripture: JourneyScripture(
                                    reference: "1 Corinthians 15:20",
                                    text: "But now Christ has been raised from the dead, the first fruits of those who are asleep."
                                ),
                                prayer: "Father, thank You that Christ's resurrection guarantees the future resurrection of all who belong to Him."
                            ),
                            JourneyReflection(
                                id: "easter-8-reflection-3",
                                scripture: JourneyScripture(
                                    reference: "Romans 6:9",
                                    text: "Knowing that Christ, having been raised from the dead, is never to die again; death no longer is master over Him."
                                ),
                                prayer: "Help me live with confidence each day, knowing that Jesus has forever conquered death through His resurrection."
                            )
                        ],
                        closingPrayer: "Heavenly Father, thank You for the glorious victory of the resurrection. Thank You that the tomb is empty, death has been defeated, and Jesus Christ lives forever. Fill my heart with hope, joy, and unwavering faith as I remember that my Savior is alive. Help me live each day in the confidence that nothing is impossible for You and that every promise You have made is trustworthy. May the power of the risen Christ transform my life and become my constant source of hope and strength. In Jesus' name, Amen."
                    ),
                    JourneyDay(
                        dayNumber: 9,
                        title: "The Risen Savior Appears",
                        chapterReference: "John 20",
                        summary: "The risen Jesus revealed Himself to His followers, replacing their sorrow with joy and proving beyond doubt that He had conquered death forever.",
                        primaryScripture: JourneyScripture(
                            reference: "John 20:19–20",
                            text: "So when it was evening on that day, the first day of the week... Jesus came and stood in their midst and said to them, 'Peace be with you.' And when He had said this, He showed them both His hands and His side. The disciples then rejoiced when they saw the Lord."
                        ),
                        devotional: """
                        The disciples had hidden themselves behind locked doors, overwhelmed by fear, grief, and uncertainty. Everything they had hoped for seemed lost. Yet in a single moment, the risen Jesus stood among them. His presence changed despair into joy and fear into confident faith.

                        Jesus did not greet them with words of condemnation for abandoning Him. Instead, His first words were, "Peace be with you." The scars in His hands and side became lasting evidence that the crucified Savior was now alive forever. His resurrection was no illusion—it was a living reality witnessed by those who knew Him best.

                        The risen Christ still meets people in their moments of fear and uncertainty. He brings peace where there is anxiety, hope where there is despair, and confidence where there is doubt. Because He lives, we never face life's challenges alone.

                        As we continue this Easter journey, may we welcome the living Christ into every area of our lives. His resurrection is not only a historical event but a present reality that continues to transform hearts today.
                        """,
                        reflections: [
                            JourneyReflection(
                                id: "easter-9-reflection-1",
                                scripture: JourneyScripture(
                                    reference: "Luke 24:36",
                                    text: "While they were telling these things, He Himself stood in their midst and said to them, 'Peace be to you.'"
                                ),
                                prayer: "Lord Jesus, thank You for meeting Your followers with peace. Calm every fear in my heart and remind me that You are always with me."
                            ),
                            JourneyReflection(
                                id: "easter-9-reflection-2",
                                scripture: JourneyScripture(
                                    reference: "John 20:29",
                                    text: "Jesus said to him, 'Because you have seen Me, have you believed? Blessed are they who did not see, and yet believed.'"
                                ),
                                prayer: "Father, strengthen my faith so that I will trust Your Son completely, even when I cannot see with my physical eyes."
                            ),
                            JourneyReflection(
                                id: "easter-9-reflection-3",
                                scripture: JourneyScripture(
                                    reference: "Revelation 1:17–18",
                                    text: "'Do not be afraid; I am the first and the last, and the living One; and I was dead, and behold, I am alive forevermore, and I have the keys of death and of Hades.'"
                                ),
                                prayer: "Lord Jesus, thank You that You are alive forevermore. Help me live each day with courage because death has been defeated through You."
                            )
                        ],
                        closingPrayer: "Heavenly Father, thank You that Jesus Christ is alive and continues to reveal Himself through Your Word and by the power of the Holy Spirit. Thank You that His presence replaces fear with peace and sorrow with joy. Strengthen my faith as I follow my risen Savior, and help me live each day with confidence, knowing that He is always with me. May the truth of the resurrection shape my heart, guide my steps, and fill my life with lasting hope. In Jesus' name, Amen."
                    ),
                    JourneyDay(
                        dayNumber: 10,
                        title: "Peace Be With You",
                        chapterReference: "John 20",
                        summary: "The risen Christ speaks peace into fearful hearts. His presence removes fear, restores hope, and reminds us that we are never alone.",
                        primaryScripture: JourneyScripture(
                            reference: "John 20:21",
                            text: "So Jesus said to them again, 'Peace be with you; as the Father has sent Me, I also send you.'"
                        ),
                        devotional: """
                        The resurrection did more than prove Jesus had conquered death—it transformed the hearts of His followers. The disciples had been hiding behind locked doors, uncertain about what the future would hold. Yet when Jesus appeared among them, He did not begin with correction or rebuke. He spoke peace.

                        This peace was far greater than the absence of conflict. It was the assurance that their sins had been forgiven, their future was secure, and their Savior was alive forever. Because Jesus had fulfilled the Father's plan of redemption, they no longer had to live as prisoners of fear.

                        That same peace is available to every believer today. Our circumstances may still be difficult, but the presence of the risen Christ changes how we face them. His peace steadies anxious hearts, strengthens weary souls, and reminds us that He remains faithful in every season.

                        As we continue this Easter journey, may we receive the peace Jesus freely gives and carry that peace into a world searching for lasting hope.
                        """,
                        reflections: [
                            JourneyReflection(
                                id: "easter-10-reflection-1",
                                scripture: JourneyScripture(
                                    reference: "Philippians 4:6–7",
                                    text: "Be anxious for nothing, but in everything by prayer and supplication with thanksgiving let your requests be made known to God. And the peace of God... will guard your hearts and your minds in Christ Jesus."
                                ),
                                prayer: "Father, replace my anxiety with the peace that comes from trusting You completely."
                            ),
                            JourneyReflection(
                                id: "easter-10-reflection-2",
                                scripture: JourneyScripture(
                                    reference: "Isaiah 26:3",
                                    text: "The steadfast of mind Thou wilt keep in perfect peace, Because he trusts in Thee."
                                ),
                                prayer: "Help me keep my thoughts fixed on You so I may experience Your perfect peace each day."
                            ),
                            JourneyReflection(
                                id: "easter-10-reflection-3",
                                scripture: JourneyScripture(
                                    reference: "John 14:27",
                                    text: "Peace I leave with you; My peace I give to you... Do not let your heart be troubled, nor let it be fearful."
                                ),
                                prayer: "Lord Jesus, thank You for giving me Your peace. Guard my heart from fear and teach me to rest confidently in Your presence."
                            )
                        ],
                        closingPrayer: "Heavenly Father, thank You for the peace that comes through the risen Christ. When fear tries to overwhelm me, remind me that Jesus has already conquered sin, death, and the grave. Fill my heart with the confidence that You are always with me and that Your promises never fail. Help me become a bearer of Your peace to those around me, reflecting the hope and assurance found only in Jesus Christ. In Jesus' name, Amen."
                    ),
                    JourneyDay(
                        dayNumber: 11,
                        title: "New Life in Christ",
                        chapterReference: "2 Corinthians 5",
                        summary: "Because Jesus conquered death, everyone who believes in Him is made new. The resurrection is not only a historical event—it transforms our lives today.",
                        primaryScripture: JourneyScripture(
                            reference: "2 Corinthians 5:17",
                            text: "Therefore if any man is in Christ, he is a new creature; the old things passed away; behold, new things have come."
                        ),
                        devotional: """
                        The resurrection of Jesus did more than secure our future in eternity—it began a new life for every believer today. Through faith in Christ, we are no longer defined by our past failures, our guilt, or our sin. We have been made new by the saving work of our risen Savior.

                        The same power that raised Jesus from the dead now works within those who belong to Him. God does not simply improve our lives; He transforms our hearts. Our identity is no longer found in who we once were but in who we have become through Christ.

                        This new life is a daily invitation to walk in obedience, hope, and holiness. We are no longer slaves to sin because Christ has broken its power. His resurrection gives us both the freedom and the strength to live for Him.

                        As we continue this Easter journey, let us embrace the new life Jesus has given us. May every day become an opportunity to reflect His grace, His love, and the transforming power of His resurrection.
                        """,
                        reflections: [
                            JourneyReflection(
                                id: "easter-11-reflection-1",
                                scripture: JourneyScripture(
                                    reference: "Romans 6:4",
                                    text: "Therefore we have been buried with Him through baptism into death, so that as Christ was raised from the dead through the glory of the Father, so we too might walk in newness of life."
                                ),
                                prayer: "Father, help me leave behind my old ways and walk faithfully in the new life You have given me through Christ."
                            ),
                            JourneyReflection(
                                id: "easter-11-reflection-2",
                                scripture: JourneyScripture(
                                    reference: "Galatians 2:20",
                                    text: "I have been crucified with Christ; and it is no longer I who live, but Christ lives in me..."
                                ),
                                prayer: "Lord Jesus, let Your life be seen through my thoughts, words, and actions each day."
                            ),
                            JourneyReflection(
                                id: "easter-11-reflection-3",
                                scripture: JourneyScripture(
                                    reference: "Ephesians 4:22–24",
                                    text: "...lay aside the old self... and be renewed in the spirit of your mind, and put on the new self, which in the likeness of God has been created in righteousness and holiness of the truth."
                                ),
                                prayer: "Renew my mind daily and help me grow into the person You have called me to become."
                            )
                        ],
                        closingPrayer: "Heavenly Father, thank You that through the resurrection of Jesus Christ I have been made new. Thank You for forgiving my sins, giving me a new identity, and filling me with the hope of eternal life. Help me leave behind everything that does not honor You and walk each day in the power of Your Spirit. May my life reflect the transforming grace of Jesus so that others may see Him through me. Continue shaping me into His likeness until the day I stand in Your presence. In Jesus' name, Amen."
                    ),
                    JourneyDay(
                        dayNumber: 12,
                        title: "Our Living Hope",
                        chapterReference: "1 Peter 1",
                        summary: "Because Jesus Christ rose from the dead, every believer has a living hope that extends beyond this life into eternity.",
                        primaryScripture: JourneyScripture(
                            reference: "1 Peter 1:3",
                            text: "Blessed be the God and Father of our Lord Jesus Christ, who according to His great mercy has caused us to be born again to a living hope through the resurrection of Jesus Christ from the dead."
                        ),
                        devotional: """
                        The resurrection of Jesus does more than remind us of something that happened long ago—it gives us a living hope that remains secure today. Unlike the temporary hopes this world offers, our hope is anchored in the risen Christ, who conquered death forever.

                        Because Jesus lives, we know that suffering, loss, and even death do not have the final word. Every promise God has made is guaranteed through the resurrection of His Son. No circumstance can separate us from His love or steal the inheritance He has prepared for His children.

                        This living hope gives believers courage to persevere through trials, confidence for the future, and peace in the present. We do not place our hope in changing circumstances but in the unchanging Savior who reigns forever.

                        As we continue this Easter journey, may our hearts be filled with joyful confidence. The empty tomb assures us that our future is secure, our salvation is certain, and our hope will never disappoint because Jesus Christ is alive.
                        """,
                        reflections: [
                            JourneyReflection(
                                id: "easter-12-reflection-1",
                                scripture: JourneyScripture(
                                    reference: "Romans 15:13",
                                    text: "Now may the God of hope fill you with all joy and peace in believing, so that you will abound in hope by the power of the Holy Spirit."
                                ),
                                prayer: "Father, fill my heart with lasting hope, joy, and peace as I place my complete trust in You."
                            ),
                            JourneyReflection(
                                id: "easter-12-reflection-2",
                                scripture: JourneyScripture(
                                    reference: "Hebrews 6:19",
                                    text: "This hope we have as an anchor of the soul, a hope both sure and steadfast..."
                                ),
                                prayer: "Thank You for giving me a hope that remains firm and secure through every season of life."
                            ),
                            JourneyReflection(
                                id: "easter-12-reflection-3",
                                scripture: JourneyScripture(
                                    reference: "Titus 2:13",
                                    text: "Looking for the blessed hope and the appearing of the glory of our great God and Savior, Christ Jesus."
                                ),
                                prayer: "Help me live each day with eager expectation, looking forward to the glorious return of my Savior."
                            )
                        ],
                        closingPrayer: "Heavenly Father, thank You for giving me a living hope through the resurrection of Jesus Christ. Thank You that my future is secure because my Savior lives forever. When difficulties arise, remind me that my hope rests in You and not in this world. Strengthen my faith, fill me with peace, and help me encourage others with the hope You have given me. May my life reflect the confidence and joy that come from belonging to the risen Christ. In Jesus' name, Amen."
                    ),
                    JourneyDay(
                        dayNumber: 13,
                        title: "Go and Tell",
                        chapterReference: "Matthew 28",
                        summary: "The risen Christ commissioned His followers to proclaim the Gospel to all nations. Everyone who has experienced His saving grace is called to share the Good News with the world.",
                        primaryScripture: JourneyScripture(
                            reference: "Matthew 28:19–20",
                            text: "Go therefore and make disciples of all the nations, baptizing them in the name of the Father and the Son and the Holy Spirit, teaching them to observe all that I commanded you; and lo, I am with you always, even to the end of the age."
                        ),
                        devotional: """
                        The resurrection was never meant to remain a private celebration. After rising from the dead, Jesus gathered His followers and entrusted them with a mission that would change the world. They were called to go, make disciples, teach God's truth, and share the hope found only in Him.

                        This commission was not given only to the apostles. Every believer has been invited to participate in God's work by living as a faithful witness to Jesus Christ. Whether through our words, our actions, or the way we love others, our lives can point people toward the Savior who conquered sin and death.

                        The promise that accompanies this calling is just as powerful as the command itself. Jesus assured His followers that He would always be with them. We never carry His mission alone. The same Lord who defeated the grave continues to lead, strengthen, and empower His people through the Holy Spirit.

                        As we continue this Easter journey, may we embrace the privilege of sharing the Gospel with courage, compassion, and humility. The greatest news in history is meant to be proclaimed, and God invites each of us to take part in His redemptive work.
                        """,
                        reflections: [
                            JourneyReflection(
                                id: "easter-13-reflection-1",
                                scripture: JourneyScripture(
                                    reference: "Acts 1:8",
                                    text: "But you will receive power when the Holy Spirit has come upon you; and you shall be My witnesses..."
                                ),
                                prayer: "Holy Spirit, fill me with boldness and wisdom so I may faithfully share the love of Jesus wherever You lead me."
                            ),
                            JourneyReflection(
                                id: "easter-13-reflection-2",
                                scripture: JourneyScripture(
                                    reference: "Romans 10:14",
                                    text: "How then will they call on Him in whom they have not believed?... How will they hear without a preacher?"
                                ),
                                prayer: "Father, help me never keep the Gospel to myself but lovingly share the hope that is found in Christ."
                            ),
                            JourneyReflection(
                                id: "easter-13-reflection-3",
                                scripture: JourneyScripture(
                                    reference: "Isaiah 6:8",
                                    text: "Then I heard the voice of the Lord, saying, 'Whom shall I send, and who will go for Us?' Then I said, 'Here am I. Send me!'"
                                ),
                                prayer: "Lord, give me a willing heart that joyfully responds whenever You call me to serve and share Your truth."
                            )
                        ],
                        closingPrayer: "Heavenly Father, thank You for entrusting me with the incredible privilege of sharing the Gospel of Jesus Christ. Thank You that the risen Savior continues to work through ordinary people to accomplish Your extraordinary purposes. Fill me with courage, wisdom, compassion, and love so that my life reflects the hope of the resurrection. Open doors for me to share Your truth, and prepare the hearts of those who will hear it. May everything I do point others to Jesus Christ, in whom alone salvation is found. In Jesus' name, Amen."
                    ),
                    JourneyDay(
                        dayNumber: 14,
                        title: "Living in Resurrection Power",
                        chapterReference: "Ephesians 1",
                        summary: "The resurrection is not merely a past event to remember—it is the power that transforms how believers live every day. Through Jesus Christ, we are called to walk in victory, hope, holiness, and purpose.",
                        primaryScripture: JourneyScripture(
                            reference: "Ephesians 1:19–20",
                            text: "And what is the surpassing greatness of His power toward us who believe. These are in accordance with the working of the strength of His might which He brought about in Christ, when He raised Him from the dead and seated Him at His right hand in the heavenly places."
                        ),
                        devotional: """
                        The Easter journey does not end at the empty tomb. The resurrection of Jesus Christ continues to transform the lives of believers every single day. The same power that raised Christ from the dead now works in those who belong to Him, enabling them to live with hope, courage, holiness, and unwavering faith.

                        Because Jesus is alive, we no longer have to live defeated by fear, sin, or despair. His victory has become our victory. His life has become our life. Every challenge we face is viewed through the reality that our Savior reigns over sin, death, and every power of darkness.

                        Living in resurrection power means allowing Christ to shape our thoughts, our decisions, our relationships, and our purpose. It means walking each day with confidence that God is still working, still transforming hearts, and still accomplishing His perfect plan through His people.

                        As we conclude this Easter journey, may we never leave the message of the resurrection behind. Instead, let it become the foundation of how we live, serve, worship, forgive, and love until the day we stand face to face with our risen King.
                        """,
                        reflections: [
                            JourneyReflection(
                                id: "easter-14-reflection-1",
                                scripture: JourneyScripture(
                                    reference: "Romans 8:11",
                                    text: "But if the Spirit of Him who raised Jesus from the dead dwells in you, He who raised Christ Jesus from the dead will also give life to your mortal bodies through His Spirit who dwells in you."
                                ),
                                prayer: "Heavenly Father, help me live each day by the power of Your Holy Spirit, trusting that the same power which raised Christ is working within me."
                            ),
                            JourneyReflection(
                                id: "easter-14-reflection-2",
                                scripture: JourneyScripture(
                                    reference: "Philippians 3:10",
                                    text: "That I may know Him and the power of His resurrection and the fellowship of His sufferings, being conformed to His death."
                                ),
                                prayer: "Lord Jesus, help me know You more deeply each day and allow the power of Your resurrection to continually transform my life."
                            ),
                            JourneyReflection(
                                id: "easter-14-reflection-3",
                                scripture: JourneyScripture(
                                    reference: "Colossians 3:1–2",
                                    text: "Therefore if you have been raised up with Christ, keep seeking the things above... Set your mind on the things above, not on the things that are on earth."
                                ),
                                prayer: "Teach me to keep my heart and mind focused on You so my life reflects the hope and joy of the risen Christ."
                            )
                        ],
                        closingPrayer: "Heavenly Father, thank You for allowing me to walk through the story of Jesus' death, burial, and glorious resurrection. Thank You that Easter is not only an event in history but the foundation of my life today. Fill me with the power of Your Holy Spirit so I may live courageously, love generously, serve faithfully, and worship wholeheartedly. May the victory of the risen Christ shape every decision I make and every step I take. Until the day I see my Savior face to face, help me faithfully live as a witness of His resurrection. In Jesus' name, Amen."
                    )
                ]
            )
        } + [
            JourneyPlan(
                metadata: missionariesPlan,
                days: (1...16).map { missionaryPlaceholderDay($0) },
                introduction: JourneyIntroduction(
                    themeVerse: JourneyScripture(
                        reference: "Matthew 28:19–20",
                        text: "Go therefore and make disciples of all the nations, baptizing them in the name of the Father and the Son and the Holy Spirit, teaching them to observe all that I commanded you; and lo, I am with you always, even to the end of the age."
                    ),
                    paragraphs: [
                        "This journey is a focused invitation to pray for missionaries who carry the Gospel across cultures, languages, and borders.",
                        "Over these sixteen days, you will make space for Scripture, reflection, and guided prayer as you remember the people and places being served. Your prayers join the work of God around the world and encourage those who have been sent."
                    ],
                    estimatedDailyPrayerTime: "7–10 minutes",
                    difficulty: .gentle,
                    categoryTitle: "Missions",
                    experiences: [
                        JourneyExperience(title: "Read God's Word", description: "Meditate on carefully selected passages that guide each day's prayer."),
                        JourneyExperience(title: "Reflect on Scripture", description: "Discover biblical truths that deepen your faith and encourage your walk with Christ."),
                        JourneyExperience(title: "Pray with Purpose", description: "Follow thoughtful, Scripture-centered prayers that help you pray with confidence."),
                        JourneyExperience(title: "Pray for the Nations", description: "Learn about a different country or people group and lift them before God in prayer."),
                        JourneyExperience(title: "Gain a Global Perspective", description: "See the population and Christian presence of each mission field to better understand the need for the Gospel."),
                        JourneyExperience(title: "Support Missionaries", description: "Pray intentionally for the men and women faithfully sharing Christ around the world.")
                    ],
                    mission: JourneyMissionInformation(
                        countryOrPeopleGroup: "Shown with each future journey day",
                        approximatePopulation: "Shown with each future journey day",
                        approximateChristianPercentage: "Shown with each future journey day",
                        prayerFocus: "Pray for faithful Gospel witness, protection, provision, and fruit among the people being served."
                    ),
                    beforeYouBeginTitle: "Before You Begin",
                    beforeYouBeginContent: [
                        "Ask the Holy Spirit to prepare your heart as you begin this journey of prayer. Over the next sixteen days, you will walk through Scripture, intercede for missionaries faithfully proclaiming the Gospel, and pray for people around the world who have yet to hear the name of Jesus.",
                        "May these moments of prayer deepen your love for God's mission, strengthen your compassion for the nations, and remind you that every prayer offered in faith can have an eternal impact."
                    ]
                )
            )
        ]

    static func planByID(_ id: String) -> JourneyPlan? {
        allPlans.first(where: { $0.id == id })
    }
}
