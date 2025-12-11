import 'dart:io';

import 'package:fidelem_app/modules/inventario/produto_model.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/modules/inventario/funcaoWIP.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_input_box.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:image_picker/image_picker.dart';

// FUNCAO SO P FICAR BONITINHO




// esse prodTest vai ser substituido com getById 
// var prodTest = new ProdutoModel(
//   nome: "Detergente",
//   codigo: "000012000",
//   desc: "Detergente ype sabor cereja",
//   qtdEstoque: 10,
//   precoDinheiro: 8.99,
//   precoPontos: 900,
//   fotos: [Image.network("https://zaffari.vtexassets.com/arquivos/ids/258346/1046429-00.jpg?v=638621775612870000")],
// ).infoItem();
var prodTest = new ProdutoModel(
  nome: "Detergente",
  codigo: "000012000",
  desc: "Detergente ype sabor cereja",
  qtdEstoque: 10,
  precoDinheiro: 8.99,
  precoPontos: 900,
  fotos: [],
).infoItem();
List<File> listaImagens = prodTest['fotos'];

class EditView extends StatefulWidget{
  const EditView({super.key});

  @override
  State<EditView> createState() => _EditViewState();
}


class _EditViewState extends State<EditView> {
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
                      baseText: "Editar produto", 
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
                      baseText: "Altere os campos desejados", 
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
                    FIDInputBox(text: prodTest["codigo"], padding: {"bottom": 0.03}, preset: FIDInputBox.medium),
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
                    FIDInputBox(text: prodTest["nome"], padding: {"bottom": 0.03}, preset: FIDInputBox.medium),
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
                    FIDInputBox(text: prodTest["desc"], padding: {"bottom": 0.03}, preset: FIDInputBox.medium),
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
                    FIDInputBox(text: prodTest["qtdEstoque"].toString(), padding: {"bottom": 0.03}, preset: FIDInputBox.medium),
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
                    FIDInputBox(text: prodTest["precoDinheiro"].toString(), padding: {"bottom": 0.02}, preset: FIDInputBox.medium),


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

                    FIDButton(text: "Confirmar Alterações", preset: FIDButton.big, padding: {"top": 0.02}, onPressed: (){WIPfunction(context);},),                 
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