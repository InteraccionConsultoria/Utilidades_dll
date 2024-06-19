import 'package:dio/dio.dart';

import 'package:flutter_utilidades/models/models.dart';

class ConexionesApi {
  static Future<RespuestaApi> validarModoPruebas(
      String stHost, String stNombreApp) async {
    try {
      var dio = Dio();
      // String stHost = await share.read(Globales.stPrefHost);
      // String stCodigo = await share.read(Globales.stPrefCodEmpresa);

      // String url = '$stHost/api/ConfiguracionApp/${Globales.stNombreApp}/NA';
      String url = '$stHost$stNombreApp/NA';
      var response = await dio.get(url);

      if (response.statusCode == 200 && response.data['isSuccess']) {
        // Si la respuesta es exitosa

        // Convierte la respuesta en un mapa
        Map<String, dynamic> data = response.data;
        bool boPrueba = true;

        if (data['result'] == null) {
          String stRespuesta = 'No existen registros, con $stNombreApp';

          return RespuestaApi(
              isSuccess: false,
              result: [false],
              displayMessage: stRespuesta,
              errorMessage: stRespuesta,
              token: '');
        }

        String stRespuesta = 'Exito';

        return RespuestaApi(
            isSuccess: response.data['isSuccess'],
            result: [data["result"][0]["estatusApp"]],
            //response.data['result'],
            displayMessage: stRespuesta,
            errorMessage: stRespuesta,
            token: response.data['token']);

        // return data["result"][0]["estatusApp"];
      } else {
        //TODO mensaje de error
        String stRespuesta = 'No existen registros, con $stNombreApp';

        return RespuestaApi(
            isSuccess: false,
            result: [false],
            displayMessage: stRespuesta,
            errorMessage: stRespuesta,
            token: '');
      }
    } catch (error) {
      //TODO mensaje de error
      String stRespuesta = 'No existen registros, con $stNombreApp';

      return RespuestaApi(
          isSuccess: false,
          result: [false],
          displayMessage: stRespuesta,
          errorMessage: stRespuesta,
          token: '');
    }
  }

  static Future<RespuestaApi> obtenerDatosDio(String stHost) async {
    try {
      RespuestaApi resp;
      var dio = Dio();
      // Map<String, dynamic> stResp = {'Error': 'Ocurrio un error'};

      String url = stHost;
      var response = await dio.get(url);

      if (response.statusCode == 200 && response.data['isSuccess']) {
        // Si la respuesta es exitosa

        // Convierte la respuesta en un mapa
        Map<String, dynamic> data = response.data;

        if (data['result'] == null) {
          resp = RespuestaApi(
              isSuccess: false,
              result: [],
              displayMessage:
                  'Error al obtener registros de usuarios No existen registros sincronizados para los usuarios ',
              errorMessage:
                  'Error al obtener registros de usuarios No existen registros sincronizados para los usuarios ',
              token: '');

          return resp;
        }

        var dato = RespuestaApi.fromJson(data);

        return dato;
      } else {
        return resp = RespuestaApi(
            isSuccess: false,
            result: [],
            displayMessage: response.data[0],
            errorMessage: response.data[0],
            token: '');
      }
    } catch (error) {
      return RespuestaApi(
          isSuccess: false,
          result: [],
          displayMessage: error.toString(),
          errorMessage: error.toString(),
          token: '');
    }
  }

  static Future<RespuestaApi> validarServidor(String stHost) async {
    try {
      var dio = Dio();
      // dio.options.connectTimeout = const Duration(
      //     seconds: 10); // Establecer tiempo de espera en milisegundos
      // dio.options.receiveTimeout = const Duration(
      //     seconds: 10); // Establecer tiempo de espera en milisegundos
      String url = stHost;

      var response = await dio.get(url);

      if (response.statusCode == 200 && response.data['isSuccess']) {
        // Si la respuesta es exitosa

        String stRespuesta = response.data['displayMessage'];

        return RespuestaApi(
            isSuccess: true,
            result: [true],
            displayMessage: stRespuesta,
            errorMessage: stRespuesta,
            token: '');
      } else {
        // Si la respuesta no es exitosa
        String stRespuesta = response.data['errorMessage'];

        return RespuestaApi(
            isSuccess: false,
            result: [false],
            displayMessage: stRespuesta,
            errorMessage: stRespuesta,
            token: '');
      }
    } catch (error) {
      // Capturar errores de conexión
      String stRespuesta = error.toString();

      return RespuestaApi(
          isSuccess: false,
          result: [false],
          displayMessage: stRespuesta,
          errorMessage: stRespuesta,
          token: '');
    }
  }

  //todo validar dispositivo
  static Future<RespuestaApi> validarDispositivo(
      String stHost, String stDispositivo) async {
    try {
      var dio = Dio();

      // stDispositivo = Utilidades.encriptarMD5(stDispositivo);

      // dio.options.connectTimeout = const Duration(
      //     seconds: 10); // Establecer tiempo de espera en milisegundos
      // dio.options.receiveTimeout = const Duration(
      //     seconds: 10); // Establecer tiempo de espera en milisegundos
      String url = '$stHost$stDispositivo';

      var response = await dio.get(url);

      if (response.statusCode == 200 && response.data['isSuccess']) {
        String stRespuesta = response.data['displayMessage'];

        return RespuestaApi(
            isSuccess: response.data['isSuccess'],
            result: response.data['result'],
            displayMessage: stRespuesta,
            errorMessage: stRespuesta,
            token: response.data['token']);
      } else {
        String stRespuesta = response.data[0];

        return RespuestaApi(
            isSuccess: false,
            result: [],
            displayMessage: response.data[0],
            errorMessage: response.data[0],
            token: '');
      }
    } catch (error) {
      // Capturar errores de conexión
      String stRespuesta = error.toString();

      return RespuestaApi(
          isSuccess: false,
          result: [],
          displayMessage: stRespuesta,
          errorMessage: stRespuesta,
          token: '');
    }
  }
}
