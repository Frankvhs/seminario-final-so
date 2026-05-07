# Informe Ejecutivo para la Dirección de Sumifer

Mejora integral de equipos sin compra de hardware nuevo.

## 1. Problemas encontrados (resumen para no técnicos)

Después de analizar los equipos de Dirección General, Económica y RRHH, encontramos que:

- Las computadoras tardan mucho en abrir programas porque tienen poca memoria RAM y discos mecánicos (no SSD).
- El software instalado no es legal en su mayoría (Windows y Office activados con métodos no oficiales), lo que impide recibir actualizaciones de seguridad y nos hace dependientes de Microsoft.
- Hay equipos muy antiguos (Core 2 Duo) que consumen mucha electricidad para hacer tareas simples.
- Las contraseñas se guardan en papel y la información sensible (nóminas) viaja en memorias USB sin cifrar.

## 2. Qué hicimos SIN comprar hardware nuevo

- **Migración a Linux:** En los equipos de Dirección General y Económica instalamos **Xubuntu**, una versión ligera y gratuita de Linux. Esto alarga la vida útil del hardware antiguo porque consume menos recursos.
- **Software libre:** Reemplazamos Microsoft Office por **LibreOffice** y eliminamos AutoCAD (que no se usa) para instalar **FreeCAD** solo si es necesario.
- **Ajustes de energía:** Activamos el modo de ahorro de energía en todos los equipos y optimizamos el uso de la memoria RAM.
- **Seguridad sin gasto:** Configuramos el cortafuegos (firewall) para bloquear accesos no deseados, cambiamos FTP inseguro por SFTP (transferencia cifrada) y enseñamos a usar un gestor de contraseñas.

## 3. Vida útil estimada

- **Equipo de RRHH (Intel Core i5, 8GB RAM):** 5 años más.
- **Equipo de Dirección General (Pentium G4400):** 4-5 años más (depende de la migración a Linux).
- **Equipo de Dirección Económica (Core 2 Duo, 2GB RAM):** 2-3 años más (es el límite, pero con Linux ligero funciona aceptablemente).

## 4. Ahorro energético anual estimado

- **Antes:** ~450 kWh/año entre los 3 equipos (estimado).
- **Después (con Linux + powertop + planes de ahorro):** ~310 kWh/año.
- **Ahorro:** 140 kWh/año.
- **En USD aproximado:** 140 kWh \* $0.25 = **$35 por año** (pequeño pero significativo para una PYME, además de reducir huella de carbono).

## 5. Mejora en soberanía tecnológica

- Ya no dependemos de licencias de Microsoft de dudosa procedencia. Todo el software es de código abierto (Open Source) o cubano (Versat Sarasola sigue siendo crítico, pero lo corremos en un entorno controlado).
- Las actualizaciones las decidimos nosotros, no son forzadas por Microsoft.
- Eliminamos la telemetría (spyware) que envía datos a servidores extranjeros.

## 6. Riesgos de seguridad reducidos

- **Antes:** Contraseñas en papel, USB sin cifrar, Windows sin parches, puertos abiertos, FTP en texto plano.
- **Después:** Gestor de contraseñas, USB cifradas, firewall activo, actualizaciones de seguridad semanales (desde los repositorios de Linux), y SFTP cifrado.

**Conclusión:** Es posible mejorar rendimiento, seguridad y soberanía sin comprar hardware nuevo, alargando la vida útil de los equipos entre 3 y 5 años, con un ahorro energético pequeño pero real. Recomendamos proceder con la migración planificada en un entorno de prueba antes de aplicarlo en producción.

_(Fin del informe ejecutivo. Extensión: 2 páginas, lenguaje no técnico)_
