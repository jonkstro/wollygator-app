import '../enums/auth_permissions_enum.dart';

class UserModel {
  final String id;
  final String name;
  final String registrationNumber;
  final DateTime birthDate;
  final String email;
  final String imageUrl;
  final DateTime registrationDate;
  final AuthPermissionsEnum permission;
  final bool isActive;
  final DateTime createdAt;

  UserModel({
    // Valor padrão é 'user', depois muda se quiser
    this.permission = AuthPermissionsEnum.user,
    required this.id,
    required this.name,
    required this.registrationNumber,
    required this.birthDate,
    required this.email,
    required this.imageUrl,
    required this.registrationDate,
    required this.isActive,
    required this.createdAt,
  });

  // Adicionando o método toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'registrationNumber': registrationNumber,
      'birthDate': birthDate.toIso8601String(),
      'email': email,
      'imageUrl': imageUrl,
      'registrationDate': registrationDate.toIso8601String(),
      'permission': permission.name, // Convertendo o enum para String
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Construtor factory para criar uma instância a partir de um mapa
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      registrationNumber: json['registrationNumber'],
      birthDate: DateTime.parse(json['birthDate']),
      email: json['email'],
      imageUrl: json['imageUrl'],
      registrationDate: DateTime.parse(json['registrationDate']),
      isActive: json['isActive'],
      createdAt: DateTime.parse(json['createdAt']),
      // buscar um valor unico (firsWhere) para enum que tenha valor igual
      // ao que tá passando no json. Se não achar nada retorna user comum
      permission: AuthPermissionsEnum.values.firstWhere(
        (e) => e.name == json['permission'],
        orElse: () => AuthPermissionsEnum.user,
      ),
    );
  }
}
