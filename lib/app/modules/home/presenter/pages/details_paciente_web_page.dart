import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/shared/widget/info_user_title_subtitle.dart';

class DetailsPacienteWebPage extends StatefulWidget {
  const DetailsPacienteWebPage({
    Key? key,
  }) : super(key: key);

  @override
  _DetailsPacienteWebPageState createState() => _DetailsPacienteWebPageState();
}

class _DetailsPacienteWebPageState extends State<DetailsPacienteWebPage> {
  @override
  Widget build(BuildContext context) {
    //final args = ModalRoute.of(context)?.settings.arguments as Paciente;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Paciente',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  radius: 70,
                ),
                SizedBox(
                  height: 20,
                ),
                InfoUserTitleSubTitleWidget(
                  title: 'Nome:', 
                  subtitle: 'André Lucas Barbosa Salvador',
                ),
                InfoUserTitleSubTitleWidget(
                  title: 'Responsável:', 
                  subtitle: 'Tatiane Almeida Barbosa',
                ),
                InfoUserTitleSubTitleWidget(
                  title: 'Médico:', 
                  subtitle: 'Dr Hans Chucrute',
                ),
              ],
            ),
          ),
          const VerticalDivider()
        ],
      ),
    );
  }
}