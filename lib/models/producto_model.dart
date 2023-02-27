
import 'dart:convert';

class ProductoModel {
    ProductoModel({
        required this.productos,
    });

    List<Producto> productos;

    factory ProductoModel.fromJson(String str) => ProductoModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductoModel.fromMap(Map<String, dynamic> json) => ProductoModel(
        productos: List<Producto>.from(json["productos"].map((x) => Producto.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "productos": List<dynamic>.from(productos.map((x) => x.toMap())),
    };
}

class Producto {
    Producto({
        required this.fechaRegistro,
        required this.categoria,
        required this.descripcin,
        required this.fabricante,
        required this.cantdXPaq,
        required this.unidadDeMedida,
        required this.entradas,
        required this.salidas,
        required this.existencia,
        required this.precioUnidad,
        required this.precioPaquete,
        required this.fechaV,
        required this.status,
        required this.imagen,
        required this.comprar,
        required this.inversin,
        required this.proveedor,
        required this.id,
    });

    String fechaRegistro;
    String categoria;
    String descripcin;
    String fabricante;
    int cantdXPaq;
    String unidadDeMedida;
    int entradas;
    int salidas;
    int existencia;
    double precioUnidad;
    double precioPaquete;
    String fechaV;
    bool status;
    String imagen;
    int comprar;
    int inversin;
    String proveedor;
    int id;

    factory Producto.fromJson(String str) => Producto.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Producto.fromMap(Map<String, dynamic> json) => Producto(
        fechaRegistro: json["fechaRegistro"],
        categoria: json["categoria"],
        descripcin: json["descripción"],
        fabricante: json["fabricante"],
        cantdXPaq: json["cantdXPaq"],
        unidadDeMedida: json["unidadDeMedida"],
        entradas: json["entradas"],
        salidas: json["salidas"],
        existencia: json["existencia"],
        precioUnidad: json["precioUnidad"]?.toDouble(),
        precioPaquete: json["precioPaquete"]?.toDouble(),
        fechaV: json["fechaV"],
        status: json["status"],
        imagen: json["imagen"],
        comprar: json["comprar"],
        inversin: json["inversión"],
        proveedor: json["proveedor"] ?? 'No Proveedor',
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "fechaRegistro": fechaRegistro,
        "categoria": categoria,
        "descripción": descripcin,
        "fabricante": fabricante,
        "cantdXPaq": cantdXPaq,
        "unidadDeMedida": unidadDeMedida,
        "entradas": entradas,
        "salidas": salidas,
        "existencia": existencia,
        "precioUnidad": precioUnidad,
        "precioPaquete": precioPaquete,
        "fechaV": fechaV,
        "status": status,
        "imagen": imagen,
        "comprar": comprar,
        "inversión": inversin,
        "proveedor": proveedor,
        "id": id,
    };
    Producto copy() => Producto(
        fechaRegistro: fechaRegistro,
        categoria: categoria,
        descripcin: descripcin,
        fabricante: fabricante,
        cantdXPaq: cantdXPaq,
        unidadDeMedida: unidadDeMedida,
        entradas: entradas,
        salidas: salidas,
        existencia: existencia,
        precioUnidad: precioUnidad,
        precioPaquete: precioPaquete,
        fechaV: fechaV,
        status: status,
        imagen: imagen,
        comprar: comprar,
        inversin: inversin,
        proveedor: proveedor,
        id: id,
    );
}
