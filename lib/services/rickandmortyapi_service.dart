import 'dart:convert';
import 'package:prueba_subjetiva_modulo_dart/models/character_list_model.dart';
import 'package:http/http.dart' as http;

class RickAndmortyApiService {
  static Future<CharacterList?> getCharacters() async {
    Uri url;

    url = Uri.parse("https://rickandmortyapi.com/api/character");

    //print(url);

    try {
      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);

      if (response.statusCode == 200) {
        //print(response.body);

        // IMPRIMO LOS RESULTS (SIN LA PARTE DE CABECERA DEL JSON)
        final bodyDecoded = jsonDecode(response.body);
        print("Parte de \"Results\" del JSON:\n");
        print(bodyDecoded["results"]);

        // CONVIERTO EL JSON AL MODELO
        final charList = CharacterList.fromJson(bodyDecoded);

        return charList;
      }
    } catch (error) {
      print(error);
    }

    return null;
  }
}
