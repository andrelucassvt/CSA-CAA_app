import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/modules/perfil/presenter/components/ajuda_page.dart';
import 'package:projeto_csa_app/app/modules/perfil/presenter/widgets/info_user_title_subtitle.dart';

class PacientePerfilPage extends StatefulWidget {
  const PacientePerfilPage({Key? key}) : super(key: key);

  @override
  _PacientePerfilPageState createState() => _PacientePerfilPageState();
}

class _PacientePerfilPageState extends State<PacientePerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: CircleAvatar(
                  radius: 70,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const InfoUserTitleSubTitleWidget(
                title: 'Nome:', 
                subtitle: 'André Lucas Barbosa Salvador',
              ),
              const InfoUserTitleSubTitleWidget(
                title: 'Responsável:', 
                subtitle: 'Tatiane Almeida Barbosa',
              ),
              const InfoUserTitleSubTitleWidget(
                title: 'Médico:', 
                subtitle: 'Dr Hans Chucrute',
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () => showDialog(
                    context: context, 
                    builder: (context) => SimpleDialog(
                      title: const Text('Atenção'),
                      titlePadding: const EdgeInsets.only(
                        left: 20,
                        top: 20,
                      ),
                      contentPadding: const EdgeInsets.only(
                        left: 20,
                        top: 10
                      ),
                      children: [
                        const Text('Deseja fechar sua sessão ?'),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(), 
                                child: const Text('Não'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false), 
                                child: const Text(
                                  'Sim',
                                  style: TextStyle(
                                    color: Colors.red
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ),
                  child: const Text(
                    'Sair',
                    style: TextStyle(
                      color: Colors.red
                    ),
                  )
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () => showModalBottomSheet(
                    context: context, 
                    builder: (context) => const AjudaPage()
                  ), 
                  child: const Text('Precisa de ajuda ?')
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
