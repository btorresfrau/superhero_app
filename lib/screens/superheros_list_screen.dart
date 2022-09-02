import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superhero_app/bloc/bloc.dart';
import 'package:superhero_app/models/models.dart';

class SuperheroListScreen extends StatefulWidget {
  const SuperheroListScreen({Key? key}) : super(key: key);

  @override
  SuperheroListScreenState createState() => SuperheroListScreenState();
}

class SuperheroListScreenState extends State<SuperheroListScreen> {
  final SuperherosBloc _superherosBloc = SuperherosBloc();

  @override
  void initState() {
    _superherosBloc.add(GetSuperherosList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Superheros App')),
      body: _buildListSuperheros(),
    );
  }

  Widget _buildListSuperheros() {
    return Container(
      margin: const EdgeInsets.all(5),
      child: BlocProvider(
        create: (_) => _superherosBloc,
        child: BlocListener<SuperherosBloc, SuperherosState>(
          listener: (context, state) {
            if (state is SuperherosError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<SuperherosBloc, SuperherosState>(
            builder: (context, state) {
              if (state is SuperherosInitial) {
                return _buildLoading();
              } else if (state is SuperherosLoading) {
                return _buildLoading();
              } else if (state is SuperherosLoaded) {
                return _buildList(context, state.superheroeModels);
              } else if (state is SuperherosError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, List<SuperheroModel> superheroModels) {
    return ListView.builder(
      itemCount: superheroModels.length,
      itemBuilder: (context, index) {
        
        return GestureDetector(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(8.0)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Row(
                  children: [

                    _buildCardImage(superheroModels[index]),

                    _buildCardInfo(superheroModels[index])

                  ],
                ),
              ),
            )
          ),

          onTap: () => Navigator.of(context).pushNamed('/details', arguments: superheroModels[index]),
        );

      },
      
    );
  }

  Widget _buildCardImage(SuperheroModel superheroModel) {
    return SizedBox(
      width: 150,
      child: Stack(
        children: [
          const Center(child: CircularProgressIndicator()),
          Image.network(
            '${superheroModel.images!.md}',
            width: 150
          ),
        ]
      )
    );
  }

  Widget _buildCardInfo(SuperheroModel superheroModel) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(superheroModel.name, textScaleFactor: 2, overflow: TextOverflow.ellipsis),
    
            // Gender and race if available
            if (superheroModel.appearance?.gender?.isNotEmpty == true && superheroModel.appearance?.gender != "-"
                && superheroModel.appearance?.race?.isNotEmpty == true)
              Text('${superheroModel.appearance!.gender} - ${superheroModel.appearance!.race}', overflow: TextOverflow.ellipsis),
    
            // Work occupation if available
            if (superheroModel.work?.occupation?.isNotEmpty == true && superheroModel.work?.occupation != "-")
              Text('${superheroModel.work!.occupation}', overflow: TextOverflow.ellipsis)
          ],
        ),
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}