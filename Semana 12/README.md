# Semana 12: Ventas (Grupo A · UIKit + Core Data)

Trabajo de la semana del laboratorio 11, caso Ventas: una tienda registra productos, clientes y ventas. Tiene inicio de sesión, registro y dos roles (Vendedor y Supervisor), y un `UITabBarController` cuyas pestañas dependen del rol.

| Archivo o carpeta | Contenido |
|---|---|
| `EXPEDIENTE.md` | Modelo de datos, permisos por rol, reglas con ejemplos, pantallas, casos de prueba y plan de commits |
| `PROMPTS.md` | Consultas a la IA con el formato Contexto, Tarea, Restricciones, Formato esperado y qué se hizo con la respuesta |
| `Ventas/` | Proyecto de Xcode (Interface: Storyboard, Storage: Core Data) |

## Modelo de datos

| Entidad | Atributos | Relaciones |
|---|---|---|
| Usuario | nombre, usuario, clave, rol | ventas → Venta (Deny) |
| Producto | nombre, categoria, precio, stock | ventas → Venta (Deny) |
| Cliente | nombre, documento | ventas → Venta (Deny) |
| Venta | fecha, cantidad, precioUnitario, descuento, igv, total, anulada, motivoAnulacion | vendedor → Usuario, producto → Producto, cliente → Cliente |

## Pantallas (Main.storyboard)

Todas las pantallas, sus constraints y las conexiones están en `Main.storyboard`: Navigation Controller → Login → Crear cuenta, y la segue `entrar` hacia el Tab Bar Controller con sus siete pestañas. `PrincipalTabBarController` deja solo las cinco del rol.

| Pant. | Archivo | Qué hace |
|---|---|---|
| A1 | `LoginViewController.swift` | Usuario y clave; mensaje genérico "Usuario o clave incorrectos" |
| A2 | `RegistroViewController.swift` | Nombre, usuario único (sin distinguir mayúsculas), clave de mínimo 6 con confirmación y rol; entra directo a la app |
| A3 | `ProductosViewController.swift` | Búsqueda, chips de categoría (predicate), stock en color; el supervisor crea, edita y borra |
| A4 | `ClientesViewController.swift` | Iniciales, documento, total comprado y categoría calculada (Regular, Frecuente o VIP) |
| A5 | `NuevaVentaViewController.swift` | Vendedor de la sesión, cliente, producto, cantidad con stepper y resumen con descuento e IGV |
| A6 | `MisVentasViewController.swift` | Indicadores de hoy y del mes, Todas / Hoy / Mes y búsqueda por cliente; solo las ventas propias |
| A7 | `VentasEquipoViewController.swift` | Todas las ventas, chips por vendedor y deslizar para anular |
| A8 | `VentasEquipoViewController.swift` | Alerta de anulación con motivo obligatorio; devuelve el stock |
| A9 | `ResumenViewController.swift` | Vendido hoy contra ayer, IGV del mes, gráfico de 7 días, ranking de vendedores y stock bajo |
| — | `CuentaViewController.swift` | Nombre, usuario, rol y Cerrar sesión |

Además, `Datos.swift` reúne el contexto de Core Data, los cálculos y los datos de ejemplo, y `Sesion.swift` guarda el usuario conectado.

## Datos de ejemplo

La primera vez que se abre, la app carga productos, clientes, dos vendedores y tres ventas anteriores, para que los casos de prueba tengan datos:

| Productos | Clientes | Vendedores |
|---|---|---|
| Laptop Pro 14 · S/ 200.00 · stock 40 | Comercial Andina SAC · VIP (S/ 5,310.00) | Carlos Ruiz · usuario `cruiz` |
| Monitor 24" · S/ 450.00 · stock 8 | María Quispe · Frecuente (S/ 1,062.00) | Ana Díaz · usuario `adiaz` |
| Mouse inalámbrico · S/ 35.00 · stock 120 | Tienda Sol EIRL · Regular (S/ 153.28) | |
| Teclado mecánico · S/ 129.90 · stock 4 | Luis Rojas · Regular (S/ 0.00) | |

Los dos vendedores de ejemplo usan la clave de prueba `123456`. El supervisor se crea desde la pantalla Crear cuenta (caso 1).

## Cómo ejecutarla

1. Abrir `Ventas/Ventas.xcodeproj` en Xcode.
2. Elegir un simulador de iPhone y presionar **Cmd + R**.
3. Crear la cuenta del supervisor o entrar con un vendedor de ejemplo.
4. Para ver el ícono y el nombre "Ventas": detener la app y pulsar **Shift + Cmd + H** en el simulador.

## Capturas

Pendientes.
