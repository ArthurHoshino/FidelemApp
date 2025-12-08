class LoginModel {
  final String usuario;
  final String senha;
  final String empresa;

  LoginModel({required this.usuario, required this.senha, required this.empresa});

  Map<String, dynamic> toJson() {
    return {
      'usuario': usuario,
      'senha': senha,
      'empresa': empresa
    };
  }
}