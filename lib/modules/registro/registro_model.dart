class RegistroModel {
  final String nome;
  final String email;
  final String senha;
  final String senhaConfirma;
  final String empresa;

  RegistroModel({required this.nome, required this.email, required this.senha, required this.senhaConfirma, required this.empresa});

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
      'senhaConfirma': senhaConfirma,
      'empresa': empresa,
    };
  }
}