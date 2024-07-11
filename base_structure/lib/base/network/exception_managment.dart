import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

// TODO: TBD response.data structure
extension ExceptionsManagment on GraphQLError {
  void exceptionManager() {
    switch (code) {
      case '500':
        Get.snackbar('Attenzione', "Errore generico, contattare l'assistenza");
        break;
      case '400':
        if (message != "") {
          switch (message) {
            case 'Invalid user credentials':
              Get.snackbar('Attenzione', "username e/o password errati");
              break;
            case 'No refresh token':
              Get.snackbar('Attenzione', "Sessione scaduta effettuare il login!");
              //Get.offAllNamed(Routes.login);
              break;
            default:
              Get.snackbar(
                  'Attenzione', "Errore generico, contattare l'assistenza");
          }
        } else {
          Get.snackbar(
              'Attenzione', "Errore generico, contattare l'assistenza");
        }
        break;
      case '401':
        if (message != "") {
          switch (message) {
            case 'Invalid user credentials':
              Get.snackbar('Attenzione', "username e/o password errati");
              break;
            case 'Token is not active':
              Get.snackbar('Attenzione', "Sessione scaduta effettuare il login!");
              //Get.offAllNamed(Routes.login);
              break;
            default:
          }
        }
    }
  }
}
