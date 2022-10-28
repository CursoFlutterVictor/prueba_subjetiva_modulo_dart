import 'package:prueba_subjetiva_modulo_dart/models/character_list_model.dart';
import 'package:prueba_subjetiva_modulo_dart/services/rickandmortyapi_service.dart';

Future<void> main(List<String> args) async {
  CharacterList? charList = await RickAndmortyApiService.getCharacters();

  // Imprimo el nombre del primer personaje
  print("\nNombre del primer personaje:");
  print(charList?.results!.first.name);

  print("\nLista completa de nombres:");

  charList!.results?.forEach((element) {
    print(element.name);
  });
}
