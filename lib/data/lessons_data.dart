import '../models/lesson_model.dart';

const introductionLessons = [
  Lesson(
    id: 'intro-1',
    title: 'A small computer in your pocket',
    content: [
      'A mobile phone is a portable electronic device that communicates without a cable. A smartphone also runs programs called apps. It combines a computer, a camera, a music player, and a communication tool in one device.',
      'Hardware is the physical equipment you can touch, such as the screen and battery. Software is the set of instructions that tells the hardware what to do. A phone needs both: a camera sensor captures light, while camera software turns its readings into a picture.',
      'Input is information you give a device. Processing is the work it does with that information. Output is the result it shows or plays. Storage keeps information for later.',
    ],
    fact:
        'A touchscreen is both an output device (it shows images) and an input device (it detects touch).',
    example:
        'When you tap a calculator app, your tap is input, the calculation is processing, and the answer on the screen is output.',
  ),
  Lesson(
    id: 'intro-2',
    title: 'How phones communicate',
    content: [
      'A phone uses radio waves to send and receive information. For cellular service, it connects to a nearby base station. The mobile operator connects that station to other networks and, when needed, to the internet.',
      'Wi-Fi connects your phone to a nearby router. Bluetooth usually connects nearby devices, such as earbuds or a keyboard. These are different wireless technologies with different purposes.',
      'The internet is a global network of networks. Cellular data and Wi-Fi are two ways to reach it. A phone can still do many things without internet access, such as taking photos or running an offline learning app.',
    ],
    fact:
        'A strong Wi-Fi signal means a good connection to the router; it does not guarantee that the router has internet access.',
    example:
        'At home you might use Wi-Fi for a download, Bluetooth for headphones, and cellular service for a phone call.',
  ),
  Lesson(
    id: 'intro-3',
    title: 'Reading phone specifications',
    content: [
      'Specifications describe a phone\'s parts and capabilities. Storage, often measured in gigabytes (GB), holds your apps and files. RAM is the temporary working space used by running programs. These two types of memory do different jobs.',
      'Battery capacity is commonly listed in milliampere-hours (mAh). A larger number can mean more stored charge, but real battery life also depends on the screen, processor, signal strength, software, and your usage.',
      'Screen size is usually measured diagonally in inches. Resolution describes the number of pixels. Camera megapixels count image pixels; lens quality, sensor size, lighting, and processing also affect the photo.',
    ],
    fact:
        'One specification rarely tells the whole story. Compare the complete device and how you plan to use it.',
    example:
        'Someone who records many videos may value storage, while a frequent traveler may care more about battery life.',
  ),
];

const historyLessons = [
  Lesson(
    id: 'history-1',
    title: 'From wired calls to handheld phones',
    content: [
      'Early telephones needed wires. Later mobile radio systems allowed calls from vehicles, but the equipment was large and expensive. Engineers gradually reduced the size of the electronics and improved batteries.',
      'In 1973, a Motorola team demonstrated a handheld cellular phone call. Commercial handheld cellular phones followed in the 1980s. Early devices were heavy, had short battery life, and mainly made voice calls.',
      'Cellular networks divide a region into smaller areas called cells. Reusing radio resources across separated cells allowed networks to support more users than a single large radio transmitter could.',
    ],
    fact:
        'The 1973 handheld demonstration came before commercial handheld cellular phones became available.',
    example:
        'An early mobile phone helped someone call while away from a desk, but it could not run the apps you use today.',
  ),
  Lesson(
    id: 'history-2',
    title: 'The era of feature phones',
    content: [
      'During the 1990s, digital cellular networks helped phones become smaller and more widely used. Physical keypads were common. Many devices focused on calls, text messages, an address book, and a few built-in tools.',
      'SMS, or Short Message Service, made it possible to send short text messages. Later feature phones added games, basic web browsing, color screens, and cameras. They were more capable than early voice-only phones.',
      'A feature phone usually has a more limited operating system and app selection than a modern smartphone. Feature phones remain useful when simple controls, lower cost, or long standby time matter.',
    ],
    fact: 'The first SMS text message was sent in 1992.',
    example:
        'To type a letter on many older keypads, you pressed the same number key several times.',
  ),
  Lesson(
    id: 'history-3',
    title: 'The smartphone shift',
    content: [
      'Smartphones developed over many years. Early devices combined phone functions with calendars, email, and other computer features. Touchscreens existed before the modern smartphone era.',
      'The iPhone launched in 2007 and helped popularize large touch interfaces. The first commercial Android phone followed in 2008. App stores made it easier for people to find and install software from many developers.',
      'Faster networks, better cameras, improved processors, and more capable operating systems changed how people used phones. The phone became a platform for navigation, learning, photography, entertainment, and work.',
    ],
    fact:
        'Smartphones existed before the iPhone; its launch helped accelerate a broader change in mobile design.',
    example:
        'A journey that once needed a paper map, music player, and separate camera can now use apps on one phone.',
  ),
];

