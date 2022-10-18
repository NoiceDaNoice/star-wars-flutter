import 'package:flutter/material.dart';
import 'package:starwars/model/species.dart';

class DetailPage extends StatelessWidget {
  final SpeciesResult result;
  const DetailPage({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/species/${result.name}.webp',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  result.name!,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  '\nClassification',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  result.classification!,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const Text(
                  'Designetion',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  result.designation!,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const Text(
                  'Average height',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${result.averageHeight!} cm',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const Text(
                  'Skin colors',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  result.skinColors!,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const Text(
                  'Hair colors',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  result.hairColors!,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const Text(
                  'Eye colors',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  result.eyeColors!,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const Text(
                  'Life span',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${result.averageLifespan!} years',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const Text(
                  'Home world',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  (result.homeworld!=null)?result.homeworld!:'n/a',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const Text(
                  'Language',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  result.language!,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const Text(
                  'People',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  result.people!.toString(),
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const Text(
                  'Film',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  result.films!.toString(),
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
