import 'package:flutter/material.dart';
import '../models/topic.dart';
import '../models/quiz.dart';
import '../models/teacher_data.dart';
import '../models/admin_data.dart';

class MockData {
  static final List<Topic> topics = [
    Topic(
      id: 'topic_1',
      title: 'पर्यावरण आणि परिसंस्था',
      englishTitle: 'Environment & Ecosystem',
      gradeCategory: 'सर्व इयत्ता',
      summary: 'आपल्या सभोवतालची सजीव-निर्जीव सृष्टी, अन्नसाखळी आणि निसर्गाचा समतोल.',
      icon: Icons.park_rounded,
      themeColor: const Color(0xFF2E7D32),
      bannerTag: 'मूलभूत संकल्पना',
      dailyActionTip: 'आज तुमच्या घराभोवती किमान एका झाडाला पाणी द्या आणि त्याची काळजी घ्या.',
      sections: [
        LessonSection(
          title: 'परिसंस्था म्हणजे काय?',
          content: 'परिसंस्था म्हणजे सजीव (झाडे, प्राणी, सूक्ष्मजीव) आणि त्यांचे अजैविक पर्यावरण (माती, पाणी, हवा, सूर्यप्रकाश) यांच्यातील आंतरक्रिया होय. निसर्गातील प्रत्येक घटकाचे एक विशिष्ट कार्य असते.',
          icon: Icons.nature_people_rounded,
        ),
        LessonSection(
          title: 'अन्नसाखळीचे महत्त्व',
          content: 'सूर्यप्रकाशापासून वनस्पती अन्न तयार करतात (उत्पादक), वनस्पतींना शाकाहारी प्राणी खातात (प्राथमिक भक्षक), आणि त्यांना मांसाहारी प्राणी खातात. या साखळीतील एक घटक जरी नष्ट झाला तरी संपूर्ण समतोल बिघडतो.',
          icon: Icons.device_hub_rounded,
        ),
        LessonSection(
          title: 'आपली जबाबदारी',
          content: 'निसर्गाचा समतोल राखण्यासाठी झाडे लावणे, पक्ष्यांना पाणी ठेवणे आणि जंगलांचे रक्षण करणे अत्यंत आवश्यक आहे.',
          icon: Icons.volunteer_activism_rounded,
        ),
      ],
    ),
    Topic(
      id: 'topic_2',
      title: 'वायू प्रदूषण',
      englishTitle: 'Air Pollution',
      gradeCategory: 'सर्व इयत्ता',
      summary: 'हवेतील विषारी वायू, धूर, त्याचे दुष्परिणाम आणि हवा शुद्ध ठेवण्याचे उपाय.',
      icon: Icons.air_rounded,
      themeColor: const Color(0xFF26A69A),
      bannerTag: 'हवेची शुद्धता',
      dailyActionTip: 'जवळच्या अंतरावर जाण्यासाठी वाहनांऐवजी सायकल वापरा किंवा पायी चाला.',
      sections: [
        LessonSection(
          title: 'वायू प्रदूषणाची कारणे',
          content: 'कारखान्यांचा धूर, वाहनांमधून निघणारा कार्बन मोनॉक्साइड, कचरा जाळणे आणि फटाके फोडणे यामुळे हवेमध्ये विषारी वायू मिसळतात व हवा दूषित होते.',
          icon: Icons.factory_rounded,
        ),
        LessonSection(
          title: 'आरोग्यावरील परिणाम',
          content: 'प्रदूषित हवेमुळे दमा, श्वसनाचे आजार, डोळ्यांची जळजळ आणि फुफ्फुसांचे विकार होतात. हवेच्या गुणवत्तेचा (AQI) निर्देशांक घसरतो.',
          icon: Icons.health_and_safety_rounded,
        ),
        LessonSection(
          title: 'प्रतिबंधात्मक उपाय',
          content: 'सार्वजनिक वाहतुकीचा वापर करा, सीएनजी व इलेक्ट्रिक वाहनांना प्राधान्य द्या आणि भरपूर ऑक्सिजन देणारी झाडे (जसे पिंपळ, वड, कडुलिंब) लावा.',
          icon: Icons.directions_bike_rounded,
        ),
      ],
    ),
    Topic(
      id: 'topic_3',
      title: 'जल प्रदूषण',
      englishTitle: 'Water Pollution',
      gradeCategory: 'सर्व इयत्ता',
      summary: 'नद्या, तलाव आणि समुद्रांचे प्रदूषण, जलीय जीवनावरील संकट व उपाय.',
      icon: Icons.water_drop_rounded,
      themeColor: const Color(0xFF0288D1),
      bannerTag: 'पाण्याचे रक्षण',
      dailyActionTip: 'नद्या, ओढे किंवा तलावांमध्ये प्लास्टिक पिशव्या व निर्माल्य टाकू नका.',
      sections: [
        LessonSection(
          title: 'जल प्रदूषण कसे होते?',
          content: 'कारखान्यातील प्रक्रिया न केलेले सांडपाणी, घरातील मलमूत्र, शेतीतील रासायनिक खते व कीटकनाशके थेट नद्यांमध्ये सोडल्याने जलस्रोत दूषित होतात.',
          icon: Icons.waves_rounded,
        ),
        LessonSection(
          title: 'जलचरांवर संकट',
          content: 'पाण्यातील ऑक्सिजनचे प्रमाण कमी झाल्याने मासे व इतर जलीय जीव मरण पावतात. दूषित पाण्यामुळे कॉलरा, कावीळ आणि टायफॉइडसारखे रोग पसरतात.',
          icon: Icons.pest_control_rounded,
        ),
        LessonSection(
          title: 'स्वच्छ पाण्याचा संकल्प',
          content: 'सांडपाण्यावर प्रक्रिया करणारे प्रकल्प (STP) उभारणे आणि जलस्रोतांजवळ कचरा टाकण्यास सक्त मनाई करणे आवश्यक आहे.',
          icon: Icons.clean_hands_rounded,
        ),
      ],
    ),
    Topic(
      id: 'topic_4',
      title: 'प्लास्टिक प्रदूषण',
      englishTitle: 'Plastic Pollution',
      gradeCategory: 'सर्व इयत्ता',
      summary: 'एकल-वापर (Single-use) प्लास्टिकचे धोके आणि पर्यावरणपूरक पर्याय.',
      icon: Icons.shopping_bag_outlined,
      themeColor: const Color(0xFFE53935),
      bannerTag: 'प्लास्टिक मुक्त भारत',
      dailyActionTip: 'बाजारात जाताना नेहमी कापडी किंवा तागाची पिशवी सोबत ठेवा.',
      sections: [
        LessonSection(
          title: 'प्लास्टिकचे संकट',
          content: 'प्लास्टिक नष्ट होण्यासाठी ५०० ते १००० वर्षे लागतात. प्लास्टिक विघटन न होता सूक्ष्म कणांमध्ये (Microplastics) रूपांतरित होऊन अन्न आणि पाण्यात मिसळते.',
          icon: Icons.warning_amber_rounded,
        ),
        LessonSection(
          title: 'प्राण्यांना होणारे नुकसान',
          content: 'कचऱ्यातील प्लास्टिक पिशव्या खाल्ल्यामुळे शेकडो गायी, जनावरे आणि समुद्री कासवे यांचा गुदमरून मृत्यू होतो.',
          icon: Icons.pets_rounded,
        ),
        LessonSection(
          title: 'उत्तम पर्याय',
          content: 'प्लास्टिक बाटल्यांऐवजी तांब्या-स्टीलच्या बाटल्या, प्लास्टिक स्ट्रॉ ऐवजी बांबू/कागदी स्ट्रॉ आणि कापडी पिशव्या वापरा.',
          icon: Icons.eco_rounded,
        ),
      ],
    ),
    Topic(
      id: 'topic_5',
      title: 'कचरा व्यवस्थापन',
      englishTitle: 'Waste Management',
      gradeCategory: 'सर्व इयत्ता',
      summary: 'ओला कचरा व सुका कचरा वर्गीकरण, कंपोस्ट खत निर्मिती पद्धत.',
      icon: Icons.delete_sweep_rounded,
      themeColor: const Color(0xFF6D4C41),
      bannerTag: 'स्वच्छ भारत',
      dailyActionTip: 'घरातील ओला कचरा हिरव्या डब्यात आणि सुका कचरा निळ्या डब्यात वेगळा ठेवा.',
      sections: [
        LessonSection(
          title: 'कचऱ्याचे २ प्रकार',
          content: '१) ओला कचरा (हिरवा डबा): भाजीपाल्याचे अवशेष, फळांची साले, उरलेले अन्न (जैविक विघटनशील).\n२) सुका कचरा (निळा डबा): कागद, काच, पुठ्ठा, धातू, रबर.',
          icon: Icons.delete_outline_rounded,
        ),
        LessonSection(
          title: 'घरच्या घरी कंपोस्ट खत',
          content: 'ओल्या कचऱ्यापासून खत तयार करता येते. एका कुंडीत ओला कचरा व मातीचा थर देऊन ३० ते ४० दिवसांत उत्तम सेंद्रिय खत तयार होते.',
          icon: Icons.compost_rounded,
        ),
        LessonSection(
          title: 'स्वच्छतेची सवय',
          content: 'सार्वजनिक ठिकाणी कचरा न टाकता कचराकुंडीचा वापर करा. कचरा व्यवस्थापनामुळे साथीचे रोग आटोक्यात येतात.',
          icon: Icons.cleaning_services_rounded,
        ),
      ],
    ),
    Topic(
      id: 'topic_6',
      title: 'पुनर्वापर (3R नियम)',
      englishTitle: 'Reduce, Reuse, Recycle',
      gradeCategory: 'सर्व इयत्ता',
      summary: 'कमी वापर (Reduce), पुनर्वापर (Reuse) आणि पुनर्चक्रीकरण (Recycle) चा मंत्र.',
      icon: Icons.autorenew_rounded,
      themeColor: const Color(0xFF8E24AA),
      bannerTag: '३R तत्त्वे',
      dailyActionTip: 'जुन्या वह्यांची कोरी पाने एकत्र करून रफ वही बनवा किंवा पुनर्वापर करा.',
      sections: [
        LessonSection(
          title: '3R मंत्र काय आहे?',
          content: '१. Reduce (कमी करा): अनावश्यक खरेदी व वस्तूंचा अपव्यय टाळा.\n२. Reuse (पुन्हा वापरा): बाटल्या, डबे व पिशव्या फेकून न देता पुन्हा वापरा.\n३. Recycle (पुनर्चक्रीकरण): जुने कागद व काचेवर प्रक्रिया करून नवीन वस्तू बनवा.',
          icon: Icons.sync_rounded,
        ),
        LessonSection(
          title: 'कचऱ्यातून कला (Best from Waste)',
          content: 'जुन्या नारळाच्या करवंट्यांपासून कुंड्या, जुन्या कपड्यांपासून पायपुसणी व पिशव्या बनवून आपण कचरा कमी करू शकतो.',
          icon: Icons.palette_rounded,
        ),
        LessonSection(
          title: 'संसाधनांची बचत',
          content: '१ टन कागदाचे पुनर्चक्रीकरण केल्याने तब्बल १७ मोठी झाडे तोडण्यापासून वाचतात!',
          icon: Icons.energy_savings_leaf_rounded,
        ),
      ],
    ),
    Topic(
      id: 'topic_7',
      title: 'पाणी संवर्धन',
      englishTitle: 'Water Conservation',
      gradeCategory: 'सर्व इयत्ता',
      summary: 'पाणी वाचवण्याच्या पद्धती, रेन वॉटर हार्वेस्टिंग आणि भूजल पातळी वाढवणे.',
      icon: Icons.opacity_rounded,
      themeColor: const Color(0xFF00ACC1),
      bannerTag: 'जल हेच जीवन',
      dailyActionTip: 'दात घासताना किंवा हात धुताना नळ चालू ठेवू नका, भांड्यात पाणी घेऊन वापरा.',
      sections: [
        LessonSection(
          title: 'पाण्याचे महत्त्व',
          content: 'पृथ्वीवर ७१% पाणी असले तरी पिण्यायोग्य गोडे पाणी फक्त १% पेक्षा कमी आहे. त्यामुळे पाण्याचा प्रत्येक थेंब अनमोल आहे.',
          icon: Icons.info_outline_rounded,
        ),
        LessonSection(
          title: 'रेन वॉटर हार्वेस्टिंग (छतावरील पाणी अडवणे)',
          content: 'पावसाचे पाणी घराच्या छतावरून पाईपद्वारे भूगर्भातील टाकीत किंवा विहिरीत सोडल्याने भूजल पातळी वाढते.',
          icon: Icons.roofing_rounded,
        ),
        LessonSection(
          title: 'दैनिक जीवनातील जलसंवर्धन',
          content: 'गळके नळ त्वरित दुरुस्त करा, वाहने धुण्यासाठी पाईपऐवजी बादली-बोळा वापरा आणि पाण्याचा पुनर्वापर करा.',
          icon: Icons.water_damage_rounded,
        ),
      ],
    ),
    Topic(
      id: 'topic_8',
      title: 'हवामान बदल आणि तापमानवाढ',
      englishTitle: 'Climate Change & Global Warming',
      gradeCategory: 'सर्व इयत्ता',
      summary: 'हरितगृह वायू (Greenhouse gases), वाढते जागतिक तापमान आणि शाश्वत जीवनशैली.',
      icon: Icons.thermostat_rounded,
      themeColor: const Color(0xFFF57C00),
      bannerTag: 'जागतिक आव्हान',
      dailyActionTip: 'खोलीतून बाहेर पडताना पंखे व दिवे बंद करा; विजेची बचत म्हणजे कोळशाची बचत.',
      sections: [
        LessonSection(
          title: 'ग्लोबल वॉर्मिंग म्हणजे काय?',
          content: 'कार्बन डायऑक्साइडसारख्या वायूंचे प्रमाण वाढल्याने सूर्याची उष्णता पृथ्वीच्या वातावरणात अडकून राहते, याला हरितगृह परिणाम (Greenhouse Effect) म्हणतात.',
          icon: Icons.wb_sunny_rounded,
        ),
        LessonSection(
          title: 'हवामान बदलाचे परिणाम',
          content: 'ध्रुवीय बर्फ वितळणे, समुद्राच्या पाण्याची पातळी वाढणे, अवकाळी पाऊस, दुष्काळ आणि वादळांचे प्रमाण वाढणे हे गंभीर परिणाम दिसत आहेत.',
          icon: Icons.cyclone_rounded,
        ),
        LessonSection(
          title: 'सौर ऊर्जेचा वापर',
          content: 'पारंपरिक ऊर्जेऐवजी सौर ऊर्जा आणि पवन ऊर्जेचा वापर वाढवून आपण कार्बन उत्सर्जन कमी करू शकतो.',
          icon: Icons.solar_power_rounded,
        ),
      ],
    ),
  ];