const hardwareLessons = [
  Lesson(
    id: 'hardware-1',
    title: 'CPU, RAM, and storage',
    content: [
      'The central processing unit (CPU) executes instructions and coordinates many tasks. A graphics processing unit (GPU) specializes in work such as drawing images. In phones, these and other parts are often integrated into a system on a chip (SoC).',
      'RAM is fast, temporary working memory. Apps use it while they run. Its contents are normally lost when power is removed. Storage keeps installed apps, photos, and other files after the phone is turned off.',
      'Think of the CPU as a worker, RAM as the work desk, and storage as a filing cabinet. A bigger desk helps with more active work, but it does not replace the filing cabinet.',
    ],
    fact:
        'Adding storage space does not automatically increase RAM or processor speed.',
    example:
        'Opening a game loads information from storage into RAM so the processor can use it quickly.',
  ),
  Lesson(
    id: 'hardware-2',
    title: 'Screens, cameras, and sound',
    content: [
      'A display contains tiny picture elements called pixels. LCD screens use a backlight; OLED pixels emit their own light. A touch sensor detects where your finger changes an electrical field on the screen.',
      'A camera lens focuses light onto an image sensor. The sensor converts light into electrical signals. Software processes those signals into a photo. Good lighting often improves an image more than simply increasing the megapixel count.',
      'A microphone changes sound into an electrical signal. A speaker does the reverse: it moves to create sound waves from an electrical signal. These components let you record and play sound.',
    ],
    fact:
        'Refresh rate, measured in hertz (Hz), describes how often the display can update its image each second.',
    example:
        'During a video call, the camera and microphone provide input, while the screen and speaker provide output.',
  ),
  Lesson(
    id: 'hardware-3',
    title: 'Power, sensors, and the SIM',
    content: [
      'Most smartphones use rechargeable lithium-ion batteries. Charging stores energy chemically; using the phone releases that energy to power its circuits. Heat and heavy workloads can affect battery performance.',
      'Sensors help a phone understand its surroundings. An accelerometer detects acceleration and helps identify orientation. A gyroscope measures rotation. A proximity sensor detects nearby objects, and a light sensor helps adjust brightness.',
      'A SIM stores information used to identify and authenticate a mobile subscription. A removable SIM is a small card. An eSIM uses an embedded component with a downloadable subscription profile. Neither is the main storage for your apps.',
    ],
    fact:
        'A proximity sensor can help turn off the touchscreen while you hold the phone to your ear.',
    example:
        'When you rotate a phone to watch a video, sensor readings help the software switch to landscape orientation.',
  ),
];

