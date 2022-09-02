import 'package:flutter/material.dart';
import 'package:superhero_app/models/models.dart';


class SuperheroDetailsScreen extends StatelessWidget {
  const SuperheroDetailsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Superheros App')),
      body: SingleChildScrollView(child: _buildSuperheroDetailsContainer(context)),
   );
  }

  Widget _buildSuperheroDetailsContainer(BuildContext context) {
    
    final SuperheroModel superheroModel = ModalRoute.of(context)?.settings.arguments as SuperheroModel;
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          width: screenWidth * 0.9,
      
          child: _buildSuperheroDetailsCard(superheroModel, screenWidth)
          
        ),
      ),
    );
  }

  Widget _buildSuperheroDetailsCard(SuperheroModel superheroModel, double screenWidth) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(8.0)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Column(
          children: [

            _buildSuperheroDetailsImage(superheroModel, screenWidth),

            _buildSuperheroDetailsInformation(superheroModel)

          ],
        ),
      ),
    );
  }

  Widget _buildSuperheroDetailsImage(SuperheroModel superheroModel, double screenWidth) {
    return Stack(
      children: [
        const Center(child: CircularProgressIndicator()),
        Image.network(
          '${superheroModel.images!.lg}',
          width: screenWidth * 0.9,
        ),
      ]
    );
  }

  Widget _buildSuperheroDetailsInformation(SuperheroModel superheroModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Row(
            children: [
              Flexible(child: Text(superheroModel.name, textScaleFactor: 2, overflow: TextOverflow.visible)),
            ],
          ),
    
          // Publisher if available
          if (superheroModel.biography?.publisher?.isNotEmpty == true && superheroModel.biography?.publisher != "-")
            Row(
              children: [
                Flexible(child: Text('Publisher: ${superheroModel.biography!.publisher}', overflow: TextOverflow.visible)),
              ],
            ),
    
          // First appearance if available
          if (superheroModel.biography?.firstAppearance?.isNotEmpty == true && superheroModel.biography?.firstAppearance != "-")
            Row(
              children: [
                Flexible(child: Text('First appearance: ${superheroModel.biography!.firstAppearance}', overflow: TextOverflow.visible)),
              ],
            ),
    
          // Full name if available
          if (superheroModel.biography?.fullName?.isNotEmpty == true && superheroModel.biography?.fullName != "-")
            Row(
              children: [
                Flexible(child: Text('Full name: ${superheroModel.biography!.fullName}', overflow: TextOverflow.visible)),
              ],
            ),
    
          // Aliases if available
          if (superheroModel.biography?.aliases?.isNotEmpty == true && superheroModel.biography?.aliases?.first != "-")
            Row(
              children: [
                Flexible(child: Text('Aliases: ${superheroModel.biography!.aliases!.join(', ')}', overflow: TextOverflow.visible)),
              ],
            ),
    
          // Gender and race if available
          if (superheroModel.appearance?.gender?.isNotEmpty == true && superheroModel.appearance?.gender != "-"
              && superheroModel.appearance?.race?.isNotEmpty == true)
            Row(
              children: [
                Flexible(child: Text('Gender/Race: ${superheroModel.appearance!.gender} - ${superheroModel.appearance!.race}', overflow: TextOverflow.visible)),
              ],
            ),
    
          _buildSuperheroHeight(superheroModel),
    
          _buildSuperheroWeight(superheroModel),
            
          // Work occupation if available
          if (superheroModel.work?.occupation?.isNotEmpty == true && superheroModel.work?.occupation != "-")
            Row(
              children: [
                Flexible(child: Text('Occupation: ${superheroModel.work!.occupation}', overflow: TextOverflow.visible)),
              ],
            )
          
        ],
      ),
    );
  }
  
  Widget _buildSuperheroHeight(SuperheroModel superheroModel) {

    String height = '';

    bool validHeight = superheroModel.appearance?.height != null && superheroModel.appearance!.height!.isNotEmpty 
        && superheroModel.appearance!.height!.any((e) => e.contains('cm')
        && superheroModel.appearance!.height!.firstWhere((e) => e.contains('cm')) != '0 cm');

    if (validHeight) {
      height = superheroModel.appearance!.height!.firstWhere((e) => e.contains('cm'));
    }

    return Visibility(
      visible: validHeight,
      child: Row(
        children: [
          Flexible(child: Text('Height: $height', overflow: TextOverflow.visible)),
        ],
      ),
    );

  }

  Widget _buildSuperheroWeight(SuperheroModel superheroModel) {

    String weight = '';

    bool validweight = superheroModel.appearance?.weight != null && superheroModel.appearance!.weight!.isNotEmpty 
        && superheroModel.appearance!.weight!.any((e) => e.contains('kg')
        && superheroModel.appearance!.weight!.firstWhere((e) => e.contains('kg')) != '0 kg');

    if (validweight) {
      weight = superheroModel.appearance!.weight!.firstWhere((e) => e.contains('kg'));
    }

    return Visibility(
      visible: validweight,
      child: Row(
        children: [
          Flexible(child: Text('Weight: $weight', softWrap: true)),
        ],
      ),
    );

  }
}