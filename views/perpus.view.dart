import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigasi_perpus/controllers/perpus_controllers.dart';
import 'package:navigasi_perpus/widgets/bottom_nav.dart';
import 'package:navigasi_perpus/widgets/modal.dart';
import 'package:navigasi_perpus/models/perpus.dart';

class PerpusView extends StatefulWidget {
  PerpusView({super.key});

  @override
  State<PerpusView> createState() => _PerpusViewState();
}

class _PerpusViewState extends State<PerpusView> {
    PerpusControllers perpus = PerpusControllers();
    TextEditingController tittleInput = TextEditingController();
    TextEditingController deskripsiInput = TextEditingController();
    TextEditingController judulInput = TextEditingController();
    TextEditingController penerbitInput = TextEditingController();
    TextEditingController karyaInput = TextEditingController();
    TextEditingController StockInput = TextEditingController();
    TextEditingController gambarInput = TextEditingController();
    TextEditingController voteAverage = TextEditingController();
    final GlobalKey<FormState> _formKeyTambah = GlobalKey<FormState>();
    ModalWidget modal = ModalWidget();

    List<String> listAct = ["Ubah", "Hapus"];
    List<Perpus>? book;
    int? book_id;
    getBook(){
      setState(() {
        book = perpus.perpus;
      });
    }

    addBook(data) {
      book!.add(data);
      getBook();
    }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBook();
  }
     

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perpus"),
        backgroundColor: Colors.purpleAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                book_id = null;
              });
              tittleInput.text = '';
              judulInput.text = '';
              deskripsiInput.text = '';
              penerbitInput.text = '';
              karyaInput.text = '';
              StockInput.text = '';
              gambarInput.text = '';
              voteAverage.text = '';
              modal.showFullModal(context, fromTambah(null));
              }, 
              icon: Icon(Icons.add_sharp))
        ],
      ),
      body: book !=null
      ? ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: book!.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image(
                image: AssetImage(book![index].posterPath),
                ),
                title: Column(
                  children: [
                    Text(
                      book![index].judul,
                      style : TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        book![index].deskripsi,style: TextStyle(fontSize: 10),
                      ),
                      Text(
                        book![index].penerbit,
                        style: TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                      ),
                      Text(
                        book![index].karya,
                        style: TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                      ),
                      Text(
                        book![index].stock,
                        style: TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                      ),
                      Text(
                        book![index].voteAverage.toString()
                      ),
                  ],),
                  trailing: PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.more_vert,
                      color: Color.fromARGB(255, 0, 0, 0),
                      size: 30.0,
                    ),
                    itemBuilder: (BuildContext context) {
                      return listAct.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                          onTap: () {
                            if (choice=="Ubah") {
                              setState(() {
                                book_id = book![index].id;
                              });
                              judulInput.text = book![index].judul;
                              deskripsiInput.text = book![index].deskripsi;
                              penerbitInput.text = book![index].penerbit;
                              karyaInput.text = book![index].karya;
                              StockInput.text = book![index].stock;
                              gambarInput.text = book![index].posterPath;

                              voteAverage.text = 
                              book![index].voteAverage.toString();
                              modal.showFullModal(
                                context, fromTambah(index));
                              } else if (choice == "Hapus") {
                                book!.removeWhere(
                                  (item) => item.id == book![index].id);
                                  getBook();
                              }
                          },
                          );
                      }).toList();
                    },
                    ),
                ));
        }):
        Text("Data Kosong"),
        bottomNavigationBar: BottomNav(3),
    );
  }

  Widget fromTambah(index) {
  return Form(
    key: _formKeyTambah,
    child: Column(
      children: [
        Text("Tambah Data"),
        TextFormField(
          controller: tittleInput,
          decoration: InputDecoration(label: Text("ID")),
          validator: (value) {
            if (value!.isEmpty) {
              return 'harus diisi';
            } else {
              return null;
            }
          },
        ),
      ],
    ),
  );
}

}