const operatingSystemLessons = [
  Lesson(
    id: 'os-1',
    title: 'What an operating system does',
    content: [
      'An operating system (OS) is the main software that manages a device. It coordinates the processor, memory, files, network connections, and connected hardware. It also provides the interface you use.',
      'Apps ask the operating system to perform common tasks, such as displaying a notification or opening the camera. This saves each app from needing to control every hardware part directly.',
      'The OS shares limited resources among apps. It may pause background work to save power or close a background app when memory is needed elsewhere. This is why an app sometimes reloads when you return to it.',
    ],
    fact:
        'The home screen is one visible part of the OS experience; much of its work happens in the background.',
    example:
        'When two apps want to play audio, the operating system helps manage which audio you hear.',
  ),
  Lesson(
    id: 'os-2',
    title: 'Understanding Android and iOS',
    content: [
      'Android and iOS are two major smartphone operating systems. Android is used by many phone manufacturers. Its open-source foundation allows manufacturers to adapt parts of the system for their devices.',
      'iOS is Apple\'s operating system for the iPhone. Apple designs both the iPhone hardware and iOS, which gives it close control over how they work together.',
      'Both systems provide touch interfaces, accessibility tools, app management, notifications, and security controls. Their menus and available features differ. App compatibility depends on the OS, device, and version.',
    ],
    fact:
        'An app built for one operating system does not automatically run on the other.',
    example:
        'Two friends may use the same messaging service, even though one installs its Android app and the other its iOS app.',
  ),
  Lesson(
    id: 'os-3',
    title: 'Updates and app permissions',
    content: [
      'Operating system updates can fix errors, close security weaknesses, and add features. App updates improve individual apps. Update availability depends on the device maker and its support policy.',
      'Permissions let you control access to sensitive capabilities such as the camera, microphone, and location. Many systems let you allow access only while using an app. Grant access when the feature has a clear reason to need it.',
      'You can usually review permissions in system settings. Removing a permission may disable a related feature, but other parts of the app can still work. Keeping software updated and checking permissions are useful habits.',
    ],
    fact:
        'A permission request is a choice about access; it is not proof that an app is trustworthy.',
    example:
        'A voice recorder needs microphone access to record sound, but it does not normally need your contacts.',
  ),
];

const networkLessons = [
  Lesson(
    id: 'networks-1',
    title: 'Cells, towers, and handovers',
    content: [
      'A cellular network uses base stations to serve geographic areas called cells. Your phone exchanges radio signals with a base station, and the operator routes your calls and data through its network.',
      'As you move, the network can transfer your connection to another cell. This process is called a handover. Overlapping coverage helps keep a call or data session working while you travel.',
      'Coverage depends on distance, buildings, terrain, radio frequency, and network design. Speed also depends on available capacity and how many people are sharing it. Signal bars are not a direct speed measurement.',
    ],
    fact:
        'A base station does not have to be a tall tower; antennas may be installed on rooftops or smaller street structures.',
    example:
        'On a bus ride, your phone may use several cells without you noticing each handover.',
  ),
  Lesson(
    id: 'networks-2',
    title: 'From 2G to 5G',
    content: [
      'The G in 2G, 3G, 4G, and 5G stands for generation. 2G brought digital cellular voice and supported SMS, with data services added to many networks. 3G improved mobile data and made internet use more practical.',
      '4G networks, commonly associated with LTE, were designed around packet data and supported more capable mobile internet services. 5G adds ways to increase capacity, support more connected devices, and reduce delay under suitable conditions.',
      'A newer generation does not guarantee a faster experience everywhere. Coverage, spectrum, device support, congestion, and the operator\'s equipment all matter. Older networks may be retired at different times in different regions.',
    ],
    fact:
        'A 5G-capable phone still needs compatible network coverage and an appropriate service plan to use 5G.',
    example:
        'A strong, uncongested 4G connection can work better than a weak or crowded 5G connection.',
  ),
  Lesson(
    id: 'networks-3',
    title: 'Speed, latency, and data use',
    content: [
      'Download speed describes how quickly data reaches your device. Upload speed describes how quickly it leaves. These speeds are often measured in megabits per second (Mbps). Files are commonly measured in megabytes (MB); a byte contains eight bits.',
      'Latency is the delay before information reaches its destination or a response returns, depending on how it is measured. Low delay helps interactive tasks such as calls and online games.',
      'Data usage is the total amount transferred. Higher-quality video generally uses more data than text. Downloading lessons on Wi-Fi or using offline content can reduce cellular data use.',
    ],
    fact:
        'Bandwidth and latency describe different things: transfer capacity and delay.',
    example:
        'A video call needs enough upload and download speed, but it also benefits from low latency so replies feel natural.',
  ),
];

