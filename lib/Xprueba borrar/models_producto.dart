
import 'dart:convert';

class PocketbaseModel {
    PocketbaseModel({
       required this.items,
    });

    List<Item> items;

    factory PocketbaseModel.fromJson(String str) => PocketbaseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PocketbaseModel.fromMap(Map<String, dynamic> json) => PocketbaseModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
    };
}

class Item {
    Item({
       required this.cantidadXPaquete,
       required this.categoria,
       required this.collectionId,
       required this.collectionName,
      required  this.created,
      required  this.entradas,
      required  this.estado,
      required  this.existencias,
      required  this.fabricante,
      required  this.fechaVencimiento,
       required this.id,
       required this.imagen,
       required this.precioPaquete,
       required this.precioUnidad,
      required  this.producto,
      required  this.salidas,
      required  this.unidMedida,
      required  this.updated,
    });

    int cantidadXPaquete;
    String categoria;
    String collectionId;
    String collectionName;
    DateTime created;
    int entradas;
    bool estado;
    int existencias;
    String fabricante;
    DateTime fechaVencimiento;
    String id;
    String imagen;
    int precioPaquete;
    int precioUnidad;
    String producto;
    int salidas;
    String unidMedida;
    DateTime updated;

    factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Item.fromMap(Map<String, dynamic> json) => Item(
        cantidadXPaquete: json["cantidad_x_paquete"],
        categoria: json["categoria"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        entradas: json["entradas"],
        estado: json["estado"],
        existencias: json["existencias"],
        fabricante: json["fabricante"],
        fechaVencimiento: DateTime.parse(json["fecha_vencimiento"]),
        id: json["id"],
        imagen: json["imagen"],
        precioPaquete: json["precio_paquete"],
        precioUnidad: json["precio_unidad"],
        producto: json["producto"],
        salidas: json["salidas"],
        unidMedida: json["unid_medida"],
        updated: DateTime.parse(json["updated"]),
    );

    Map<String, dynamic> toMap() => {
        "cantidad_x_paquete": cantidadXPaquete,
        "categoria": categoria,
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": created.toIso8601String(),
        "entradas": entradas,
        "estado": estado,
        "existencias": existencias,
        "fabricante": fabricante,
        "fecha_vencimiento": fechaVencimiento.toIso8601String(),
        "id": id,
        "imagen": imagen,
        "precio_paquete": precioPaquete,
        "precio_unidad": precioUnidad,
        "producto": producto,
        "salidas": salidas,
        "unid_medida": unidMedida,
        "updated": updated.toIso8601String(),
    };
}



// To parse this JSON data, do
// //{

//     "items": [
//         {
//             "cantidad_x_paquete": 6,
//             "categoria": "Aceites y Grasas",
//             "collectionId": "9msvhdkn83ed10j",
//             "collectionName": "productos_huito",
//             "created": "2023-03-15 03:14:54.888Z",
//             "entradas": 10,
//             "estado": true,
//             "existencias": 10,
//             "fabricante": "Friol",
//             "fecha_vencimiento": "2023-03-31 12:00:00.000Z",
//             "id": "48cqhun8e7uv06u",
//             "imagen": "https://www.adslzone.net/app/uploads-adslzone.net/2019/04/borrar-fondo-imagen.jpg",
//             "precio_paquete": 78,
//             "precio_unidad": 13,
//             "producto": "Aceites",
//             "salidas": 1,
//             "unid_medida": "1 litro",
//             "updated": "2023-03-16 05:27:17.450Z"
//         }
//     ]
// }
//     final pocketbaseModel = pocketbaseModelFromJson(jsonString);