  static final Map<String, List<QuizQuestion>> quizDatabase = {
    'topic_1': [
      QuizQuestion(
        id: 'q1_1',
        topicId: 'topic_1',
        questionMarathi: 'निसर्गातील अन्नसाखळीमध्ये वनस्पतींना काय म्हणतात?',
        options: ['उत्पादक (Producers)', 'भक्षक (Consumers)', 'विघटक (Decomposers)', 'परजीवी'],
        correctOptionIndex: 0,
        explanationMarathi: 'वनस्पती सूर्यप्रकाशाच्या मदतीने स्वतःचे अन्न स्वतः तयार करतात, म्हणून त्यांना उत्पादक म्हणतात.',
      ),
      QuizQuestion(
        id: 'q1_2',
        topicId: 'topic_1',
        questionMarathi: 'परिसंस्थेतील सजीव घटकाला काय म्हणतात?',
        options: ['जैविक घटक (Biotic)', 'अजैविक घटक (Abiotic)', 'कृत्रिम घटक', 'रासायनिक घटक'],
        correctOptionIndex: 0,
        explanationMarathi: 'झाडे, कीटक, पक्षी, प्राणी व सूक्ष्मजीव हे परिसंस्थेतील जैविक (Biotic) घटक आहेत.',
      ),
      QuizQuestion(
        id: 'q1_3',
        topicId: 'topic_1',
        questionMarathi: 'हवेतील ऑक्सिजनचा मुख्य स्रोत कोणता आहे?',
        options: ['हिरवी झाडे व वनस्पती', 'कारखाने', 'समुद्रातील मीठ', 'डोंगर'],
        correctOptionIndex: 0,
        explanationMarathi: 'झाडे प्रकाशसंश्लेषण प्रक्रियेदरम्यान कार्बन डायऑक्साइड शोषून ऑक्सिजन सोडतात.',
      ),
    ],
    'topic_2': [
      QuizQuestion(
        id: 'q2_1',
        topicId: 'topic_2',
        questionMarathi: 'वाहनांच्या धुरामुळे हवेत प्रामुख्याने कोणता विषारी वायू सोडला जातो?',
        options: ['कार्बन मोनॉक्साइड', 'ऑक्सिजन', 'हायड्रोजन', 'नायट्रोजन'],
        correctOptionIndex: 0,
        explanationMarathi: 'वाहनांमधील इंधनाच्या अपूर्ण ज्वलनामुळे घातक कार्बन मोनॉक्साइड तयार होतो.',
      ),
      QuizQuestion(
        id: 'q2_2',
        topicId: 'topic_2',
        questionMarathi: 'हवेची गुणवत्ता मोजण्यासाठी कोणते प्रमाण वापरले जाते?',
        options: ['AQI (Air Quality Index)', 'BMI', 'IQ', 'PSI'],
        correctOptionIndex: 0,
        explanationMarathi: 'AQI (एअर क्वालिटी इंडेक्स) द्वारे हवेच्या प्रदूषणाची तीव्रता मोजली जाते.',
      ),
      QuizQuestion(
        id: 'q2_3',
        topicId: 'topic_2',
        questionMarathi: 'वायू प्रदूषण कमी करण्यासाठी खालीलपैकी कोणता उपाय योग्य आहे?',
        options: ['सायकल किंवा पायी चालणे', 'प्लास्टिक जाळणे', 'फटाके फोडणे', 'झाडे तोडणे'],
        correctOptionIndex: 0,
        explanationMarathi: 'सायकल वापरल्याने कोणतेही धूर किंवा उत्सर्जन होत नाही.',
      ),
    ],
    'topic_3': [
      QuizQuestion(
        id: 'q3_1',
        topicId: 'topic_3',
        questionMarathi: 'दूषित पाण्यामुळे खालीलपैकी कोणता आजार पसरू शकतो?',
        options: ['कावीळ आणि कॉलरा', 'अस्थमा', 'डोकेदुखी', 'हाडांचे विकार'],
        correctOptionIndex: 0,
        explanationMarathi: 'पाण्यातील विषाणू आणि जंतूंमुळे कॉलरा, गॅस्ट्रो आणि कावीळ हे जलजन्य रोग होतात.',
      ),
      QuizQuestion(
        id: 'q3_2',
        topicId: 'topic_3',
        questionMarathi: 'नद्यांमधील पाणी स्वच्छ ठेवण्यासाठी काय केले पाहिजे?',
        options: ['सांडपाण्यावर प्रक्रिया करून सोडणे', 'कचरा नदीत टाकणे', 'जनावरे धुणे', 'रासायनिक खते टाकणे'],
        correctOptionIndex: 0,
        explanationMarathi: 'एसटीपी (STP) प्रकल्पांद्वारे सांडपाण्यावर प्रक्रिया केल्याने नद्या स्वच्छ राहतात.',
      ),
    ],
    'topic_4': [
      QuizQuestion(
        id: 'q4_1',
        topicId: 'topic_4',
        questionMarathi: 'प्लास्टिक विघटन होण्यासाठी अंदाजे किती वर्षे लागतात?',
        options: ['५०० ते १००० वर्षे', '२ दिवस', '१ महिना', '५ वर्षे'],
        correctOptionIndex: 0,
        explanationMarathi: 'प्लास्टिकचे जैविक विघटन होत नसल्याने ते शेकडो वर्षे जमिनीत तसेच राहते.',
      ),
      QuizQuestion(
        id: 'q4_2',
        topicId: 'topic_4',
        questionMarathi: 'प्लास्टिक पिशव्यांऐवजी कोणता पर्यावरणपूरक पर्याय वापरावा?',
        options: ['कापडी व तागाची पिशवी', 'थर्मोकोल', 'अ‍ॅल्युमिनियम फॉईल', 'काचेची पिशवी'],
        correctOptionIndex: 0,
        explanationMarathi: 'कापडी पिशव्या वारंवार धुवून अनेक वर्षे वापरता येतात.',
      ),
    ],
    'topic_5': [
      QuizQuestion(
        id: 'q5_1',
        topicId: 'topic_5',
        questionMarathi: 'ओला कचरा टाकण्यासाठी सामान्यतः कोणत्या रंगाची कचराकुंडी वापरली जाते?',
        options: ['हिरवी (Green)', 'लाल (Red)', 'काळा (Black)', 'पिवळा (Yellow)'],
        correctOptionIndex: 0,
        explanationMarathi: 'ओल्या जैविक कचऱ्यासाठी हिरवा डबा आणि सुक्या कचऱ्यासाठी निळा डबा वापरला जातो.',
      ),
      QuizQuestion(
        id: 'q5_2',
        topicId: 'topic_5',
        questionMarathi: 'फळांची साले आणि उरलेले अन्न यापासून काय तयार करता येते?',
        options: ['सेंद्रिय कंपोस्ट खत', 'प्लास्टिक', 'काच', 'विटा'],
        correctOptionIndex: 0,
        explanationMarathi: 'ओल्या कचऱ्याचे विघटन होऊन झाडांसाठी उत्तम पोषक सेंद्रिय खत बनते.',
      ),
    ],
    'topic_6': [
      QuizQuestion(
        id: 'q6_1',
        topicId: 'topic_6',
        questionMarathi: 'पर्यावरण रक्षणातील "3R" तत्त्वांमध्ये कशाचा समावेश आहे?',
        options: ['Reduce, Reuse, Recycle', 'Run, Read, Rest', 'Rain, River, Root', 'Rise, React, Rule'],
        correctOptionIndex: 0,
        explanationMarathi: 'Reduce (कमी वापर), Reuse (पुन्हा वापर), Recycle (पुनर्चक्रीकरण) हा 3R नियम आहे.',
      ),
      QuizQuestion(
        id: 'q6_2',
        topicId: 'topic_6',
        questionMarathi: '१ टन कागदाचे पुनर्चक्रीकरण केल्यास अंदाजे किती झाडे वाचतात?',
        options: ['१७ झाडे', '२ झाडे', '५० झाडे', '१ झाड'],
        correctOptionIndex: 0,
        explanationMarathi: 'पुनर्चक्रीकरणामुळे सुमारे १७ मोठी झाडे आणि हजारो लिटर पाणी वाचते.',
      ),
    ],
    'topic_7': [
      QuizQuestion(
        id: 'q7_1',
        topicId: 'topic_7',
        questionMarathi: 'छतावरील पावसाचे पाणी साठवून भूजलामध्ये जिरवण्याच्या पद्धतीला काय म्हणतात?',
        options: ['रेन वॉटर हार्वेस्टिंग', 'ड्रिप इरिगेशन', 'डॅम फिल्टर', 'वॉटर सायकल'],
        correctOptionIndex: 0,
        explanationMarathi: 'पावसाचे पाणी साठवून विहिरी व कूपनलिकांचे पुनर्भरण करणे म्हणजे रेन वॉटर हार्वेस्टिंग.',
      ),
      QuizQuestion(
        id: 'q7_2',
        topicId: 'topic_7',
        questionMarathi: 'पृथ्वीवरील एकूण पाण्यापैकी पिण्यायोग्य गोडे पाणी किती टक्के आहे?',
        options: ['१% पेक्षा कमी', '५०%', '७५%', '२५%'],
        correctOptionIndex: 0,
        explanationMarathi: 'पृथ्वीवर ९७% खारे पाणी असून पिण्यायोग्य पाणी केवळ १% पेक्षा कमी आहे.',
      ),
    ],
    'topic_8': [
      QuizQuestion(
        id: 'q8_1',
        topicId: 'topic_8',
        questionMarathi: 'खालीलपैकी कोणता वायू प्रमुख हरितगृह वायू (Greenhouse Gas) आहे?',
        options: ['कार्बन डायऑक्साइड (CO2)', 'ऑक्सिजन (O2)', 'नायट्रोजन (N2)', 'हेलियम (He)'],
        correctOptionIndex: 0,
        explanationMarathi: 'कार्बन डायऑक्साइड आणि मिथेन वातावरणात उष्णता रोखून तापमान वाढवतात.',
      ),
      QuizQuestion(
        id: 'q8_2',
        topicId: 'topic_8',
        questionMarathi: 'प्रदूषण विरहित अक्षय ऊर्जा कोणती आहे?',
        options: ['सौर ऊर्जा व पवन ऊर्जा', 'कोळसा ऊर्जा', 'डिझेल जनरेटर', 'पेट्रोल'],
        correctOptionIndex: 0,
        explanationMarathi: 'सूर्यप्रकाश व वाऱ्यापासून वीज निर्मिती करताना कसलेही प्रदूषण होत नाही.',
      ),
    ],
  };