const appLessons = [
  Lesson(
    id: 'apps-1',
    title: 'What makes an app work?',
    content: [
      'An application, or app, is software designed for a task. A user interface presents buttons, text, images, and controls. Program logic decides what happens when you interact with them.',
      'Apps can store information locally or communicate with remote computers called servers. A local calculator can work entirely on the phone. A live weather app usually needs a network connection to obtain new weather data.',
      'Some apps work offline but need the internet for certain features. Others are built around online services. Whether an app needs the internet depends on its design, not simply on whether it is installed.',
    ],
    fact:
        'This learning app keeps its lessons on the device and does not need an online account.',
    example:
        'Tapping Mark as completed changes this app\'s in-memory state, which immediately updates the progress display.',
  ),
  Lesson(
    id: 'apps-2',
    title: 'Native, web, and cross-platform apps',
    content: [
      'A native app is made for a specific platform using its supported tools and interfaces. A web app runs through a web browser and is built using web technologies. Their capabilities can overlap, but their delivery methods differ.',
      'Cross-platform tools help developers share code across multiple operating systems. Flutter uses the Dart language and can build interfaces for several platforms from a shared project.',
      'No approach is best for every project. Developers consider the features they need, supported devices, performance, accessibility, and the effort required to maintain the app.',
    ],
    fact:
        'Sharing code does not remove the need to test an app on each target platform.',
    example:
        'A student can use Flutter to build Android and iOS versions of a learning app with much of the same Dart code.',
  ),
  Lesson(
    id: 'apps-3',
    title: 'The app lifecycle',
    content: [
      'An app is in the foreground when you are actively using it. It moves to the background when you switch away. The operating system may restrict background work to protect battery life and performance.',
      'Temporary state lives in memory, such as the answer currently selected in a quiz. Persistent data is written to storage so it can survive a restart. Developers choose which information should be saved.',
      'Installing adds an app to your device. Updating replaces its software with a newer version. Uninstalling removes the app, usually along with its private local data; online account data may remain with the service.',
    ],
    fact:
        'This project deliberately keeps progress in memory, so a full app restart starts a new learning session.',
    example:
        'Returning from another screen keeps your lesson progress, but fully restarting this learning app resets it.',
  ),
];

