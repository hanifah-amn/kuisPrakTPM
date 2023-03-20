import 'package:flutter/material.dart';
import 'package:kuis_prak_tpm/rental_car.dart';

class DetailMobil extends StatefulWidget {
  final RentalCar mobil;
  const DetailMobil({Key? key, required this.mobil}) : super(key: key);

  @override
  State<DetailMobil> createState() => _DetailMobilState();
}

class _DetailMobilState extends State<DetailMobil> {
  String status = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mobil.brand + ' ' + widget.mobil.model),
      ),
      body: SingleChildScrollView(
        child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Image.network(widget.mobil.images[index]),
                    itemCount: 3,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(widget.mobil.brand + ' ' + widget.mobil.model,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text('Brand      : ' + widget.mobil.brand),
                      Text('Model      : ' + widget.mobil.model),
                      Text('Tahun      : '),
                      Text('Biaya Sewa : ' + widget.mobil.rentalPricePerDay + ' per Hari'),
                      // status = setState(() { (widget.mobil.available) ? 'Tersedia' : 'Tidak Tersedia';
                      //   });
                      Text('Status     : '), //_statusMobil(context),

                      ElevatedButton(
                        onPressed: (){

                        },
                        child: const Text('Pesan'),
                      ),
                      const Text('Deskripsi'),
                      Text(widget.mobil.description,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            )
      ),
    );
  }

  Widget _statusMobil(BuildContext context){
    if(widget.mobil.available){
      setState(() {
        status = 'Tersedia';
      });
    }
    else{
      setState(() {
        status = 'Tidak Tersedia';
      });
    }
    return Text(status,
      style: TextStyle(color: (widget.mobil.available) ? Colors.green : Colors.red),
    );
  }
}
