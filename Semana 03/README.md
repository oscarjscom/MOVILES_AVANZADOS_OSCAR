<div align="center">

# Semana 03 — Colecciones
**Laboratorio 03 · Arrays, Diccionarios y Sets**

[Volver al inicio](../README.md)

</div>

---

## Objetivos
- Crear y manipular **Arrays**, **Diccionarios** y **Sets**.
- Combinar colecciones con condicionales y bucles.
- Leer datos del usuario con `readLine()` y construir un carrito de compras 2.0.

## Contenido
| Carpeta | Tipo | Descripción |
|---|---|---|
| [`Manual/Lab03-Colecciones`](Manual/Lab03-Colecciones) | Manual | Ejercicios 1–5: arrays, diccionarios, sets, inventario y carrito 2.0 |
| [`IA/Lab03-Colecciones`](IA/Lab03-Colecciones) | IA | Ejercicio 6 (gestión de notas) y 7 (inventario con menú) + PROMPTS |
| [`IA/Lab03-MetroLima`](IA/Lab03-MetroLima) | IA | Trabajo adicional: consulta de estaciones del Metro de Lima |

## Requerimientos funcionales — Consulta del Metro de Lima

Sistema de consulta en consola sobre la Línea 1, la Línea 2 y el Metropolitano ([ver proyecto](IA/Lab03-MetroLima)).

| # | Requerimiento |
|---|---|
| RF01 | Buscar una estación por nombre y mostrar en qué línea(s) está. |
| RF02 | Listar todas las estaciones de una línea dada (ej. "estaciones de la Línea 2"). |
| RF03 | Indicar si una estación es intermodal (conecta con otra línea o con el Metropolitano) y con cuál. |
| RF04 | Indicar si una estación cuenta con ascensores (accesibilidad). |
| RF05 | Buscar por destino de interés (ej. "Estadio Nacional del Peru", "Museo de la Nacion", "Emporio Comercial Gamarra", "Campo de Marte", "Real Plaza Atocongo") y sugerir la estación/sistema más cercano. |
| RF06 | Manejar el caso de una estación que no existe, con mensaje de error claro. |
| RF07 | Mostrar un menú de opciones: buscar estación, listar por línea, buscar por destino, salir. |
| RF08 | Sugerir una ruta entre dos estaciones: directa si comparten línea, con trasbordo si hay una estación intermodal que las conecte, o mensaje de "sin ruta conocida" si no hay conexión registrada entre los sistemas. |
| RF09 | Consultar el saldo actual de la tarjeta de transporte. |
| RF10 | Recargar saldo a la tarjeta, validando que el monto sea mayor a 0. |
| RF11 | Cobrar el pasaje (tarifa fija) si hay saldo suficiente; mostrar error si no. |
| RF12 | Modo administrador: agregar una estación nueva a una línea (existente o nueva). |
| RF13 | Modo administrador: crear una línea nueva vacía, sin estaciones todavía. |
| RF14 | Modo administrador: listar todas las líneas/sistemas registrados. |
| RF15 | Mostrar lugares/puntos de interés cercanos a una estación dada (si hay datos registrados). |
| RF16 | Listar todas las estaciones disponibles (para no tener que memorizarlas al buscar). |

## Salida — Ejercicio 5: Carrito de compras 2.0
```text
=============================================
        TICKET DE COMPRA 2.0
  Cliente: María García (VIP)
=============================================
Laptop x1   S/. 3500.0
Mouse x2   S/. 91.0
=============================================
Subtotal:           S/. 3591.0
Descuento (10.0%): -S/. 359.10
IGV (18%):          S/. 581.74
=============================================
TOTAL:              S/. 3813.64
=============================================
¡Gracias por su compra, María García!
```

## Salida — Ejercicio 6: Gestión de notas (IA)
```text
===== REPORTE POR ALUMNO =====
Luis: [12.0, 14.0, 10.0] → Promedio 12.00 (Desaprobado)
María: [15.0, 16.0, 14.0] → Promedio 15.00 (Bueno)
Ana: [18.0, 19.0, 17.0] → Promedio 18.00 (Excelente)

===== RANKING (mayor a menor) =====
1. Ana - 18.00
2. María - 15.00
3. Luis - 12.00

===== ESTADÍSTICAS =====
Promedio general: 15.00
Nota más alta: 19.0
Nota más baja: 10.0
Aprobados: 2 de 3 (66.7%)
```

### Cómo ejecutarlo
- **Playground:** abrir el `.playground` en Xcode y presionar .
- **Ejercicios con `readLine()`:** en Playground la entrada no funciona; ejecutarlos en Terminal con `swift Contents.swift` dentro de la carpeta del `.playground`.
