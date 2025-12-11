import 'dart:io';

import 'package:fidelem_app/modules/inventario/fun%C3%A7%C3%A3oWIP.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_input_box.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:image_picker/image_picker.dart';
// const normalPadding

List<File> listaImagens = [];

class AddManualView extends StatefulWidget{
  const AddManualView({super.key});

  @override
  State<AddManualView> createState() => _AddManualViewState();
}


class _AddManualViewState extends State<AddManualView> {
  var _nImagem = 0;
  
  void atualizaImagem () {
    setState(() {
      {
        _nImagem = listaImagens.length;
      } 
    });
    // _nImagem++;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(

        padding: EdgeInsetsGeometry.directional(top: 50, start: 25, end: 25),
        child: SingleChildScrollView(child:
          Column(
                  spacing: 0.04,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
              
                    FIDText(
                      baseText: "Adicionar Produto - Manualmente", 
                      fontSize: 0.024, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.black, 
                      textAlign: TextAlign.start,
                      padding: {
                        "top": 0.05,
                        "bottom": 0.01
                      },
                    ),
                
                    FIDText(
                      baseText: "Adicione as informações do seu produto", 
                      fontSize: 0.018, 
                      color: Colors.black, 
                      textAlign: TextAlign.start, 
                      padding: {
                        "top": 0.0,
                        "bottom": 0.05,
                      }
                    ),
                
                    // FIDLine(width: ,),

                    // UM INPUT
                    FIDText(
                      baseText: "Código EAN", 
                      fontSize: 0.018, 
                      color: Colors.black, 
                      textAlign: TextAlign.start, 
                      fontWeight: FontWeight.bold,
                      padding: {
                        "top": 0.0,
                        "bottom": 0.005,
                      }
                    ),
                    FIDInputBox(text: "Insira o codigo do produto", padding: {"bottom": 0.03}, preset: FIDInputBox.medium),
                    // 
                    FIDText(
                      baseText: "Nome do Produto", 
                      fontSize: 0.018, 
                      color: Colors.black, 
                      textAlign: TextAlign.start, 
                      fontWeight: FontWeight.bold,
                      padding: {
                        "top": 0.0,
                        "bottom": 0.005,
                      }
                    ),
                    FIDInputBox(text: "Insira o nome do produto", padding: {"bottom": 0.03}, preset: FIDInputBox.medium),
                    // 
                    FIDText(
                      baseText: "Descrição", 
                      fontSize: 0.018, 
                      color: Colors.black, 
                      textAlign: TextAlign.start, 
                      fontWeight: FontWeight.bold,
                      padding: {
                        "top": 0.0,
                        "bottom": 0.005,
                      }
                    ),
                    FIDInputBox(text: "Insira uma breve descrição", padding: {"bottom": 0.03}, preset: FIDInputBox.medium),
                    // 
                    FIDText(
                      baseText: "Quantidade em estoque", 
                      fontSize: 0.018, 
                      color: Colors.black, 
                      textAlign: TextAlign.start, 
                      fontWeight: FontWeight.bold,
                      padding: {
                        "top": 0.0,
                        "bottom": 0.005,
                      }
                    ),
                    FIDInputBox(text: "Quantidade disponivel em estoque", padding: {"bottom": 0.03}, preset: FIDInputBox.medium),
                    // 
                    FIDText(
                      baseText: "Preço", 
                      fontSize: 0.018, 
                      color: Colors.black, 
                      textAlign: TextAlign.start, 
                      fontWeight: FontWeight.bold,
                      padding: {
                        "top": 0.0,
                        "bottom": 0.005,
                      }
                    ),
                    FIDInputBox(text: "Preço do Produto", padding: {"bottom": 0.02}, preset: FIDInputBox.medium),


                    FIDText(
                      baseText: "Imagens ($_nImagem)" , 
                      fontSize: 0.018, 
                      color: Colors.black, 
                      textAlign: TextAlign.start, 
                      fontWeight: FontWeight.bold,
                      padding: {
                        "top": 0.0,
                        "bottom": 0.005,
                      }
                    ),
                    Row(
                      spacing: 20,
                      children: [
                        ElevatedButton(
                          child: Column(
                            children: [
                              Icon(Icons.camera_alt_outlined),
                              Text("Camera")
                            ],
                          ),
                          onPressed: () async {
                            File? img;
                            final picker = ImagePicker();

                            final pickedFile = await picker.pickImage(source: ImageSource.camera);

                            if(pickedFile != null){
                              img = File(pickedFile.path);
                              listaImagens.add(img);
                              atualizaImagem();

                            }}),

                          Text("OU"),

                          ElevatedButton(
                            onPressed: () async{
                              File? img;
                              final picker = ImagePicker();
                              
                              final pickedFile = await picker.pickImage(source: ImageSource.gallery);

                              if(pickedFile != null){
                                img = File(pickedFile.path);
                                listaImagens.add(img);
                                atualizaImagem();
                                              
                              }
                            },
                          
                            child: Column(
                              children: [
                                Icon(Icons.add_circle_outline),
                                Text("Upload")
                              ],
                            )
                          )
                      ],
                    ),

                    FIDButton(text: "+ Adicionar", preset: FIDButton.big, padding: {"top": 0.02}, onPressed: (){WIPfunction(context);},),                 
                ],
              ), 
        )
      ),
    );
  }
  
}


// VOU DEIXAR A FUNÇÃO AQUI, NÃO CONSEGUI FAZER ELA FUNCIONAR NORMAL
// escolherImagem(String tipo) async {
//   File? img;
//   final picker = ImagePicker();
//   final pickedFile;
  
//   if (tipo == "galeria"){
//     pickedFile = await picker.pickImage(source: ImageSource.gallery);
//   } else {
//     pickedFile = await picker.pickImage(source: ImageSource.camera);
//   }

//   if(pickedFile != null){
//     img = File(pickedFile.path);
//     setState () {};
                  
//   }
// }