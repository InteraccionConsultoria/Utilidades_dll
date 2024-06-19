import 'package:example/models/usuarios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_utilidades/flutter_utilidades.dart';
import 'package:flutter_utilidades/models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('utilidades'),
        ),
        body: Column(
          children: [
            Text('datos'),
            ElevatedButton(
                onPressed: () async {
                  // Utilidades.guardarLocal()

                  RespuestaApi res2 = await ConexionesApi.validarModoPruebas(
                      'http://192.168.100.21/servicio_movil/api/ConfiguracionApp/',
                      'agroaplicaciones');

                  // RespuestaApi res2 = await ConexionesApi.validarDispositivo(
                  //     'http://192.168.100.21/servicio_movil/api/Dispositivo/',
                  //     'idDispositivoEncriptado');

                  // RespuestaApi resp = await ConexionesApi.validarServidor(
                  //     'http://192.168.100.21/servicio_movil/api/Coneccion');

                  // RespuestaApi resp = await ConexionesApi.obtenerDatosDio(
                  //     'http://192.168.100.21/servicio_movil/api/Usuario/');

                  List<Usuarios> lUsuarios = [];

                  // for (var i = 0; i < resp.result.length; i++) {
                  //   var userData = Usuarios.fromJson(resp.result[i]);
                  //   lUsuarios.add(userData);
                  // }

                  // print(resp.errorMessage);
                  // print(lUsuarios[0].codigo);
                  // print(lUsuarios.length);
                  print('fernando');
                },
                child: Text('Click'))
          ],
        ));
  }
}
