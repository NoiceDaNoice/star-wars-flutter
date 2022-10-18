import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/ui/detail.dart';

import '../bloc/species_bloc.dart';
import '../model/species.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final SpeciesBloc speciesBloc = SpeciesBloc();
  final controller = ScrollController();
  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (controller.position.atEdge) {
        bool isTop = controller.position.pixels == 0;
        if (isTop) {
        } else {
          speciesBloc.add(LoadSpecies());
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<SpeciesResult> list = [];
    bool hasReachMax = false;

    Widget listSpecies() {
      return BlocProvider(
        create: (_) => speciesBloc..add(LoadSpecies()),
        child: BlocBuilder<SpeciesBloc, SpeciesState>(
          builder: (context, state) {
            if (state is SpeciesFailed) {
              return Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Failed to load species.'),
                    TextButton(
                      onPressed: () => speciesBloc..add(LoadSpecies()),
                      child: const Text(
                        'Retry',
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is SpeciesSuccess) {
              list = state.listSpecies;
              hasReachMax = state.hasReachedMax;
            }
            return ListView.builder(
              controller: controller,
              itemCount: list.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index < list.length) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            result: list[index],
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      tileColor: Colors.white,
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                            'assets/species/${list[index].name}.webp'),
                      ),
                      title: Text(list[index].name!),
                      subtitle: Text(list[index].classification!),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: (hasReachMax == false)
                          ? const CircularProgressIndicator()
                          : const Text('No more data'),
                    ),
                  );
                }
              },
            );
          },
        ),
      );
    }

    return Scaffold(
      body: SafeArea(child: listSpecies()),
    );
  }
}
