import 'dart:io';

void main() {
  Mensaje mensajeSi = new Mensaje("Hola amigo", Fin());
  Mensaje mensajeNo = new Mensaje("Jodete", Fin());
  Opcion selecion = new Opcion(mensajeSi, mensajeNo);
  Mensaje nodoMensaje = new Mensaje("Hola...", selecion);
  Inicio nodoInicio = new Inicio(nodoMensaje);
  Padre hiloSaludo = new Padre(nodoInicio);

  hiloSaludo.inicializarhilo();
}

class Padre {
  String nombre = "Prueba 1";

  Inicio nodoInicial;

  Padre(this.nodoInicial) {}

  void inicializarhilo() {
    print("-------");
    nodoInicial.operar();
    print("--------");
  }
}

abstract class NodoBase {
  String id;

  void operar();
  void buscar();
}

class Inicio extends NodoBase {
  NodoBase siguiente;

  Inicio(this.siguiente) {
    this.id = "1";
  }

  void operar() {
    print("Iniciando Hilo...");
    siguiente.operar();
  }

  void buscar() {}
}

class Mensaje extends NodoBase {
  String mensaje;
  NodoBase siguiente;
  Mensaje(this.mensaje, this.siguiente) {}

  void operar() {
    print(this.mensaje);
    siguiente.operar();
  }

  void buscar() {}
}

class Opcion extends NodoBase {
  NodoBase opcionSi;
  NodoBase opcionNo;

  Opcion(this.opcionSi, this.opcionNo) {}

  void operar() {
    String opcion = "no";
    if (opcion == "si") {
      this.opcionSi.operar();
    } else {
      this.opcionNo.operar();
    }
  }

  void buscar() {}
}

class Fin extends NodoBase {
  Fin() {
    this.id = "fin";
  }

  void operar() {
    print("Finalizando Hilo...");
  }

  void buscar() {}
}
