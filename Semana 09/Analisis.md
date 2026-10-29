# Análisis: Boleta de pago, del sueldo al neto

## Control cruzado: app frente a Excel

Los 6 casos dan el mismo neto en la app y en el Excel, al centavo.

| Caso | Datos | Neto en la app | Neto en el Excel | Neto del documento |
|---|---|---|---|---|
| 1 | S/ 2,500 · 30 días · sin hijos · ONP | 2,175.00 | 2,175.00 | 2,175.00 |
| 2 | S/ 1,800 · 27 días · con hijos · ONP | 1,516.41 | 1,516.41 | 1,516.41 |
| 3 | S/ 3,000 · 30 días · con hijos · AFP Ejemplo · 4 h al 25% · 4 h al 35% · adelanto S/ 200 | 2,631.73 | 2,631.73 | 2,631.73 |
| 4 | S/ 4,200 · 24 días · con hijos · AFP Ejemplo · 2 h al 25% · 2 h al 35% · adelanto S/ 100 | 3,011.17 | 3,011.17 | Lo revisa el docente |
| Propio 1 | S/ 2,500 · 30 días · sin hijos · AFP Habitat | 2,179.00 | 2,179.00 | — |
| Propio 2 | S/ 4,000 · 30 días · sin hijos · ONP | 3,480.00 | 3,480.00 | — |

En los casos propios solo el sueldo es real. Los días, los hijos y el sistema de pensiones son ficticios, como pide el enunciado.

## Respuestas a las preguntas

**1. ONP o AFP.** Con los datos del caso 3:

| | ONP | AFP Ejemplo |
|---|---|---|
| Pensión descontada | 422.89 (13%) | 421.27 (fondo 325.30 + comisión 52.05 + seguro 43.92) |
| Adelanto | 200.00 | 200.00 |
| Neto a pagar | 2,630.11 | 2,631.73 |

Este mes la AFP deja S/ 1.62 más. Pero no basta comparar porcentajes (13% contra 12.95%), porque no son el mismo tipo de descuento:
- En la AFP, el fondo (10%) se ahorra en la cuenta personal del trabajador. Solo la comisión y el seguro son un costo.
- En la ONP, el 13% va a un fondo común del Estado, y la pensión depende de las reglas de la ONP, no de lo ahorrado.
- La comisión cambia según la AFP y se actualiza: hay que revisarla en la SBS.

Para decidir hay que comparar la pensión que se espera recibir en el futuro, no solo el neto de este mes.

**2. Costo real para la empresa.** En el caso 3, el trabajador le cuesta al empleador S/ 3,545.77: S/ 3,253.00 de remuneraciones más S/ 292.77 de EsSalud. Al trabajador le llega como neto S/ 2,631.73, que es el **74.22%** de ese costo.

**3. Días laborados.** Con los datos del caso 2, si hubiera trabajado los 30 días:

| | 27 días | 30 días | Diferencia |
|---|---|---|---|
| Total remuneraciones | 1,743.00 | 1,923.00 | 180.00 |
| ONP | 226.59 | 249.99 | 23.40 |
| Neto a pagar | 1,516.41 | 1,673.01 | 156.60 |

La diferencia en el neto (S/ 156.60) es menor que la del bruto (S/ 180.00) porque esos S/ 180 adicionales también pagan ONP. El 13% (S/ 23.40) se va a la pensión y al trabajador le llega el 87%. Además, la asignación familiar no cambia, porque no depende de los días.

**4. Horas extras.** En el caso 3, las horas extras suman S/ 130.00 (62.50 al 25% y 67.50 al 35%). Eso es el **4.00%** del total de remuneraciones (S/ 3,253.00).

**5. Con datos reales.** Cada participante tomó un sueldo de una convocatoria real:

| | Participante 1 | Participante 2 |
|---|---|---|
| Puesto | Asistente de Programación, SUNARP (CAS N° 061) | Analista de Sistemas, SUNARP (CAS N° 061) |
| Sueldo bruto | 2,500.00 | 4,000.00 |
| Sistema (ficticio) | AFP Habitat | ONP |
| Total descuentos | 321.00 | 520.00 |
| Neto a pagar | 2,179.00 | 3,480.00 |
| % del bruto que llega | **87.16%** | **87.00%** |

Los dos porcentajes son casi iguales aunque un sueldo es 60% más alto. Sin hijos, horas extras ni adelantos, el único descuento es la pensión, que es un porcentaje fijo del sueldo: Habitat descuenta 12.84% (10% + 1.47% + 1.37%) y la ONP 13%. Por eso el porcentaje que llega no depende de cuánto se gana, sino del sistema de pensiones. La comparación con compañeros de otros grupos se completa en clase.

## Tabla de fuentes

| Dato | Valor | Fuente | Fecha de consulta |
|---|---|---|---|
| RMV | S/ 1,230.00 | D.S. N° 015-2026-TR, publicado en [El Peruano](https://elperuano.pe/noticia/305642-remuneracion-minima-vital-subira-a-1230-desde-el-1-de-octubre-y-la-segunda-alza-llegara-tras-el-nino) el 28/09/2026; vigente desde el 1 de octubre de 2026 | 29/10/2026 |
| Asignación familiar | 10% de la RMV = S/ 123.00 | Ley 25129 (valor del enunciado) | Enunciado |
| ONP | 13% | D.L. 19990 (valor del enunciado) | Enunciado |
| EsSalud | 9% | Ley 26790 (valor del enunciado) | Enunciado |
| Horas extras | 25% y 35% | Normas de jornada y sobretiempo (valor del enunciado) | Enunciado |
| AFP Ejemplo | Fondo 10% · comisión 1.60% · seguro 1.35% | Valores de prueba del enunciado | Enunciado |
| AFP reales (Habitat, Integra, Prima, Profuturo) | Fondo 10% · seguro 1.37% · comisión sobre flujo 1.47% / 1.55% / 1.60% / 1.69% | SBS, devengue octubre 2026, publicado por [Buk](https://www.buk.pe/blog/tasas-afp) el 12/10/2026. La página de la SBS no cargó, por eso se usó esta fuente secundaria | 29/10/2026 |
| Sueldo Propio 1 | S/ 2,500.00 | [Convocatoria SUNARP CAS N° 061, Asistente de Programación](https://www.convocatoriasdetrabajo.com/oportunidad-laboral-cas-061-asistente-programacion-sunarp-lima-635723.html). [Bases en gob.pe](https://www.gob.pe/institucion/sunarp/informes-publicaciones/8667351-proceso-cas-n-061-2025-sunarp-zona-registral-n-ix) | 29/10/2026 |
| Sueldo Propio 2 | S/ 4,000.00 | [Convocatoria SUNARP CAS N° 061, Analista de Sistemas](https://www.convocatoriasdetrabajo.com/oportunidad-laboral-cas-061-analista-sistemas-sunarp-lima-635724.html). [Bases en gob.pe](https://www.gob.pe/institucion/sunarp/informes-publicaciones/8667351-proceso-cas-n-061-2025-sunarp-zona-registral-n-ix) | 29/10/2026 |

La comisión de AFP usada es la comisión sobre flujo, que se descuenta del sueldo cada mes. A los afiliados con comisión sobre saldo no se les descuenta comisión en la boleta.
