import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'John Mike Ignacio',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final List<String> imgList = const [
    'https://grc.edu.ph/wp-content/uploads/2023/03/grc-ccs-min-1.jpg',
    'https://grc.edu.ph/wp-content/uploads/2023/02/FINAL-OUTPUT-JC-FINAL-PROMISE-min-1.jpg',
    'https://grc.edu.ph/wp-content/uploads/2023/02/accountancy-1.5.-final-na-to-1.jpg',
    'https://grc.edu.ph/wp-content/uploads/2022/03/EDUC.jpg',
    'https://tse3.mm.bing.net/th/id/OIP.yusHCahHlwvi6NTPZbdSMQHaDE?rs=1&pid=ImgDetMain&o=7&rm=3',
  ];

  final List<String> captionList = const [
    'College of Computer Studies',
    'College of Business Administration & Entrepreneurship',
    'College of Accountancy',
    'College of Education',
    'Global Reciprocal Colleges',
  ];

  final String mission = "Mission: GRC is creating a culture for successful, socially responsible, morally upright skilled workers and highly competent professionals through values-based quality education.";
  final String vision = "Vision: A global community of excellent individuals with values";

  final String missionVisionText = "Touching Hearts, Renewing Minds, Transforming Lives..";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("School Profile"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildLogo(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              missionVisionText,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: _buildCarousel(),
          ),

          const Divider(thickness: 1, height: 10),

          _buildInfoTile(
            imageUrl: 'https://grc.edu.ph/wp-content/uploads/elementor/thumbs/it-outu8f4vazq9hp49ntbuxv3pe85vgr5rndrar3lmiw.jpg',
            title: 'Choosing the right program can help you set your future goals and visualize where you want to be. Whether you want to be an engineer, a teacher, an accountant, or you want to level up in your profession, making yourself informed with the right choices will surely back you up in the future. Are you ready to map your career with Global Reciprocal Colleges? Make the best decision in choosing the right path for you.',
            description: vision,
            isImageLeft: true,
          ),

          const Divider(thickness: 1, height: 10),

          _buildInfoTile(
            imageUrl: 'https://tse2.mm.bing.net/th/id/OIP.kxPc890Pl-WTikIot05WBQHaFj?rs=1&pid=ImgDetMain&o=7&rm=3',
            title: 'With a dream of having a free education through reciprocation, where everyone can have the opportunity to change their lives through a very affordable tuition fee and even scholarship grants, available not just for the youth but also for adults. Chairman Vicente Ongtenco established the Global Reciprocal Colleges aiming to develop the youth to become responsible, competent, and dedicated professionals.',
            description: mission,
            isImageLeft: false,
          ),

          const Spacer(),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.5, 16.5, 16.5, 8.5),
        child: Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 1.0),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://grc.edu.ph/wp-content/uploads/2020/08/LOGO_ORIGINAL-removebg-preview.png",
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: imgList.asMap().entries.map((entry) {
        final int index = entry.key;
        final String imageURL = entry.value;
        final String caption = captionList[index];
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      imageURL,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      caption,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildInfoTile({
    required String imageUrl,
    required String title,
    required String description,
    required bool isImageLeft,
  }) {
    final imageWidget = Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: 120,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, size: 120),
          ),
        ),
      ),
    );

    final textWidget = Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );

    final List<Widget> children = isImageLeft
        ? [imageWidget, textWidget]
        : [textWidget, imageWidget];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        elevation: 4,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ),
      ),
    );
  }
}

