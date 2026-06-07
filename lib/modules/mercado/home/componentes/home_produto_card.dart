import 'dart:convert';
import 'package:fidelem_app/core/data/enums/cdproduto_enum.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import '../../../../core/data/models/produto_entity.dart';
import '../../inventario/add_edit_view.dart';

class HomeProdutoCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback? onDelete;

  const HomeProdutoCard({
    super.key,
    required this.item,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: Cor.azulClaro1,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Cor.branco,
                borderRadius: BorderRadius.circular(12),
              ),
              child: item['CDPRODIMGBLOB'] != null && item['CDPRODIMGBLOB'].toString().isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.memory(
                        base64Decode(item['CDPRODIMGBLOB']),
                        fit: BoxFit.cover,
                        width: 64,
                        height: 64,
                      ),
                    )
                  : const Icon(Icons.image, size: 32, color: Cor.azul),
            ),
          ),

          const SizedBox(height: 8),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item[CDProdutoEnum.nome.value] ?? "-",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.5,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 4),

                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: Cor.preto,
                    ),
                    children: [
                      TextSpan(
                        text: "R\$ ${item[CDProdutoEnum.precoReal.value] ?? "-"} | ",
                      ),
                      TextSpan(
                        text: ((item[CDProdutoEnum.precoPonto.value] ?? 0) == 0)
                            ? "-"
                            : '${item[CDProdutoEnum.precoPonto.value].toString()} pts',
                        style: const TextStyle(color: Cor.vermelho),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    Expanded(
                      child: FIDButton(
                        text: "Editar",
                        preset: FIDButton.card,
                        padding: const {"top": 0.00},
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AddEditView(
                                isEditing: true,
                                produtoId: item[CDProdutoEnum.id.value],
                              ),
                            ),
                          );

                          if (result == true && onDelete != null) {
                            onDelete!(); // recarrega a home
                          }
                        },
                      ),
                    ),

                    const SizedBox(width: 6),

                    Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Excluir produto"),
                                content: const Text("Tem certeza que deseja excluir este produto?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancelar"),
                                  ),

                                  TextButton(
                                    onPressed: () async {

                                      await deleteProdutoById(context, item[CDProdutoEnum.id.value]);
                                      if (onDelete != null) {
                                        onDelete!();
                                      }
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Confirmar",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}