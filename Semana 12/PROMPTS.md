# PROMPTS

Consultas hechas a la IA durante el trabajo, después de terminar el expediente.

## Consulta 1: construir la app a partir del expediente

| Campo | Contenido |
|---|---|
| Contexto | Trabajo de la semana 11, Grupo A, caso Ventas. App iOS con UIKit, Storyboard y Core Data. El modelo, los permisos, las reglas y los casos de prueba están en `EXPEDIENTE.md` |
| Tarea | Construir las 9 pantallas de la maqueta (A1 a A9) y la pestaña Cuenta, con login, registro, sesión y pestañas por rol |
| Restricciones | Todas las pantallas, segues y constraints visibles en `Main.storyboard`; las cuatro entidades en el editor `.xcdatamodeld` con delete rule Deny; montos redondeados a 2 decimales; sin comentarios explicativos en el código; un commit por pantalla |
| Formato esperado | Proyecto de Xcode listo para abrir y los archivos `.swift` de cada pantalla |
| Qué se hizo con la respuesta | Se aceptó. Los cálculos se revisaron contra la sección 4 del expediente y los casos 4, 5 y 8 (424.80, 123.90 y la devolución de stock). Se modificaron los datos de ejemplo para que existiera un cliente VIP, como pide el caso 4 |
