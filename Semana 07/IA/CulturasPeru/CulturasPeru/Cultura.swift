//
//  Cultura.swift
//  CulturasPeru
//
//  Created by oscarolano15@gmail.com on 13/10/26.
//

import UIKit

struct Elemento {
    let titulo: String
    let descripcion: String
    let imagen: String
}

struct Cultura {
    let nombre: String
    let region: String
    let descripcion: String
    let imagen: String
    let elementos: [Elemento]
}

func imagenElemento(_ nombre: String) -> UIImage? {
    return UIImage(named: nombre) ?? UIImage(systemName: nombre)
}

let culturasPeruanas: [Cultura] = [
    Cultura(
        nombre: "Cultura Nazca",
        region: "Ica",
        descripcion: "Civilizacion preincaica (100 a.C. - 800 d.C.) famosa por las Lineas de Nazca, enormes geoglifos trazados en el desierto que solo se aprecian completos desde el aire.",
        imagen: "nazca",
        elementos: [
            Elemento(titulo: "Lineas de Nazca",
                     descripcion: "Geoglifos de figuras de animales, plantas y lineas rectas trazados en la pampa desertica. Por su tamano solo se aprecian completos desde el aire. Son Patrimonio de la Humanidad desde 1994.",
                     imagen: "nazca"),
            Elemento(titulo: "Acueductos de Cantalloc",
                     descripcion: "Canales subterraneos (puquios) construidos para llevar agua del subsuelo a los campos de cultivo en pleno desierto. Algunos siguen funcionando hasta hoy.",
                     imagen: "acueductos"),
            Elemento(titulo: "Ceramica policroma",
                     descripcion: "Vasijas pintadas con muchos colores antes de la coccion, decoradas con animales, plantas y seres miticos. Es una de las ceramicas mas coloridas del Peru antiguo.",
                     imagen: "ceramicanazca")
        ]
    ),
    Cultura(
        nombre: "Cultura Moche",
        region: "La Libertad",
        descripcion: "Se desarrollo en la costa norte del Peru (100-800 d.C.). Destaco por su ceramica realista, en especial los huacos retrato, y por construcciones como las Huacas del Sol y de la Luna.",
        imagen: "moche",
        elementos: [
            Elemento(titulo: "Huacos retrato",
                     descripcion: "Vasijas de ceramica que representan rostros humanos con gran realismo: expresiones, tocados y rasgos de personas de la epoca.",
                     imagen: "moche"),
            Elemento(titulo: "Huacas del Sol y de la Luna",
                     descripcion: "Grandes templos de adobe ubicados cerca de Trujillo. La Huaca de la Luna conserva murales de colores con figuras de divinidades.",
                     imagen: "huacaluna"),
            Elemento(titulo: "Senor de Sipan",
                     descripcion: "Gobernante moche cuya tumba fue descubierta en 1987 en Lambayeque, con joyas de oro, plata y piedras preciosas. Es uno de los hallazgos mas importantes de America.",
                     imagen: "sipan")
        ]
    ),
    Cultura(
        nombre: "Cultura Chavin",
        region: "Ancash",
        descripcion: "Considerada la cultura matriz del area andina (1200-200 a.C.). Su centro ceremonial, Chavin de Huantar, integra galerias subterraneas y esculturas liticas como el Lanzon Monolitico.",
        imagen: "chavin",
        elementos: [
            Elemento(titulo: "Chavin de Huantar",
                     descripcion: "Centro ceremonial de piedra con plazas, templos y galerias subterraneas. Fue un lugar de peregrinacion para pueblos de distintas regiones.",
                     imagen: "chavin"),
            Elemento(titulo: "Lanzon Monolitico",
                     descripcion: "Escultura de piedra de unos 4.5 metros que representa a la divinidad principal. Se encuentra en el cruce de galerias del templo antiguo.",
                     imagen: "lanzon"),
            Elemento(titulo: "Cabezas clavas",
                     descripcion: "Cabezas talladas en piedra que se encajaban en los muros exteriores del templo. Muestran rostros que pasan de humano a felino.",
                     imagen: "cabezaclava")
        ]
    ),
    Cultura(
        nombre: "Cultura Paracas",
        region: "Ica",
        descripcion: "Se desarrollo en la peninsula de Paracas (800 a.C. - 100 d.C.). Reconocida por sus mantos funerarios de fino tejido y por practicar trepanaciones craneanas.",
        imagen: "paracas",
        elementos: [
            Elemento(titulo: "Mantos de Paracas",
                     descripcion: "Textiles bordados con lana y algodon de muchos colores que envolvian a los difuntos. Son considerados de los mejores tejidos del mundo antiguo.",
                     imagen: "paracas"),
            Elemento(titulo: "Trepanaciones craneanas",
                     descripcion: "Operaciones en el craneo realizadas con instrumentos de obsidiana. Muchos craneos muestran que los pacientes sobrevivieron.",
                     imagen: "trepanacion"),
            Elemento(titulo: "Necropolis de Wari Kayan",
                     descripcion: "Cementerio descubierto por Julio C. Tello en la decada de 1920, con cientos de fardos funerarios envueltos en mantos.",
                     imagen: "fardoparacas")
        ]
    ),
    Cultura(
        nombre: "Cultura Wari",
        region: "Ayacucho",
        descripcion: "Primer estado expansivo de los Andes centrales (600-1000 d.C.), con una red de caminos y centros administrativos que mas tarde heredaria el Imperio Inca.",
        imagen: "wari",
        elementos: [
            Elemento(titulo: "Fardos funerarios",
                     descripcion: "Los difuntos importantes se enterraban envueltos en varias capas de tela, a veces con una falsa cabeza o mascara en la parte superior.",
                     imagen: "wari"),
            Elemento(titulo: "Complejo arqueologico Wari",
                     descripcion: "Restos de la capital del estado Wari, cerca de Ayacucho, con recintos de piedra, plazas y galerias funerarias. Desde ahi se administraba un territorio que se extendia por buena parte de los Andes.",
                     imagen: "complejowari"),
            Elemento(titulo: "Pikillacta",
                     descripcion: "Centro administrativo cerca del Cusco, con cientos de recintos ordenados en bloques, usado para almacenar y controlar la region.",
                     imagen: "pikillacta")
        ]
    ),
    Cultura(
        nombre: "Imperio Inca",
        region: "Cusco",
        descripcion: "El mayor imperio prehispanico de America (1438-1532), con su capital en Cusco. Machu Picchu, su obra mas conocida, es Patrimonio de la Humanidad desde 1983.",
        imagen: "machupicchu",
        elementos: [
            Elemento(titulo: "Machu Picchu",
                     descripcion: "Ciudadela construida en el siglo XV entre montanas, con templos, terrazas de cultivo y viviendas de piedra. Es Patrimonio de la Humanidad desde 1983.",
                     imagen: "machupicchu"),
            Elemento(titulo: "Qhapaq Nan",
                     descripcion: "Red de caminos de miles de kilometros que unia todo el imperio, desde Colombia hasta Chile y Argentina. Es Patrimonio de la Humanidad desde 2014.",
                     imagen: "qhapaqnan"),
            Elemento(titulo: "Quipus",
                     descripcion: "Cordones de colores con nudos que servian para registrar cantidades, como censos, tributos y productos almacenados.",
                     imagen: "quipu")
        ]
    )
]