  static final List<TeacherClass> teacherClasses = [
    TeacherClass(
      id: 'c1',
      name: 'इयत्ता ६वी - तुकडी अ',
      studentCount: 38,
      completionRate: 0.82,
      topTopic: 'कचरा व्यवस्थापन',
    ),
    TeacherClass(
      id: 'c2',
      name: 'इयत्ता ७वी - तुकडी ब',
      studentCount: 42,
      completionRate: 0.68,
      topTopic: 'पाणी संवर्धन',
    ),
    TeacherClass(
      id: 'c3',
      name: 'इयत्ता ८वी - तुकडी अ',
      studentCount: 35,
      completionRate: 0.91,
      topTopic: 'हवामान बदल',
    ),
  ];

  static final List<StudentProgressRecord> studentRecords = [
    StudentProgressRecord(
      id: 's1',
      nameMarathi: 'आरव पाटील',
      className: 'इयत्ता ७वी',
      points: 550,
      completedLessons: 6,
      averageQuizScore: 92.5,
      status: 'उत्कृष्ट (Leader)',
    ),
    StudentProgressRecord(
      id: 's2',
      nameMarathi: 'अनन्या देशपांडे',
      className: 'इयत्ता ७वी',
      points: 480,
      completedLessons: 5,
      averageQuizScore: 88.0,
      status: 'सक्रिय (Active)',
    ),
    StudentProgressRecord(
      id: 's3',
      nameMarathi: 'रोहन गायकवाड',
      className: 'इयत्ता ६वी',
      points: 390,
      completedLessons: 4,
      averageQuizScore: 78.5,
      status: 'प्रगतीपथावर',
    ),
    StudentProgressRecord(
      id: 's4',
      nameMarathi: 'श्रेया कदम',
      className: 'इयत्ता ८वी',
      points: 620,
      completedLessons: 8,
      averageQuizScore: 96.0,
      status: 'इको स्टार ★',
    ),
  ];

