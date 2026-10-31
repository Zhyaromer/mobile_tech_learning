import '../models/question_model.dart';

// Each module has five questions. correctIndex starts at zero.
const questionsByModule = <String, List<Question>>{
  'intro': [
    Question(
      prompt: 'Which of these is hardware?',
      answers: [
        'A messaging app',
        'A camera sensor',
        'An operating system',
        'A game program',
      ],
      correctIndex: 1,
      explanation:
          'Hardware is a physical component. The camera sensor is a physical part of a phone.',
    ),
    Question(
      prompt: 'What connects a phone to a nearby Wi-Fi router?',
      answers: [
        'A SIM tray',
        'GPS',
        'Wi-Fi radio signals',
        'The charging cable only',
      ],
      correctIndex: 2,
      explanation:
          'Wi-Fi uses radio signals between a device and a nearby access point or router.',
    ),
    Question(
      prompt: 'When you tap a calculator button, the tap is an example of…',
      answers: ['Input', 'Storage', 'Output', 'A backup'],
      correctIndex: 0,
      explanation:
          'Input is information or a command you give a device, including a touch on the screen.',
    ),
    Question(
      prompt:
          'Which specification tells you the space available for apps and photos?',
      answers: [
        'Refresh rate',
        'Screen diagonal',
        'Processor clock speed',
        'Storage capacity',
      ],
      correctIndex: 3,
      explanation:
          'Storage capacity describes how much data can be kept on the device.',
    ),
    Question(
      prompt: 'Which statement about battery life is correct?',
      answers: [
        'mAh alone determines battery life',
        'Usage, hardware, and capacity all matter',
        'Screen brightness has no effect',
        'Every phone lasts the same time',
      ],
      correctIndex: 1,
      explanation:
          'Capacity matters, but power use by the screen, processor, radios, and software also affects battery life.',
    ),
  ],
  'history': [
    Question(
      prompt: 'What did Motorola demonstrate in 1973?',
      answers: [
        'The first Android app store',
        'A 5G network',
        'A handheld cellular phone call',
        'An OLED foldable phone',
      ],
      correctIndex: 2,
      explanation:
          'A Motorola team demonstrated a handheld cellular phone call in 1973, before commercial handheld models arrived.',
    ),
    Question(
      prompt: 'What was the main purpose of early handheld mobile phones?',
      answers: [
        'Making voice calls',
        'Streaming HD video',
        'Running AR games',
        'Editing large spreadsheets',
      ],
      correctIndex: 0,
      explanation:
          'Early handheld cellular phones mainly provided voice calls and had limited battery life.',
    ),
    Question(
      prompt: 'What does SMS let people send?',
      answers: [
        'Only live video',
        'Battery power',
        'Physical documents',
        'Short text messages',
      ],
      correctIndex: 3,
      explanation:
          'SMS stands for Short Message Service and carries short text messages.',
    ),
    Question(
      prompt: 'In which year was the iPhone introduced?',
      answers: ['1992', '2007', '1973', '2018'],
      correctIndex: 1,
      explanation:
          'Apple introduced the iPhone in 2007. Smartphones already existed before its launch.',
    ),
    Question(
      prompt: 'How did app stores help smartphones grow?',
      answers: [
        'They removed the need for software',
        'They replaced all mobile networks',
        'They made apps easier to find and install',
        'They made every app work offline',
      ],
      correctIndex: 2,
      explanation:
          'App stores made it easier to distribute, discover, and install apps from many developers.',
    ),
  ],
  'hardware': [
    Question(
      prompt: 'What is the main job of the CPU?',
      answers: [
        'Store electrical charge',
        'Execute program instructions',
        'Focus light',
        'Identify a mobile subscription',
      ],
      correctIndex: 1,
      explanation:
          'The central processing unit executes instructions and coordinates computing tasks.',
    ),
    Question(
      prompt:
          'Which memory is mainly temporary working space for running apps?',
      answers: ['The SIM card', 'Flash storage', 'The camera sensor', 'RAM'],
      correctIndex: 3,
      explanation:
          'RAM holds active working data. Its contents are normally lost when power is removed.',
    ),
    Question(
      prompt: 'Which component converts sound into an electrical signal?',
      answers: ['Microphone', 'Speaker', 'Display', 'Battery'],
      correctIndex: 0,
      explanation:
          'A microphone captures sound as an electrical signal. A speaker converts a signal back into sound.',
    ),
    Question(
      prompt: 'Which sensor helps detect that you have rotated the phone?',
      answers: [
        'The storage chip',
        'The speaker',
        'The accelerometer',
        'The SIM',
      ],
      correctIndex: 2,
      explanation:
          'The accelerometer measures acceleration, including the effect of gravity, which helps software determine orientation.',
    ),
    Question(
      prompt: 'What is a SIM mainly used for?',
      answers: [
        'Cooling the CPU',
        'Identifying and authenticating a mobile subscription',
        'Storing all installed apps',
        'Increasing display brightness',
      ],
      correctIndex: 1,
      explanation:
          'A SIM contains information used by a cellular network to identify and authenticate a subscription.',
    ),
  ],
  'os': [
    Question(
      prompt: 'What is the main role of an operating system?',
      answers: [
        'Manufacturing the battery',
        'Replacing the cellular tower',
        'Taking only photographs',
        'Managing hardware and software resources',
      ],
      correctIndex: 3,
      explanation:
          'The operating system manages resources such as memory, processing, files, and hardware access.',
    ),
    Question(
      prompt: 'Which operating system is used by many phone manufacturers?',
      answers: ['Android', 'iOS', 'A camera lens', 'SMS'],
      correctIndex: 0,
      explanation:
          'Many manufacturers use Android. iOS is designed by Apple for iPhone.',
    ),
    Question(
      prompt: 'Why can an app reload when you return to it?',
      answers: [
        'The SIM has changed color',
        'All storage was erased',
        'The OS may have reclaimed its memory',
        'The display became an input device',
      ],
      correctIndex: 2,
      explanation:
          'The OS can remove a background app from memory when it needs resources for other work.',
    ),
    Question(
      prompt: 'Why are security updates useful?',
      answers: [
        'They guarantee an app can never fail',
        'They fix known software weaknesses',
        'They physically enlarge the screen',
        'They replace your battery',
      ],
      correctIndex: 1,
      explanation:
          'Security updates repair known vulnerabilities. They do not guarantee protection from every threat.',
    ),
    Question(
      prompt: 'Which permission does a voice recorder need for recording?',
      answers: [
        'Contacts',
        'Location at all times',
        'Nearby printers',
        'Microphone',
      ],
      correctIndex: 3,
      explanation:
          'A voice recorder needs microphone access to capture audio. Unrelated permissions may not be necessary.',
    ),
  ],
  'networks': [
    Question(
      prompt: 'What does the G in 4G and 5G mean?',
      answers: ['Generation', 'Gigabyte', 'Graphics', 'Gravity'],
      correctIndex: 0,
      explanation: 'G stands for generation of cellular network technology.',
    ),
    Question(
      prompt: 'What is a handover?',
      answers: [
        'Installing an app update',
        'Changing a screen protector',
        'Moving a connection from one cell to another',
        'Saving a contact to storage',
      ],
      correctIndex: 2,
      explanation:
          'A handover transfers a connection between cells as coverage conditions change or the user moves.',
    ),
    Question(
      prompt: 'Which term describes network delay?',
      answers: ['Storage', 'Latency', 'Resolution', 'Battery capacity'],
      correctIndex: 1,
      explanation:
          'Latency describes delay. Lower latency can make calls and other interactive services feel more responsive.',
    ),
    Question(
      prompt: 'How many bits are in one byte?',
      answers: ['2', '4', '10', '8'],
      correctIndex: 3,
      explanation:
          'One byte contains eight bits. Mbps and MB describe different units.',
    ),
    Question(
      prompt: 'Which statement about 5G is correct?',
      answers: [
        'It is always faster in every location',
        'It works without compatible coverage',
        'Its performance depends on coverage and network conditions',
        'It makes all data usage free',
      ],
      correctIndex: 2,
      explanation:
          'Generation is only one factor. Coverage, congestion, device support, and infrastructure also affect performance.',
    ),
  ],
  'apps': [
    Question(
      prompt: 'Can an installed app work without the internet?',
      answers: [
        'Never',
        'Yes, if its features use local resources',
        'Only if it has no screen',
        'Only on feature phones',
      ],
      correctIndex: 1,
      explanation:
          'An app can work offline when its content and required processing are available locally.',
    ),
    Question(
      prompt: 'Where does a web app run?',
      answers: [
        'Inside a battery',
        'Only in a SIM card',
        'Only on a camera sensor',
        'Through a web browser',
      ],
      correctIndex: 3,
      explanation:
          'Web apps are used through a browser and are built with web technologies.',
    ),
    Question(
      prompt: 'Which language is used to write Flutter apps?',
      answers: ['Dart', 'SQL only', 'HTML only', 'SMS'],
      correctIndex: 0,
      explanation:
          'Flutter applications are written using the Dart programming language.',
    ),
    Question(
      prompt:
          'What happens to this learning app\'s progress after a full restart?',
      answers: [
        'It is emailed to you',
        'It is saved in an online account',
        'It resets because it is held in memory',
        'It is stored on the SIM',
      ],
      correctIndex: 2,
      explanation:
          'This project deliberately uses in-memory state and does not persist progress to storage.',
    ),
    Question(
      prompt: 'Why may the OS limit background app activity?',
      answers: [
        'To remove every installed app',
        'To save energy and manage resources',
        'To increase the phone\'s physical size',
        'To disable all foreground apps',
      ],
      correctIndex: 1,
      explanation:
          'Limiting background tasks helps preserve battery life and resources for the apps you are using.',
    ),
  ],
  'security': [
    Question(
      prompt: 'What is phishing?',
      answers: [
        'Charging through USB',
        'Installing an official system update',
        'Cleaning the screen',
        'Tricking someone into sharing information or taking an unsafe action',
      ],
      correctIndex: 3,
      explanation:
          'Phishing uses deception, often through messages or fake websites, to obtain information or prompt unsafe actions.',
    ),
    Question(
      prompt: 'What does encryption do?',
      answers: [
        'Transforms data so it needs the correct key to be read',
        'Increases screen size',
        'Makes every website honest',
        'Replaces app permissions',
      ],
      correctIndex: 0,
      explanation:
          'Encryption changes readable data into a protected form that requires the appropriate key to recover.',
    ),
    Question(
      prompt:
          'An unexpected text asks you to sign in urgently. What is a safer response?',
      answers: [
        'Share your password in a reply',
        'Follow the link immediately',
        'Open the official app yourself and check',
        'Send your verification code to the sender',
      ],
      correctIndex: 2,
      explanation:
          'Checking through an independently trusted route avoids relying on a potentially deceptive link.',
    ),
    Question(
      prompt: 'Does HTTPS prove that a website is honest?',
      answers: [
        'Yes, always',
        'No; it protects the connection, not the site\'s intentions',
        'Yes, if the logo looks real',
        'Only when using cellular data',
      ],
      correctIndex: 1,
      explanation:
          'HTTPS encrypts the connection, but dishonest websites can use HTTPS too.',
    ),
    Question(
      prompt: 'Why should you review app permissions?',
      answers: [
        'To automatically double RAM',
        'To avoid all software updates',
        'To improve the camera lens physically',
        'To limit access to information and features the app needs',
      ],
      correctIndex: 3,
      explanation:
          'Reviewing permissions helps you control access to private information and sensitive device capabilities.',
    ),
  ],
  'future': [
    Question(
      prompt: 'What is one possible benefit of on-device AI?',
      answers: [
        'It can process some tasks without a network connection',
        'It is always correct',
        'It needs unlimited battery power',
        'It guarantees the entire app sends no data',
      ],
      correctIndex: 0,
      explanation:
          'Local AI can work without a network for supported tasks, though the app may still have other online features.',
    ),
    Question(
      prompt: 'What does augmented reality do?',
      answers: [
        'Always replaces the real world completely',
        'Removes all phone sensors',
        'Adds digital content to a view of the real world',
        'Only increases storage capacity',
      ],
      correctIndex: 2,
      explanation:
          'AR overlays digital information on the real world, often using the camera and motion sensors.',
    ),
    Question(
      prompt: 'Which is an example of an Internet of Things device?',
      answers: [
        'An ordinary paper notebook',
        'A connected smart light',
        'A non-electronic chair',
        'A printed photograph',
      ],
      correctIndex: 1,
      explanation:
          'IoT includes connected physical devices such as smart lights, watches, and sensors.',
    ),
    Question(
      prompt: 'What can help extend a phone\'s useful life?',
      answers: [
        'Ignoring all updates',
        'Throwing it away when a new model appears',
        'Removing its storage chip',
        'Repairable parts and continued software support',
      ],
      correctIndex: 3,
      explanation:
          'Repair options and software support can keep a device useful for longer.',
    ),
    Question(
      prompt: 'How should we think about future network research?',
      answers: [
        'Every proposal is already available everywhere',
        'It never needs compatible hardware',
        'Research needs testing and infrastructure before wide deployment',
        'It removes the need for radio signals',
      ],
      correctIndex: 2,
      explanation:
          'Research ideas need development, standards, compatible devices, and infrastructure before they become widely available services.',
    ),
  ],
};
