class RedefinirSenhaModel {
  final String email;
  final String senhaAntiga;
  final String senhaNova;
  final String senhaNovaConfirma;
  final String empresa;

  RedefinirSenhaModel({required this.email, required this.senhaAntiga, required this.senhaNova, required this.senhaNovaConfirma, required this.empresa});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'senhaAntiga': senhaAntiga,
      'senhaNova': senhaNova,
      'senhaNovaConfirma': senhaNovaConfirma,
      'empresa': empresa
    };
  }
}