  static final List<SystemStatMetric> adminMetrics = [
    SystemStatMetric(title: 'नोंदणीकृत शाळा', value: '४८', change: '+४ या महिन्यात', isPositive: true),
    SystemStatMetric(title: 'सक्रिय विद्यार्थी', value: '३,४२०', change: '+१२% वाढ', isPositive: true),
    SystemStatMetric(title: 'पूर्ण केलेल्या प्रश्नमंजुषा', value: '१५,८००', change: '+२२%', isPositive: true),
    SystemStatMetric(title: 'वाचवलेले कार्बन पाऊलखूण', value: '४.२ टन CO2', change: 'पर्यावरण प्रभाव', isPositive: true),
  ];

  static final List<UserRosterItem> userRoster = [
    UserRosterItem(
      id: 'u1',
      name: 'सुनील जोशी (शिक्षक)',
      role: 'शिक्षक',
      school: 'सरस्वती विद्यामंदिर, पुणे',
      gradeOrSubject: 'विज्ञान व पर्यावरण',
      joinDate: '१५ जून २०२५',
    ),
    UserRosterItem(
      id: 'u2',
      name: 'आरव पाटील (विद्यार्थी)',
      role: 'विद्यार्थी',
      school: 'सरस्वती विद्यामंदिर, पुणे',
      gradeOrSubject: 'इयत्ता ७वी',
      joinDate: '२० जून २०२५',
    ),
    UserRosterItem(
      id: 'u3',
      name: 'मनिषा कुलकर्णी (शिक्षक)',
      role: 'शिक्षक',
      school: 'आदर्श हायस्कूल, नाशिक',
      gradeOrSubject: 'भूगोल व पर्यावरण',
      joinDate: '०२ जुलै २०२५',
    ),
  ];
}
