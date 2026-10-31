import 'package:flutter/material.dart';
import '../models/phone_component.dart';

const phoneComponents = [
  PhoneComponent(
    name: 'Screen',
    icon: Icons.touch_app_rounded,
    function:
        'Displays text, pictures, and video. A touch layer detects where your fingers touch the surface.',
    importance: 'It is the main way you see information and control the phone.',
    example:
        'Swipe through photos, tap a button, or zoom into a map with two fingers.',
  ),
  PhoneComponent(
    name: 'Battery',
    icon: Icons.battery_charging_full_rounded,
    function:
        'Stores energy chemically and supplies electrical power to the phone.',
    importance:
        'It lets your phone work without being connected to a wall charger.',
    example:
        'Watching video uses energy from the battery to power the screen, processor, and speakers.',
  ),
  PhoneComponent(
    name: 'Processor (CPU)',
    icon: Icons.memory_rounded,
    function:
        'Executes program instructions and coordinates calculations and other tasks.',
    importance:
        'It helps apps respond to your actions and works with other chips to run the device.',
    example:
        'When a calculator adds two numbers, the CPU follows the instructions needed to calculate the answer.',
  ),
  PhoneComponent(
    name: 'RAM',
    icon: Icons.developer_board_rounded,
    function:
        'Provides fast, temporary working memory for the operating system and active apps.',
    importance:
        'It holds data the processor needs quickly. It is different from long-term storage.',
    example:
        'A game keeps information about its current level in RAM while you play.',
  ),
  PhoneComponent(
    name: 'Storage',
    icon: Icons.storage_rounded,
    function:
        'Keeps apps, photos, videos, and other files even when the phone is switched off.',
    importance: 'It determines how much local data your phone can keep.',
    example:
        'A photo saved today stays in storage so you can open it after restarting the phone.',
  ),
  PhoneComponent(
    name: 'Camera',
    icon: Icons.camera_alt_rounded,
    function:
        'Uses a lens and image sensor to capture light; software turns the readings into photos or video.',
    importance:
        'It makes photography, video calls, and visual scanning possible.',
    example:
        'Scanning a QR code starts with the camera capturing an image of the pattern.',
  ),
  PhoneComponent(
    name: 'Speaker',
    icon: Icons.volume_up_rounded,
    function:
        'Converts electrical signals into sound by vibrating a small moving surface.',
    importance: 'It lets you hear calls, music, alerts, and videos.',
    example: 'An alarm app sends a sound signal to the speaker to wake you up.',
  ),
  PhoneComponent(
    name: 'Microphone',
    icon: Icons.mic_rounded,
    function:
        'Converts sound waves into electrical signals that the phone can process.',
    importance:
        'It captures your voice for calls, recordings, and voice commands.',
    example:
        'Recording a voice message uses the microphone to capture what you say.',
  ),
  PhoneComponent(
    name: 'Sensors',
    icon: Icons.sensors_rounded,
    function:
        'Measure things such as movement, rotation, nearby objects, and ambient light.',
    importance:
        'They help the phone react to its environment and how you hold it.',
    example:
        'A light sensor helps the screen become brighter outdoors and dimmer in a dark room.',
  ),
  PhoneComponent(
    name: 'SIM Card',
    icon: Icons.sim_card_rounded,
    function:
        'Holds information used to identify and authenticate your cellular subscription.',
    importance:
        'It helps a mobile operator connect service to your subscription. An eSIM provides this through an embedded component and profile.',
    example:
        'A compatible SIM or eSIM profile lets your phone register with your mobile operator.',
  ),
];
