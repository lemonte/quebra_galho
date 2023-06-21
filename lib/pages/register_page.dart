import 'package:flutter/material.dart';
import 'package:quebra_galho/controllers/usuario_controller.dart';
import 'package:quebra_galho/models/usuario.dart';
import 'package:quebra_galho/pages/bottom_bar.dart';
import 'package:quebra_galho/shared/app_colors.dart';

class RegisterPage extends StatefulWidget {
  final Usuario usuario;
  const RegisterPage({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _nameController =
      TextEditingController(text: widget.usuario.nome);
  late final TextEditingController _phoneController =
      TextEditingController(text: widget.usuario.telefone);
  late final TextEditingController _cpfController =
      TextEditingController(text: widget.usuario.telefone);

  late final TextEditingController emailController =
      TextEditingController(text: widget.usuario.email);

  late final TextEditingController dataNascimento =
      TextEditingController(text: widget.usuario.dataNascimento);

  late final TextEditingController cep =
      TextEditingController(text: widget.usuario.cep);

  late final TextEditingController cidade =
      TextEditingController(text: widget.usuario.cidade);

  late final TextEditingController estado =
      TextEditingController(text: widget.usuario.estado);

  late final TextEditingController numero =
      TextEditingController(text: widget.usuario.numero);

  late final TextEditingController rua =
      TextEditingController(text: widget.usuario.rua);

  late final TextEditingController bairro =
      TextEditingController(text: widget.usuario.bairro);

  late final FocusNode _nameFocus = FocusNode();

  bool _userEdited = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            leading: Navigator.canPop(context)
                ? InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                  )
                : null,
            title: Text(
              widget.usuario == Usuario.empty ? 'Cadastre-se' : "Editar Perfil",
              style: const TextStyle(color: AppColors.primaryColorApp),
            ),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              UsuarioController.instance.usuario =
                  UsuarioController.instance.usuario.copyWith(
                bairro: bairro.text,
                cep: cep.text,
                cidade: cidade.text,
                cpf: _cpfController.text,
                dataNascimento: dataNascimento.text,
                email: emailController.text,
                estado: estado.text,
                nome: _nameController.text,
                numero: numero.text,
                rua: rua.text,
                telefone: _phoneController.text,
              );
              if (widget.usuario == Usuario.empty) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const BottomBarWidget(),
                ));
              } else {
                Navigator.pop(context);
              }
            },
            backgroundColor: AppColors.primaryColorApp,
            child: const Icon(Icons.save),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                const Icon(
                  Icons.account_circle,
                  color: AppColors.primaryColorApp,
                  size: 164,
                ),
                TextField(
                  controller: _nameController,
                  focusNode: _nameFocus,
                  decoration: const InputDecoration(labelText: "Nome: "),
                  onChanged: (text) {
                    _userEdited = true;
                    setState(() {
                      // user['name'] = text;
                    });
                  },
                ),
                TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: "Telefone: "),
                  onChanged: (text) {
                    _userEdited = true;
                    // user['phone'] = text;
                  },
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _cpfController,
                  decoration: const InputDecoration(labelText: "CPF: "),
                  onChanged: (text) {
                    _userEdited = true;
                    // user['cpf'] = text;
                  },
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: "Email: "),
                  onChanged: (text) {
                    _userEdited = true;
                    // user['cpf'] = text;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  controller: dataNascimento,
                  decoration:
                      const InputDecoration(labelText: "Data Nascimento: "),
                  onChanged: (text) {
                    _userEdited = true;
                    // user['cpf'] = text;
                  },
                  keyboardType: TextInputType.datetime,
                ),
                TextField(
                  controller: cep,
                  decoration: const InputDecoration(labelText: "CEP: "),
                  onChanged: (text) {
                    _userEdited = true;
                    // user['cpf'] = text;
                  },
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  controller: rua,
                  decoration: const InputDecoration(labelText: "Rua: "),
                  onChanged: (text) {
                    _userEdited = true;
                    // user['cpf'] = text;
                  },
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  controller: numero,
                  decoration: const InputDecoration(labelText: "Nº: "),
                  onChanged: (text) {
                    _userEdited = true;
                    // user['cpf'] = text;
                  },
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: bairro,
                  decoration: const InputDecoration(labelText: "Bairro: "),
                  onChanged: (text) {
                    _userEdited = true;
                    // user['cpf'] = text;
                  },
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  controller: cidade,
                  decoration: const InputDecoration(labelText: "Cidade: "),
                  onChanged: (text) {
                    _userEdited = true;
                    // user['cpf'] = text;
                  },
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  controller: estado,
                  decoration: const InputDecoration(labelText: "Estado: "),
                  onChanged: (text) {
                    _userEdited = true;
                    // user['cpf'] = text;
                  },
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 32,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _requestPop() {
    if (_userEdited) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Descartar Alterações?"),
              content: const Text("Se sair as alterações serão perdidas."),
              actions: <Widget>[
                TextButton(
                  child: const Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: const Text("Sim"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  void _error() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Erro"),
            content: const Text("Ocorreu um erro no salvamento dos dados"),
            actions: <Widget>[
              TextButton(
                child: const Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text("Tentar novamente"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}
