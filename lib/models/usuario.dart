import 'package:health_care/models/arquivo.dart';
import 'package:health_care/models/cronograma.dart';
import 'package:health_care/models/endereco.dart';
import 'package:health_care/models/reuniao.dart';
import 'package:health_care/models/vistoria.dart';

class Usuario {
  String? id;
  String email;
  String nome;
  String cpf;
  String celular;
  TipoUsuario tipoUsuario;
  String messageToken;
  List<Reuniao>? reunioes;
  List<Vistoria>? vistorias;
  List<Arquivo>? arquivos;

  Usuario({
    this.id,
    required this.email,
    required this.nome,
    required this.cpf,
    required this.celular,
    required this.tipoUsuario,
    required this.messageToken,
    this.reunioes,
    this.vistorias,
    this.arquivos,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'nome': nome,
      'cpf': cpf,
      'celular': celular,
      'tipoUsuario': tipoUsuario.toString().split('.').last,
      'messageToken': messageToken,
      'reunioes': reunioes?.map((reuniao) => reuniao.toJson()).toList(),
      'vistorias': vistorias?.map((vistoria) => vistoria.toJson()).toList(),
      'arquivos': arquivos?.map((arquivo) => arquivo.toJson()).toList(),
    };
  }

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      email: json['email'],
      nome: json['nome'],
      cpf: json['cpf'],
      celular: json['celular'],
      tipoUsuario: json['tipoUsuario'] == 'Administrador'
          ? TipoUsuario.Administrador
          : TipoUsuario.Cliente,
      messageToken: json['messageToken'],
      reunioes: json['reunioes'] != null
          ? (json['reunioes'] as List<dynamic>)
              .map((reuniao) => Reuniao.fromJson(reuniao))
              .toList()
          : null,
      vistorias: json['vistorias'] != null
          ? (json['vistorias'] as List<dynamic>)
              .map((vistoria) => Vistoria.fromJson(vistoria))
              .toList()
          : null,
      arquivos: json['arquivos'] != null
          ? (json['arquivos'] as List<dynamic>)
              .map((arquivo) => Arquivo.fromJson(arquivo))
              .toList()
          : null
    );
  }
}

enum TipoUsuario { Administrador, Cliente }
