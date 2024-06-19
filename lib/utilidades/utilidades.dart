import 'package:intl/intl.dart';

class Utilidades {
  //todo encriptación

  static String boValidarTexto(String stTexto, int inMax, String stNombre) {
    if (stTexto != '' || stTexto.isEmpty) {
      if (!RegExp(r"[a-z A-Z 0-9]").hasMatch(stTexto)) {
        return 'El campo $stNombre contiene caracteres incorrectos o está vacío el campo';
        //"Este no es un email";
      }
    }

    if (stTexto.length > inMax) {
      return 'Solo se permiten $inMax caracteres en el campo $stNombre';
    }

    return '';
  }

  static String textoMayMin(String text) {
    List<String> words = text.split(' ');
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] =
            words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
      }
    }
    return words.join(' ');
  }

  //todo validar fechas
  static bool validarRangoFechas(DateTime fechaInicio, DateTime fechaFin) {
    // Obtener las fechas sin la hora
    DateTime fechaInicioSinHora =
        DateTime(fechaInicio.year, fechaInicio.month, fechaInicio.day);
    DateTime fechaFinSinHora =
        DateTime(fechaFin.year, fechaFin.month, fechaFin.day);

    // Comparar las fechas sin la hora
    if (fechaFinSinHora.isBefore(fechaInicioSinHora)) {
      return false; // La fecha fin es anterior a la fecha de inicio
    }

    return true; // El rango de fechas es válido
  }

  static String formatoFecha(String dateString) {
    DateTime date = DateTime.parse(dateString);
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  static String formatoFechaSQL(String dateString) {
    DateTime date = DateTime.parse(dateString);
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  static String formatoFechaHora(String dateString) {
    DateTime date = DateTime.parse(dateString);
    DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm a');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  static String formatoFechaYear(String dateString) {
    DateTime date = DateTime.parse(dateString);
    DateFormat formatter = DateFormat('yyyy');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  static String formatoNumero(double doNumero) {
    NumberFormat format = NumberFormat('#,###.####');
    String result = format.format(doNumero);

    return result;
  }

  static String formatoNumero2(double doNumero) {
    NumberFormat format = NumberFormat('#,###.##');
    String result = format.format(doNumero);

    return result;
  }

  static String formatoNumeroEntero(double doNumero) {
    NumberFormat format = NumberFormat('#,###');
    String result = format.format(doNumero);

    return result;
  }
}
