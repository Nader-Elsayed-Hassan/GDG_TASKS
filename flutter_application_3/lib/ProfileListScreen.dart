import 'package:flutter/material.dart';
import 'package:flutter_application_3/AnimatedProfileCard.dart';
import 'package:flutter_application_3/Profile.dart';
import 'package:flutter_application_3/main.dart';

//todo I'm creating this class from chat GPT

class ProfileListScreen extends StatelessWidget {
  ProfileListScreen({super.key});

  final List<Profile> profiles = [
    Profile(
      name: 'John Doe',
      description: 'Software Developer',
      imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
      detailedInfo:
          '5+ years of experience in Flutter development. Specializes in UI/UX design and animation implementations.',
    ),
    Profile(
      name: 'Jane Smith',
      description: 'UX Designer',
      imageUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
      detailedInfo:
          'Passionate about creating intuitive user experiences. Works with Figma and Adobe XD.',
    ),
    Profile(
      name: 'Mike Johnson',
      description: 'Data Scientist',
      imageUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
      detailedInfo:
          'Expert in machine learning and data visualization. Python and TensorFlow specialist.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Cards'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: profiles.length, // the lenght of the list We are create
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return AnimatedProfileCard(
            profile: profile,
            delay: Duration(milliseconds: 80 * index),
          );
        },
      ),
    );
  }
}