const securityLessons = [
  Lesson(
    id: 'security-1',
    title: 'Locks, encryption, and updates',
    content: [
      'A screen lock helps prevent someone from casually opening your phone. Use a strong device passcode. Fingerprint or face unlock can make access convenient, while the passcode remains an important fallback.',
      'Encryption transforms readable information into a form that requires the correct key to read. Modern phones use encryption to help protect stored data. Its protection works alongside other controls, including the screen lock.',
      'Security updates fix known weaknesses in software. Install supported updates from the device\'s official update mechanism. A lock alone cannot protect against every software problem.',
    ],
    fact:
        'Screen locking controls access, while encryption protects the representation of data. They are related but different.',
    example:
        'If a phone is misplaced, a strong lock and device encryption make its private data harder to access.',
  ),
  Lesson(
    id: 'security-2',
    title: 'Recognizing phishing and risky apps',
    content: [
      'Phishing is an attempt to trick you into revealing information or taking an unsafe action. A message might pretend to be from a familiar company, create urgency, and direct you to a fake sign-in page.',
      'Check unexpected requests using a trusted route, such as opening the service\'s app yourself. Do not share passwords or one-time verification codes with someone who unexpectedly asks for them.',
      'Review an app\'s publisher and requested permissions. Trusted distribution sources reduce some risks but do not guarantee that every app is safe. A simple flashlight app should not need access to your private messages.',
    ],
    fact:
        'A professional-looking logo or an urgent message does not prove that a sender is genuine.',
    example:
        'If a text says your account will close, open the official app directly to check instead of following the message\'s link.',
  ),
  Lesson(
    id: 'security-3',
    title: 'Protecting privacy and connections',
    content: [
      'Privacy means having control over information about you. Review which apps can use your location, contacts, camera, and microphone. Share only what a feature actually needs, and remove access you no longer use.',
      'Public Wi-Fi may be shared with strangers. Verify the network name and avoid ignoring security warnings. HTTPS encrypts the connection between your app or browser and a server, but it does not prove that the server itself is honest.',
      'Backups help you recover important information after a device is lost or damaged. Protect the backup too. Before giving away a phone, follow its official steps to remove accounts and erase personal data.',
    ],
    fact:
        'A secure connection can still lead to a dishonest website. Check both the connection and the destination.',
    example:
        'Allow a map app to use your location while you navigate, then review whether it needs access in the background.',
  ),
];

const futureLessons = [
  Lesson(
    id: 'future-1',
    title: 'AI that runs on your device',
    content: [
      'Artificial intelligence (AI) systems find patterns in information to perform tasks such as recognizing speech or identifying objects in photos. Some tasks can run directly on a phone instead of sending all the data to a remote server.',
      'On-device processing can reduce network dependence and keep some information local. Specialized processors can help perform these calculations efficiently. The device still has limits in memory, power, and heat.',
      'AI output can be mistaken. Developers and users must consider accuracy, privacy, and when human checking is needed. Some features combine local processing with online services.',
    ],
    fact:
        'On-device AI does not automatically mean an entire app is offline or that no information ever leaves the device.',
    example:
        'A keyboard may suggest the next word using a model on your phone, even when the phone is offline.',
  ),
  Lesson(
    id: 'future-2',
    title: 'Foldables, AR, and connected devices',
    content: [
      'Foldable phones use flexible displays and a hinge to change their shape. They offer different screen sizes in one device, but their design must consider durability, weight, and how apps adapt when the screen changes.',
      'Augmented reality (AR) places digital information over a view of the real world. A phone can combine its camera and motion sensors to estimate where to place a virtual object.',
      'The Internet of Things (IoT) describes connected physical devices such as lights, watches, and sensors. Phones can act as controls or gateways for these devices. Compatibility, security, and power use remain important design concerns.',
    ],
    fact:
        'AR adds to your view of the real world; virtual reality generally replaces that view with a simulated environment.',
    example:
        'An AR furniture app can preview a virtual chair in a room through the phone\'s camera view.',
  ),
  Lesson(
    id: 'future-3',
    title: 'Better connections, longer device lives',
    content: [
      'Mobile research explores future network generations, more efficient radios, and connections in places with limited coverage. A research proposal is not the same as a service that is widely available. Real deployment takes testing, standards, compatible devices, and infrastructure.',
      'Progress is also about efficiency and repair. Longer software support, replaceable parts, and more efficient chips can help a device remain useful. Reusing a working phone can reduce the need to manufacture a replacement.',
      'Phones contain valuable materials. When a device can no longer be used, responsible electronics recycling can recover some of them. Better technology should consider people, resources, and accessibility as well as speed.',
    ],
    fact:
        'A device\'s useful life depends on software support and repair options as well as the strength of its hardware.',
    example:
        'Replacing a worn battery in a supported phone can extend its useful life without replacing the whole device.',
  ),
];
