import 'package:flutter/material.dart';
import 'package:kuis_prak_tpm/rental_car.dart';
import 'package:kuis_prak_tpm/detail_mobil.dart';

class ListMobil extends StatelessWidget {
  const ListMobil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rental Mobil'),
      ),
      body: ListView.builder(
        itemCount: rentalCar.length,
        itemBuilder: (context, index){
          final RentalCar mobil = rentalCar[index];
          return ListTile(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => DetailMobil(mobil : mobil))
              );
            },
            leading: Image.network(
              mobil.images[0],
              width: 150,
              fit: BoxFit.cover,
            ),
            title: Text(mobil.brand + ' ' + mobil.model,
              style: const TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 20),
            ),
            subtitle: Text(mobil.rentalPricePerDay + ' / hari'),
          );
        },
      ),
    );
  }
}
