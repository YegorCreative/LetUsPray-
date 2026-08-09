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
        coverIcon: "paperplane.fill",
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

    private static let missionaryDayOne = JourneyDay(
        dayNumber: 1,
        title: "Confidence in God's Word",
        chapterReference: "Acts 13:4–5",
        summary: "The Holy Spirit sent Barnabas and Saul to proclaim God's Word. We can pray with confidence that the Gospel is God's power to bring light and life to every people.",
        primaryScripture: JourneyScripture(
            reference: "Acts 13:4–5",
            text: "So, being sent out by the Holy Spirit, they went down to Seleucia and from there they sailed to Cyprus. When they reached Salamis, they began to proclaim the word of God in the synagogues of the Jews; and they also had John as their helper."
        ),
        devotional: "The first missionaries in Acts did not go because they had created a perfect plan. They went because the Holy Spirit sent them. Barnabas and Saul carried the word of God from one place to another, trusting that the Lord Himself would open hearts and establish His truth.\n\nTheir confidence was not in their eloquence, strength, or circumstances. It was in the God who speaks and acts through His Word. The Gospel they proclaimed was not merely helpful advice; it was the message of Jesus Christ, the power of God for salvation.\n\nToday, missionaries continue that calling across cultures and languages. As we pray for them, we can ask God to make His Word clear, give His servants courage, and prepare people to hear and believe. Our prayers join the Spirit's work as the good news of Christ reaches places where it has scarcely been heard.",
        reflections: [
            JourneyReflection(
                id: "pray-for-missionaries-1-reflection-1",
                scripture: JourneyScripture(
                    reference: "2 Timothy 3:16–17",
                    text: "All Scripture is inspired by God and profitable for teaching, for reproof, for correction, for training in righteousness; so that the man of God may be adequate, equipped for every good work."
                ),
                prayer: "Father, thank You for giving us Your trustworthy Word. Equip missionaries and me to live and serve faithfully through its truth, and help those they serve recognize Your voice."
            ),
            JourneyReflection(
                id: "pray-for-missionaries-1-reflection-2",
                scripture: JourneyScripture(
                    reference: "Romans 10:17",
                    text: "So faith comes from hearing, and hearing by the word of Christ."
                ),
                prayer: "Lord Jesus, make the message of Christ clear through every missionary who speaks. Prepare hearers to receive Your Word with faith and respond to Your saving grace."
            ),
            JourneyReflection(
                id: "pray-for-missionaries-1-reflection-3",
                scripture: JourneyScripture(
                    reference: "Psalm 119:105",
                    text: "Your word is a lamp to my feet And a light to my path."
                ),
                prayer: "Holy Spirit, guide missionaries through unfamiliar paths and protect them with the light of Scripture. Lead the people they serve from darkness into the hope of Christ."
            )
        ],
        closingPrayer: "Heavenly Father, thank You for sending Your Word and for calling servants to carry the Gospel to the nations. Give missionaries confidence in the truth of Scripture, courage to proclaim Jesus Christ, and wisdom to serve each community with love. Prepare hearts to hear, believe, and follow the Savior. Teach me to pray faithfully for those You have sent, trusting that Your Word will accomplish Your purposes. In Jesus' name, Amen.",
        missionFocus: JourneyMissionInformation(
            countryOrPeopleGroup: "Afghanistan",
            approximatePopulation: "Approximately 42 million people",
            approximateChristianPercentage: "Less than 1% Christian",
            prayerFocus: "Pray for courageous Christian workers, safe access to isolated communities, and open hearts to hear and believe the Word of God."
        )
    )

    private static let missionaryDayTwo = JourneyDay(
        dayNumber: 2,
        title: "Filled with God's Spirit",
        chapterReference: "Acts 13:6–9",
        summary: "Missionaries need the Holy Spirit's wisdom, discernment, and courage to proclaim Jesus Christ faithfully, especially when Gospel ministry meets resistance.",
        primaryScripture: JourneyScripture(
            reference: "Acts 13:6–9",
            text: "When they had gone through the whole island as far as Paphos, they found a magician, a Jewish false prophet whose name was Bar-Jesus, who was with the proconsul, Sergius Paulus, a man of intelligence. This man summoned Barnabas and Saul and sought to hear the word of God. But Elymas the magician (for so his name is translated) was opposing them, seeking to turn the proconsul away from the faith. But Saul, who was also known as Paul, filled with the Holy Spirit, fixed his gaze on him,"
        ),
        devotional: "Paul and Barnabas reached Paphos and found both an open door and determined opposition. Sergius Paulus wanted to hear the word of God, but Elymas tried to turn him away from the faith. In that difficult moment, Scripture does not first draw attention to Paul's education, force of personality, or experience. It tells us that Paul was filled with the Holy Spirit.\n\nBeing filled with the Spirit did not remove conflict or make Gospel ministry easy. It enabled Paul to face resistance with spiritual discernment and faithful courage. He needed wisdom to recognize what was happening, sensitivity to God's direction, and strength to speak truth without trusting in human influence alone. The Spirit's work kept the mission centered on God's truth rather than Paul's ability.\n\nMissionaries today also encounter situations that skill alone cannot navigate. They serve across cultures, answer difficult questions, discern between genuine interest and harmful opposition, and make decisions whose consequences may not be immediately clear. Their deepest need is not a more impressive personality but a living dependence on the Holy Spirit, who glorifies Christ and equips His people to bear witness to Him.\n\nAs we pray, let us ask God to fill missionaries with His Spirit so they can carry out the mission Jesus has given them. May He grant wisdom without pride, discernment without fear, and courage without harshness. Whether ministry brings welcome or resistance, may they remain faithful to Scripture, speak the Gospel clearly, and trust God's power to produce fruit according to His will.",
        reflections: [
            JourneyReflection(
                id: "pray-for-missionaries-2-reflection-1",
                scripture: JourneyScripture(
                    reference: "Zechariah 4:6",
                    text: "Then he said to me, 'This is the word of the LORD to Zerubbabel saying, “Not by might nor by power, but by My Spirit,” says the LORD of hosts.'"
                ),
                prayer: "Lord God, teach missionaries to depend on Your Spirit rather than human strength, talent, or influence. Supply what they lack and keep their service rooted in Your power and directed toward Jesus Christ."
            ),
            JourneyReflection(
                id: "pray-for-missionaries-2-reflection-2",
                scripture: JourneyScripture(
                    reference: "Colossians 1:9",
                    text: "For this reason also, since the day we heard of it, we have not ceased to pray for you and to ask that you may be filled with the knowledge of His will in all spiritual wisdom and understanding."
                ),
                prayer: "Father, fill missionaries with the knowledge of Your will. Give them spiritual wisdom and discernment for every conversation, decision, and challenge, and keep them faithful to the truth of Scripture."
            ),
            JourneyReflection(
                id: "pray-for-missionaries-2-reflection-3",
                scripture: JourneyScripture(
                    reference: "Acts 1:8",
                    text: "But you will receive power when the Holy Spirit has come upon you; and you shall be My witnesses both in Jerusalem, and in all Judea and Samaria, and even to the remotest part of the earth."
                ),
                prayer: "Holy Spirit, give missionaries courage and power to witness faithfully to Jesus. Open opportunities to share Christ, strengthen them when they face resistance, and bring Gospel fruit for God's glory."
            )
        ],
        closingPrayer: "Heavenly Father, fill missionaries with the Holy Spirit as they carry the Gospel of Jesus Christ into places of opportunity and resistance. Teach them to depend on Your power rather than their own personality, talent, influence, or strength. Give them wisdom for every decision, discernment in every challenge, courage to speak the truth faithfully, and sensitivity to follow Your direction. Strengthen them when opposition comes, keep them anchored in Scripture, and open doors for them to proclaim Christ with clarity and love. Produce Gospel fruit according to Your will, establish faithful local believers and churches, and receive all the glory through their service. In Jesus’ name, Amen.",
        missionFocus: JourneyMissionInformation(
            countryOrPeopleGroup: "Tunisia",
            approximatePopulation: "Approximately 12.3 million people",
            approximateChristianPercentage: "Approximately 0.5% Christian",
            prayerFocus: "Pray for missionaries and local believers to depend on the Holy Spirit for wisdom, discernment, and courage; to remain faithful to Scripture when facing resistance; and to receive opportunities to share Christ and see Gospel fruit according to God's will."
        )
    )

    private static let missionaryDayThree = JourneyDay(
        dayNumber: 3,
        title: "Victory in Spiritual Warfare",
        chapterReference: "Acts 13:10–12",
        summary: "Missionaries face real spiritual opposition, yet they can stand faithfully in God's strength, love the people they serve, and trust the authority of Jesus Christ.",
        primaryScripture: JourneyScripture(
            reference: "Acts 13:10–12",
            text: "And said, \"You who are full of all deceit and fraud, you son of the devil, you enemy of all righteousness, will you not cease to make crooked the straight ways of the Lord? Now, behold, the hand of the Lord is upon you, and you will be blind and not see the sun for a time.\" And immediately a mist and a darkness fell upon him, and he went about seeking those who would lead him by the hand. Then the proconsul believed when he saw what had happened, being amazed at the teaching of the Lord."
        ),
        devotional: "Elymas actively tried to turn the proconsul away from the faith, and Paul confronted his deception with Spirit-given courage. This was a serious moment of opposition, but it does not give Christians permission to treat people as enemies or speak harshly whenever someone disagrees. Paul's specific rebuke exposed a deliberate effort to distort God's truth, while the larger witness of Scripture reminds us that our struggle is not against flesh and blood.\n\nMissionaries may encounter resistance, discouragement, confusion, or deception as they share Jesus Christ. Spiritual warfare is not a reason for fear or sensationalism. It is a call to remain prayerful, discerning, and grounded in Scripture. The people missionaries serve are people to love—neighbors made in God's image who need the truth and grace of Christ. The opposition is spiritual, and it cannot be overcome through anger, manipulation, or human strength.\n\nVictory is found in Jesus. Christ has authority over every power, has overcome the world through His death and resurrection, and remains faithful when ministry is costly. This does not mean missionaries will avoid rejection, suffering, or setbacks. It means those hardships do not have the final word. God's servants can stand firm in His strength, speak biblical truth with humility, and keep loving people even when the Gospel is resisted.\n\nAs we pray today, let us ask God to protect missionaries from fear, deception, and discouragement. May He give them wisdom to recognize spiritual opposition without becoming suspicious of people, courage to proclaim Christ without hostility, and perseverance when progress seems blocked. The Gospel cannot ultimately be defeated, and Jesus is able to sustain His witnesses through every difficulty.",
        reflections: [
            JourneyReflection(
                id: "pray-for-missionaries-3-reflection-1",
                scripture: JourneyScripture(
                    reference: "Ephesians 6:12",
                    text: "For our struggle is not against flesh and blood, but against the rulers, against the powers, against the world forces of this darkness, against the spiritual forces of wickedness in the heavenly places."
                ),
                prayer: "Father, help missionaries recognize the spiritual nature of opposition while seeing every person with compassion. Guard them from hostility and suspicion, and enable them to share Christ's truth with humility, patience, and love."
            ),
            JourneyReflection(
                id: "pray-for-missionaries-3-reflection-2",
                scripture: JourneyScripture(
                    reference: "Ephesians 6:10–11",
                    text: "Finally, be strong in the Lord and in the strength of His might. Put on the full armor of God, so that you will be able to stand firm against the schemes of the devil."
                ),
                prayer: "Lord, strengthen missionaries with Your mighty power. Keep them grounded in Scripture, give them wisdom and discernment, protect their unity, and help them stand firm when ministry becomes spiritually difficult."
            ),
            JourneyReflection(
                id: "pray-for-missionaries-3-reflection-3",
                scripture: JourneyScripture(
                    reference: "John 16:33",
                    text: "These things I have spoken to you, so that in Me you may have peace. In the world you have tribulation, but take courage; I have overcome the world."
                ),
                prayer: "Lord Jesus, give missionaries peace and courage when they face opposition, suffering, fear, or discouragement. Fix their confidence on Your victory and help them persevere in sharing the Gospel with faithfulness and love."
            )
        ],
        closingPrayer: "Heavenly Father, thank You that Jesus Christ has all authority and has overcome the world. Strengthen missionaries who face spiritual opposition, discouragement, deception, rejection, or suffering. Give them discernment without suspicion, courage without harshness, and perseverance rooted in Your faithfulness. Protect their hearts and minds, preserve their unity, and keep them grounded in Scripture and prayer. Help them see the people they serve with compassion and continue proclaiming Christ with truth, humility, and love. Open opportunities for Gospel witness, and let those who hear encounter the truth and grace of Jesus. When ministry is difficult, enable Your servants to stand firm in Your strength and remain confident in Christ's sovereign care. In Jesus’ name, Amen.",
        missionFocus: JourneyMissionInformation(
            countryOrPeopleGroup: "Maldives",
            approximatePopulation: "Approximately 530,000 people",
            approximateChristianPercentage: "Less than 0.1% Christian",
            prayerFocus: "Pray for missionaries and local believers to receive spiritual strength, protection from discouragement, discernment, courage, wisdom, perseverance, and unity. Ask God for opportunities to share Christ faithfully and lovingly, and for those who hear to encounter the truth and grace of Jesus."
        )
    )

    private static let missionaryDayFour = JourneyDay(
        dayNumber: 4,
        title: "Success in Gospel Witness",
        chapterReference: "Acts 13:12",
        summary: "Missionaries faithfully proclaim Jesus Christ, but only God can open hearts. We pray for clear Gospel witness, receptive hearers, and lasting fruit that brings glory to Christ.",
        primaryScripture: JourneyScripture(
            reference: "Acts 13:12",
            text: "Then the proconsul believed when he saw what had happened, being amazed at the teaching of the Lord."
        ),
        devotional: "The proconsul in Acts 13 encountered both the truth of God's Word and the unmistakable evidence of God's power. What amazed him was not merely the personality or skill of Paul and Barnabas, but the teaching of the Lord. Through their faithful witness, his attention was directed to the truth about Jesus Christ, and he believed.\n\nThis moment reminds us what true success in Gospel witness looks like. Missionaries are called to communicate the good news clearly, lovingly, and faithfully, pointing people away from themselves and toward Christ. Careful preparation and wise communication matter, but persuasive ability alone cannot produce faith. God works through His Word and by His Spirit to open hearts and bring people to repentance and trust in Jesus.\n\nSometimes missionaries see an immediate response, as Paul and Barnabas did in this account. At other times, they sow and water for years before visible fruit appears. Neither quick results nor long waiting determines whether their service is faithful. Their calling is to proclaim Christ, love the people before them, and trust God with the outcome.\n\nAs we pray today, let us ask the Lord to give missionaries clarity, courage, and deep dependence on Him. May people encounter biblical truth, recognize the beauty and authority of Jesus, and become lasting disciples who grow within faithful local churches. And when results seem slow, may God's servants remain steady, knowing that He alone gives the growth.",
        reflections: [
            JourneyReflection(
                id: "pray-for-missionaries-4-reflection-1",
                scripture: JourneyScripture(
                    reference: "2 Corinthians 4:5",
                    text: "For we do not preach ourselves but Christ Jesus as Lord, and ourselves as your bond-servants for Jesus' sake."
                ),
                prayer: "Lord Jesus, keep missionaries from drawing attention to themselves. Give them humility and clarity to proclaim You as Lord so that every Gospel conversation faithfully points people to Your saving grace."
            ),
            JourneyReflection(
                id: "pray-for-missionaries-4-reflection-2",
                scripture: JourneyScripture(
                    reference: "Acts 16:14",
                    text: "A woman named Lydia, from the city of Thyatira, a seller of purple fabrics, a worshiper of God, was listening; and the Lord opened her heart to respond to the things spoken by Paul."
                ),
                prayer: "Father, open hearts as missionaries share Your Word. Arrange meaningful conversations, help hearers understand biblical truth, and draw them to genuine faith and lasting obedience to Christ."
            ),
            JourneyReflection(
                id: "pray-for-missionaries-4-reflection-3",
                scripture: JourneyScripture(
                    reference: "Romans 1:16",
                    text: "For I am not ashamed of the gospel, for it is the power of God for salvation to everyone who believes, to the Jew first and also to the Greek."
                ),
                prayer: "Holy Spirit, give missionaries courage and confidence in the power of the Gospel. Sustain them when fruit seems slow, and use their faithful witness to bring people to salvation in Jesus Christ."
            )
        ],
        closingPrayer: "Heavenly Father, thank You for the Gospel, Your power for salvation to everyone who believes. Strengthen missionaries to proclaim Jesus Christ faithfully, with clarity, courage, humility, and love. Open doors for Gospel conversations and open hearts to receive the truth of Your Word. Keep Your servants dependent on the Holy Spirit rather than on persuasive ability alone, and sustain them when visible results come slowly. Establish local believers and churches, and produce lasting disciples whose lives bear fruit for Your kingdom. May every response and every faithful act of witness bring glory to Jesus Christ. In Jesus’ name, Amen.",
        missionFocus: JourneyMissionInformation(
            countryOrPeopleGroup: "Japan",
            approximatePopulation: "Approximately 123 million people",
            approximateChristianPercentage: "Approximately 1–2% Christian",
            prayerFocus: "Pray for missionaries to share Christ clearly, for open hearts and natural opportunities for Gospel conversations, and for local believers and churches to nurture lasting disciples rather than superficial responses."
        )
    )

    private static let missionaryDayFive = JourneyDay(
        dayNumber: 5,
        title: "Peace with Other Believers",
        chapterReference: "Acts 13:13",
        summary: "Missionaries need Christ-centered relationships marked by humility, patience, forgiveness, and grace as they serve alongside other believers for the sake of the Gospel.",
        primaryScripture: JourneyScripture(
            reference: "Acts 13:13",
            text: "Now Paul and his companions put out to sea from Paphos and came to Perga in Pamphylia; but John left them and returned to Jerusalem."
        ),
        devotional: "Acts 13:13 does not directly teach about reconciliation. It records that John left Paul and his companions and returned to Jerusalem. Later, when Barnabas wanted to take John Mark on another journey, Paul strongly disagreed because John had withdrawn from the earlier work. That event became part of a serious conflict between two faithful believers who had served the Gospel together.\n\nMissionaries do not serve alone. They work with teammates, families, local believers, pastors, churches, and ministry partners from different cultures and backgrounds. Even people who sincerely love Jesus can misunderstand one another, feel disappointed, disagree about ministry decisions, or cause hurt. Christian unity is not the absence of every conflict; it is a shared commitment to honor Christ in the way conflict is handled.\n\nBiblical peace does not require believers to pretend that problems are harmless or that every partnership must continue in exactly the same form. Honest conversations, repentance, forgiveness, wise boundaries, and even different ministry decisions may sometimes be necessary. Yet personal pride, bitterness, and contempt must not be allowed to rule. Because Christ has reconciled His people to God through the cross, He calls them to extend humility, patience, truth, and grace to one another.\n\nAs we pray today, let us ask God to protect Gospel partnerships and heal relationships when conflict occurs. May missionaries listen carefully across cultural differences, speak truth with love, forgive as they have been forgiven, and keep Christ's mission above personal ambition. Healthy unity among believers does not mean agreement on every secondary matter, but it can show the world the transforming love of Jesus and strengthen a faithful Gospel witness.",
        reflections: [
            JourneyReflection(
                id: "pray-for-missionaries-5-reflection-1",
                scripture: JourneyScripture(
                    reference: "John 17:20–23",
                    text: "I do not ask on behalf of these alone, but for those also who believe in Me through their word; that they may all be one; even as You, Father, are in Me and I in You, that they also may be in Us, so that the world may believe that You sent Me. The glory which You have given Me I have given to them, that they may be one, just as We are one; I in them and You in Me, that they may be perfected in unity, so that the world may know that You sent Me, and loved them, even as You have loved Me."
                ),
                prayer: "Father, answer Jesus' prayer for unity among missionaries, local believers, and churches serving together. Center their relationships on Christ, deepen their love for one another, and let their unity strengthen the world's witness to the Gospel."
            ),
            JourneyReflection(
                id: "pray-for-missionaries-5-reflection-2",
                scripture: JourneyScripture(
                    reference: "Ephesians 4:1–3",
                    text: "Therefore I, the prisoner of the Lord, implore you to walk in a manner worthy of the calling with which you have been called, with all humility and gentleness, with patience, showing tolerance for one another in love, being diligent to preserve the unity of the Spirit in the bond of peace."
                ),
                prayer: "Lord, give missionaries humility, gentleness, and patience in their everyday relationships. Grant wisdom across personality and cultural differences, and help ministry teams diligently preserve the unity of the Spirit in the bond of peace."
            ),
            JourneyReflection(
                id: "pray-for-missionaries-5-reflection-3",
                scripture: JourneyScripture(
                    reference: "Colossians 3:12–15",
                    text: "So, as those who have been chosen of God, holy and beloved, put on a heart of compassion, kindness, humility, gentleness and patience; bearing with one another, and forgiving each other, whoever has a complaint against anyone; just as the Lord forgave you, so also should you. Beyond all these things put on love, which is the perfect bond of unity. Let the peace of Christ rule in your hearts, to which indeed you were called in one body; and be thankful."
                ),
                prayer: "Lord Jesus, rule with Your peace when missionaries and fellow believers experience disappointment or conflict. Free them from bitterness, lead them toward repentance, forgiveness, and reconciliation, and bind them together in Christ-centered love."
            )
        ],
        closingPrayer: "Heavenly Father, thank You for reconciling Your people to Yourself through Jesus Christ and calling believers to live in peace with one another. Strengthen missionaries, their families, teammates, local believers, pastors, churches, and ministry partners with Christ-centered love. Give them humility, patience, gentleness, and wisdom in difficult conversations. When disagreements occur even among faithful believers, grant grace to listen honestly, repent where needed, forgive freely, establish wise boundaries, and pursue reconciliation in ways that honor Jesus. Protect missionary teams and Gospel partnerships from pride, division, and bitterness. Help believers navigate cultural and ministry differences without demanding agreement on every secondary issue. May healthy local churches and strong relationships display the transforming love of Christ and support a faithful Gospel witness to the world. In Jesus’ name, Amen.",
        missionFocus: JourneyMissionInformation(
            countryOrPeopleGroup: "Cambodia",
            approximatePopulation: "Approximately 17.8 million people",
            approximateChristianPercentage: "Approximately 3% Christian",
            prayerFocus: "Pray for unity among missionaries and local believers, healthy churches, humility and patience across cultural differences, forgiveness and reconciliation when conflict occurs, protection from bitterness, and strong Christ-centered partnerships that strengthen faithful Gospel witness."
        )
    )

    private static let missionaryDaySix = JourneyDay(
        dayNumber: 6,
        title: "Favor with Unbelievers",
        chapterReference: "Acts 13:14–15",
        summary: "God can give missionaries relational openness and opportunities to speak about Christ as they live with integrity, love people genuinely, and remain faithful to the Gospel.",
        primaryScripture: JourneyScripture(
            reference: "Acts 13:14–15",
            text: "But going on from Perga, they arrived at Pisidian Antioch, and on the Sabbath day they went into the synagogue and sat down. After the reading of the Law and the Prophets the synagogue officials sent to them, saying, \"Brethren, if you have any word of exhortation for the people, say it.\""
        ),
        devotional: "Acts 13:14–15 records an open opportunity, not a promise of universal acceptance. When Paul and Barnabas entered the synagogue at Pisidian Antioch, the officials invited them to offer a word of exhortation. God used that invitation to give Paul an opportunity to proclaim His message. Yet the wider story of Acts includes both receptive listeners and serious opposition. Faithful missionaries are not guaranteed popularity, approval, influence, or freedom from rejection.\n\nMissionaries often live and work among neighbors, coworkers, teachers, officials, families, and community leaders who do not share their faith. God may open doors through ordinary conversations, hospitality, patient friendship, or a reputation for honest and compassionate living. Integrity, humility, kindness, and respect can build genuine trust and give credibility to a missionary's words, but these qualities must never become a strategy for manipulating people. Every person bears God's image and deserves sincere love and dignity, whether or not that person ever embraces the Gospel.\n\nBiblical favor is not worldly popularity, political influence, social status, or success gained by compromise. Missionaries must not soften or reshape the Gospel to win approval. Instead, we pray that God would create relational openness according to His purposes and give His servants wisdom to recognize it. Their speech should be gracious, their conduct Christlike, and their courage rooted in Jesus when an opportunity comes to explain the hope of salvation in Him. Faithful conduct supports Gospel proclamation; it does not replace it.\n\nAs we pray today, let us ask God to help missionaries love people genuinely and represent Christ well. May He give them meaningful relationships, cultural sensitivity, receptive conversations, and courage to speak clearly about Jesus. Whether people respond with curiosity, indifference, disagreement, or rejection, may missionaries remain gracious and faithful, trusting God with the results and seeking the glory of Christ rather than their own acceptance.",
        reflections: [
            JourneyReflection(
                id: "pray-for-missionaries-6-reflection-1",
                scripture: JourneyScripture(
                    reference: "Colossians 4:2–4",
                    text: "Devote yourselves to prayer, keeping alert in it with an attitude of thanksgiving; praying at the same time for us as well, that God will open up to us a door for the word, so that we may speak forth the mystery of Christ, for which I have also been imprisoned; that I may make it clear in the way I ought to speak."
                ),
                prayer: "Father, open doors for missionaries to speak about Jesus and help them recognize the opportunities You provide. Give them courage and clarity to proclaim the mystery of Christ faithfully, and prepare hearts to hear Your Word."
            ),
            JourneyReflection(
                id: "pray-for-missionaries-6-reflection-2",
                scripture: JourneyScripture(
                    reference: "Colossians 4:5–6",
                    text: "Conduct yourselves with wisdom toward outsiders, making the most of the opportunity. Let your speech always be with grace, as though seasoned with salt, so that you will know how you should respond to each person."
                ),
                prayer: "Lord, help missionaries walk wisely and speak graciously with those who do not share their faith. Give them respect, discernment, cultural sensitivity, and genuine love so that every conversation represents Christ with both truth and grace."
            ),
            JourneyReflection(
                id: "pray-for-missionaries-6-reflection-3",
                scripture: JourneyScripture(
                    reference: "1 Peter 2:12",
                    text: "Keep your behavior excellent among the Gentiles, so that in the thing in which they slander you as evildoers, they may because of your good deeds, as they observe them, glorify God in the day of visitation."
                ),
                prayer: "God, form integrity, kindness, and Christlike character in missionaries as they live among the people they serve. Build trustworthy relationships through their conduct, and give them courage to support that witness by clearly proclaiming Jesus Christ."
            )
        ],
        closingPrayer: "Heavenly Father, we ask You to give missionaries favor according to Your purposes and keep them faithful regardless of how people respond. Open doors for meaningful relationships and Gospel conversations. Help missionaries love unbelievers genuinely, honoring the dignity of every person rather than treating relationships merely as ministry opportunities. Give them wisdom, cultural sensitivity, integrity, kindness, and gracious speech. Make them courageous when opportunities arise to explain the hope found in Jesus Christ, and help them proclaim Him clearly without compromise. Prepare receptive hearts, strengthen faithful local believers, and let the lives and words of Your servants represent Christ well. When they meet curiosity, indifference, disagreement, or rejection, sustain them in humility and love. May Jesus be known and glorified through their faithful witness. In Jesus’ name, Amen.",
        missionFocus: JourneyMissionInformation(
            countryOrPeopleGroup: "Morocco",
            approximatePopulation: "Approximately 38.4 million people",
            approximateChristianPercentage: "Approximately 0.2% Christian",
            prayerFocus: "Pray for missionaries and local believers to build genuine, trustworthy relationships marked by integrity, kindness, and cultural sensitivity. Ask God for open doors, gracious conversations, receptive hearts, and courage to speak clearly about Jesus while loving every person sincerely."
        )
    )

    private static let missionaryDaySeven = JourneyDay(
        dayNumber: 7,
        title: "The Gospel Will Be Clear Through Them",
        chapterReference: "Acts 13:16–47",
        summary: "Missionaries are called to make Jesus Christ and His Gospel known with faithfulness to God's Word, clarity for their listeners, and dependence on the Holy Spirit.",
        primaryScripture: JourneyScripture(
            reference: "Acts 13:16–47",
            text: """
            Paul stood up, and motioning with his hand said, "Men of Israel, and you who fear God, listen: The God of this people Israel chose our fathers and made the people great during their stay in the land of Egypt, and with an uplifted arm He led them out from it. For a period of about forty years He put up with them in the wilderness. When He had destroyed seven nations in the land of Canaan, He distributed their land as an inheritance—all of which took about four hundred and fifty years. After these things He gave them judges until Samuel the prophet. Then they asked for a king, and God gave them Saul the son of Kish, a man of the tribe of Benjamin, for forty years. After He had removed him, He raised up David to be their king, concerning whom He also testified and said, 'I have found David the son of Jesse, a man after My heart, who will do all My will.' From the descendants of this man, according to promise, God has brought to Israel a Savior, Jesus, after John had proclaimed before His coming a baptism of repentance to all the people of Israel. And while John was completing his course, he kept saying, 'What do you suppose that I am? I am not He. But behold, one is coming after me the sandals of whose feet I am not worthy to untie.'

            Brethren, sons of Abraham's family, and those among you who fear God, to us the message of this salvation has been sent. For those who live in Jerusalem, and their rulers, recognizing neither Him nor the utterances of the prophets which are read every Sabbath, fulfilled these by condemning Him. And though they found no ground for putting Him to death, they asked Pilate that He be executed. When they had carried out all that was written concerning Him, they took Him down from the cross and laid Him in a tomb. But God raised Him from the dead; and for many days He appeared to those who came up with Him from Galilee to Jerusalem, the very ones who are now His witnesses to the people. And we preach to you the good news of the promise made to the fathers, that God has fulfilled this promise to our children in that He raised up Jesus, as it is also written in the second Psalm, 'You are My Son; today I have begotten You.' As for the fact that He raised Him up from the dead, no longer to return to decay, He has spoken in this way: 'I will give you the holy and sure blessings of David.' Therefore He also says in another Psalm, 'You will not allow Your Holy One to undergo decay.' For David, after he had served the purpose of God in his own generation, fell asleep, and was laid among his fathers and underwent decay; but He whom God raised did not undergo decay.

            Therefore let it be known to you, brethren, that through Him forgiveness of sins is proclaimed to you, and through Him everyone who believes is freed from all things, from which you could not be freed through the Law of Moses. Therefore take heed, so that the thing spoken of in the Prophets may not come upon you: 'Behold, you scoffers, and marvel, and perish; for I am accomplishing a work in your days, a work which you will never believe, though someone should describe it to you.'

            As Paul and Barnabas were going out, the people kept begging that these things might be spoken to them the next Sabbath. Now when the meeting of the synagogue had broken up, many of the Jews and of the God-fearing proselytes followed Paul and Barnabas, who, speaking to them, were urging them to continue in the grace of God. The next Sabbath nearly the whole city assembled to hear the word of the Lord. But when the Jews saw the crowds, they were filled with jealousy and began contradicting the things spoken by Paul, and were blaspheming. Paul and Barnabas spoke out boldly and said, "It was necessary that the word of God be spoken to you first; since you repudiate it and judge yourselves unworthy of eternal life, behold, we are turning to the Gentiles. For so the Lord has commanded us, 'I have placed You as a light for the Gentiles, that You may bring salvation to the end of the earth.'"
            """
        ),
        devotional: """
        Paul's message in Acts 13 traces God's faithful work through Israel's history and brings everything to its center: Jesus Christ. Paul explains that Jesus is God's promised Savior, that He was rejected and crucified, that God raised Him from the dead, and that forgiveness and freedom from sin are proclaimed through Him. He does not promote himself, an organization, a culture, or a vague spirituality. He makes the Gospel clear and calls his listeners to receive God's message.

        Missionaries communicate across languages, cultures, generations, educational backgrounds, and religious traditions. They must learn how people think, what words communicate accurately, and which assumptions may create confusion. Adapting the way the Gospel is explained is not the same as changing what the Gospel means. Faithful missionaries work to make biblical truth understandable while preserving its essential message: God is holy and faithful; humanity is sinful and needs reconciliation; Jesus is God's promised Savior; He died for sins and rose from the dead; forgiveness is found in Him; and people are called to repent and believe, receiving salvation by God's grace rather than human achievement.

        Clarity does not come primarily from eloquence, charisma, marketing, or emotional pressure. Missionaries need careful study of Scripture, cultural and linguistic wisdom, courage to speak difficult truths, and dependence on the Holy Spirit. They must not hide sin, the cross, repentance, or Christ's exclusive saving work in order to gain acceptance. At the same time, faithfulness does not excuse confusing language, cultural pride, careless answers, or needless offense. The message must remain unchanged, but it should be communicated with humility, patience, and genuine concern for the listener.

        As we pray today, let us ask God to keep Jesus at the center of every missionary's witness. May missionaries know His Word deeply, explain Christ's death and resurrection clearly, answer questions graciously, and help listeners understand more than unfamiliar Christian terminology. Whether the Gospel is welcomed or rejected, may they faithfully proclaim Christ and trust God to work in people's hearts, establish genuine faith, and form lasting disciples for His glory.
        """,
        reflections: [
            JourneyReflection(
                id: "pray-for-missionaries-7-reflection-1",
                scripture: JourneyScripture(
                    reference: "1 Corinthians 2:1–5",
                    text: "And when I came to you, brethren, I did not come with superiority of speech or of wisdom, proclaiming to you the testimony of God. For I determined to know nothing among you except Jesus Christ, and Him crucified. I was with you in weakness and in fear and in much trembling, and my message and my preaching were not in persuasive words of wisdom, but in demonstration of the Spirit and of power, so that your faith would not rest on the wisdom of men, but on the power of God."
                ),
                prayer: "Father, keep Jesus Christ and Him crucified at the center of every missionary's witness. Guard Your servants from drawing attention to themselves or trusting charisma and persuasive ability, and let people's faith rest on Your power."
            ),
            JourneyReflection(
                id: "pray-for-missionaries-7-reflection-2",
                scripture: JourneyScripture(
                    reference: "2 Timothy 2:15",
                    text: "Be diligent to present yourself approved to God as a workman who does not need to be ashamed, accurately handling the word of truth."
                ),
                prayer: "Lord, help missionaries study Scripture carefully and handle the word of truth accurately. Give them disciplined preparation, sound understanding, and wisdom to explain biblical truth clearly and responsibly in every language and culture."
            ),
            JourneyReflection(
                id: "pray-for-missionaries-7-reflection-3",
                scripture: JourneyScripture(
                    reference: "1 Peter 3:15–16",
                    text: "But sanctify Christ as Lord in your hearts, always being ready to make a defense to everyone who asks you to give an account for the hope that is in you, yet with gentleness and reverence; and keep a good conscience so that in the thing in which you are slandered, those who revile your good behavior in Christ will be put to shame."
                ),
                prayer: "Lord Jesus, prepare missionaries to explain their hope in You with clarity, gentleness, and respect. Give them humility and wisdom when answering questions, courage when truth is unpopular, and faithfulness when the Gospel is rejected."
            )
        ],
        closingPrayer: "Heavenly Father, strengthen missionaries to proclaim Your Gospel faithfully and clearly. Keep Jesus Christ—His death for sins, His resurrection, and the forgiveness found in Him—at the center of their message. Help Your servants know Scripture deeply and handle Your Word accurately. Give them wisdom to understand the people they serve, diligence in learning languages, and discernment to communicate across cultural differences without changing biblical truth. Make their speech gracious, their answers clear, and their hearts humble. Give them courage when the Gospel is unpopular and dependence on the Holy Spirit rather than eloquence or human persuasion. Open listeners' understanding so they grasp the truth of sin, grace, repentance, faith, and salvation in Christ rather than merely hearing Christian words. Form those who respond into lasting disciples, and help missionaries trust You with every response. May their lives and proclamation bring glory to Jesus Christ. In Jesus’ name, Amen.",
        missionFocus: JourneyMissionInformation(
            countryOrPeopleGroup: "Tajikistan",
            approximatePopulation: "Approximately 10.8 million people",
            approximateChristianPercentage: "Approximately 0.4% Christian",
            prayerFocus: "Pray for missionaries and local believers to understand the people they serve, learn languages faithfully, and explain Scripture with clarity and cultural wisdom. Ask the Holy Spirit to help listeners understand Christ's death and resurrection, forgiveness, and salvation rather than merely hearing unfamiliar Christian terms, and to establish those who believe as lasting disciples."
        )
    )

    private static let missionaryDayEight = JourneyDay(
        dayNumber: 8,
        title: "God Will Open Hearts Around Them",
        chapterReference: "Acts 13:48",
        summary: "Missionaries faithfully proclaim Jesus Christ, but only God can open hearts, give spiritual understanding, and produce lasting Gospel fruit in His timing.",
        primaryScripture: JourneyScripture(
            reference: "Acts 13:48",
            text: "When the Gentiles heard this, they began rejoicing and glorifying the word of the Lord; and as many as had been appointed to eternal life believed."
        ),
        devotional: """
        Acts 13:48 follows Paul's clear proclamation of Jesus Christ in Pisidian Antioch. The Gentiles heard that God's salvation extended to the nations, rejoiced in the word of the Lord, and believed. The passage keeps a beautiful biblical order before us: Christ was faithfully proclaimed, people genuinely heard and responded, and God's saving work was active. The missionary served as God's messenger, but God remained the source of salvation.

        Missionaries can learn languages, study cultures, build relationships, answer questions, serve communities, and explain Scripture carefully. These are important acts of faithful ministry, but none of them can manufacture genuine faith. Missionaries do not save people, and emotional pressure or persuasive technique cannot transform a heart. Only God can bring spiritual understanding, convict people of sin, draw them to Christ, and produce repentance and faith.

        This truth gives missionaries both humility and confidence. Humility keeps them from treating people as results to produce or measuring their worth by conversion numbers. A season with little visible fruit does not necessarily mean that a missionary has failed. Some servants plant and others water, often without seeing what God is doing beneath the surface. Confidence reminds them that they are not carrying out Christ's mission alone. God can prepare hearts, remove confusion, make the truth of Jesus understood, and cause Gospel seed to bear fruit in His appointed time.

        As we pray today, we need not enter a denominational debate about every theological question raised by Acts 13:48. We can remain close to its clear hope: the Gospel was proclaimed, people heard and rejoiced, people believed, and God was at work. Let us pray that missionaries continue sowing His Word without manipulation or discouragement. May people truly understand their need for Christ, repent and believe in Him, and grow as faithful disciples within healthy local churches, all for God's glory.
        """,
        reflections: [
            JourneyReflection(
                id: "pray-for-missionaries-8-reflection-1",
                scripture: JourneyScripture(
                    reference: "2 Corinthians 4:6",
                    text: "For God, who said, \"Light shall shine out of darkness,\" is the One who has shone in our hearts to give the Light of the knowledge of the glory of God in the face of Christ."
                ),
                prayer: "Father, shine the light of the knowledge of Your glory into the hearts of people hearing the Gospel through missionaries. Help them understand who Jesus is, recognize their need for Him, and respond in genuine repentance and faith."
            ),
            JourneyReflection(
                id: "pray-for-missionaries-8-reflection-2",
                scripture: JourneyScripture(
                    reference: "1 Corinthians 3:6–7",
                    text: "I planted, Apollos watered, but God was causing the growth. So then neither the one who plants nor the one who waters is anything, but God who causes the growth."
                ),
                prayer: "God, give missionaries humility and perseverance as they plant and water Gospel seed. Free them from measuring their worth by immediate results, keep them from manipulation, and help them trust You alone to produce spiritual growth in Your timing."
            ),
            JourneyReflection(
                id: "pray-for-missionaries-8-reflection-3",
                scripture: JourneyScripture(
                    reference: "Isaiah 55:10–11",
                    text: "For as the rain and the snow come down from heaven, and do not return there without watering the earth and making it bear and sprout, and furnishing seed to the sower and bread to the eater; so will My word be which goes forth from My mouth; it will not return to Me empty, without accomplishing what I desire, and without succeeding in the matter for which I sent it."
                ),
                prayer: "Lord, strengthen missionaries and local believers to keep teaching and proclaiming Your Word faithfully when fruit is not yet visible. Accomplish Your purposes through Scripture, bring lasting disciples to maturity, and establish healthy churches centered on Christ."
            )
        ],
        closingPrayer: "Heavenly Father, prepare hearts to hear and understand the Gospel proclaimed by missionaries. Give people genuine opportunities to encounter Scripture, remove spiritual confusion, and reveal the truth and glory of Jesus Christ. Through Your Word, show them their need for reconciliation, produce repentance and faith, and draw them into faithful discipleship. Give missionaries grace to proclaim Christ clearly while depending on Your power rather than persuasion or manipulation. When visible results are slow, protect them from discouragement and help them continue planting and watering with patience, humility, and hope. Strengthen local believers to participate faithfully in Gospel witness. Cause lasting spiritual fruit to grow, establish healthy local churches, and raise up disciples who follow Jesus with enduring faith. May Your saving work bring glory to Christ among the nations. In Jesus’ name, Amen.",
        missionFocus: JourneyMissionInformation(
            countryOrPeopleGroup: "Maldives",
            approximatePopulation: "Approximately 530,000 people",
            approximateChristianPercentage: "Estimated at less than 0.1% Christian",
            prayerFocus: "Pray that God would prepare hearts in the Maldives to encounter and understand Scripture, reveal the truth of Jesus Christ, and produce genuine repentance, faith, and lasting discipleship. Ask Him to give missionaries and local believers meaningful Gospel conversations, patience when fruit is slow, and grace to establish healthy Christ-centered churches without manipulation or discouragement."
        )
    )

    private static let missionaryDayNine = JourneyDay(
        dayNumber: 9,
        title: "Joy in the Midst of Suffering",
        chapterReference: "Acts 14:1–2",
        summary: "Missionaries need joy rooted in Jesus Christ—a deep hope that can coexist with honest sorrow and sustain faithful witness through hardship.",
        primaryScripture: JourneyScripture(
            reference: "Acts 14:1–2",
            text: "In Iconium they entered the synagogue of the Jews together, and spoke in such a manner that a large number of people believed, both of Jews and of Greeks. But the Jews who disbelieved stirred up the minds of the Gentiles and embittered them against the brethren."
        ),
        devotional: """
        Acts 14:1–2 does not explicitly say that Paul and Barnabas felt joyful. It shows that Gospel fruit and opposition existed side by side: many Jews and Greeks believed, while others stirred up hostility against the believers. The rest of Acts 14 records increasing resistance and suffering. This setting helps us pray in light of the broader New Testament truth that deep joy in Christ can remain present even when ministry is painful and costly.

        Missionary hardship is real. Rejection, loneliness, separation from family, cultural isolation, financial uncertainty, ministry disappointment, hostility, physical difficulty, and grief can weigh heavily on those who serve. Suffering itself is not good, and it should never be romanticized. Christian joy does not require missionaries to pretend pain does not hurt, hide trauma, or appear cheerful at every moment. Sadness is not proof of weak faith, and wise rest, lament, counseling, practical care, community support, and appropriate safety measures can all be faithful responses to hardship.

        Joy in Christ is deeper than favorable circumstances. It grows from knowing Jesus, receiving His salvation, trusting His promises, and remembering that suffering will not have the final word. Through the Holy Spirit, sorrow and joy can coexist. Missionaries may grieve honestly while still possessing an enduring hope in God's presence and the resurrection life secured by Christ. They can rejoice when people believe the Gospel even while acknowledging the personal cost of ministry and asking God to relieve suffering.

        As we pray today, let us not merely tell missionaries to be happy or remain in preventable danger. Let us ask God to protect them, provide practical help, surround them with compassionate believers, and give them freedom to rest and grieve. When difficult circumstances continue, may Jesus sustain them with comfort, courage, and hope. May they remain rooted in His love, continue serving according to His calling, and see Gospel fruit according to His wise will.
        """,
        reflections: [
            JourneyReflection(
                id: "pray-for-missionaries-9-reflection-1",
                scripture: JourneyScripture(
                    reference: "Philippians 4:4",
                    text: "Rejoice in the Lord always; again I will say, rejoice!"
                ),
                prayer: "Lord Jesus, be the deepest joy of missionaries when circumstances are painful or uncertain. Keep them close to You, remind them of Your salvation and promises, and sustain a joy rooted in You rather than pressure to deny their suffering."
            ),
            JourneyReflection(
                id: "pray-for-missionaries-9-reflection-2",
                scripture: JourneyScripture(
                    reference: "2 Corinthians 6:10",
                    text: "As sorrowful yet always rejoicing, as poor yet making many rich, as having nothing yet possessing all things."
                ),
                prayer: "Compassionate Father, give missionaries freedom to grieve honestly without losing hope in Christ. Meet them in sorrow, provide wise and caring support, and surround them with believers who listen, encourage, and help carry their burdens."
            ),
            JourneyReflection(
                id: "pray-for-missionaries-9-reflection-3",
                scripture: JourneyScripture(
                    reference: "Romans 5:3–5",
                    text: "And not only this, but we also exult in our tribulations, knowing that tribulation brings about perseverance; and perseverance, proven character; and proven character, hope; and hope does not disappoint, because the love of God has been poured out within our hearts through the Holy Spirit who was given to us."
                ),
                prayer: "God, sustain missionaries through hardship by Your Holy Spirit. Give them endurance without minimizing their pain, pour Your love into their hearts, show them when to rest or seek help, and preserve their hope and faithful witness in Christ."
            )
        ],
        closingPrayer: "Heavenly Father, draw missionaries and local believers close to Jesus, the source of enduring joy and eternal hope. When they face rejection, loneliness, grief, exhaustion, uncertainty, opposition, or other hardship, meet them with Your comforting presence. Give them freedom to lament honestly without shame and surround them with compassionate Christian community, wise counsel, practical help, and meaningful encouragement. Where suffering can be relieved, provide protection, provision, peace, safety, healing, and rest. When difficult circumstances continue, strengthen Your people to persevere without pretending the pain is small. Pour Your love into their hearts through the Holy Spirit, preserve their love for the people they serve, and help them remember that suffering does not have the final word. Sustain their faithful Gospel witness and bring fruit according to Your will as they rest in the resurrection hope of Christ. In Jesus’ name, Amen.",
        missionFocus: JourneyMissionInformation(
            countryOrPeopleGroup: "Myanmar",
            approximatePopulation: "Approximately 54.9 million people",
            approximateChristianPercentage: "Approximately 9% Christian",
            prayerFocus: "Pray for missionaries and local believers serving amid conflict, displacement, natural disasters, and economic hardship in Myanmar. Ask God for deep joy in Christ, protection, provision, appropriate rest, compassionate community, practical aid, endurance, and hope. Pray that they would continue loving their neighbors and bearing faithful Gospel witness, with fruit according to God's will."
        )
    )

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
                days: [missionaryDayOne, missionaryDayTwo, missionaryDayThree, missionaryDayFour, missionaryDayFive, missionaryDaySix, missionaryDaySeven, missionaryDayEight, missionaryDayNine] + (10...16).map { missionaryPlaceholderDay($0) },
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
