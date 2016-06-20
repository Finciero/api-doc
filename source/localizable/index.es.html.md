---
title: API Reference

language_tabs:
  - shell: curl
  - ruby
  - javascript
  - go

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - authentication
  - sub_accounts
  - errors

search: true
---

<h1 id="introduction">Introducción</h1>

El API de Finciero está diseñado a partir del estilo de arquitectura REST,
lo que la hace predecible y fácil de usar. Además, sus respuestas hacen
fuerte uso de los estados HTTP para identificar distintos tipos de  error.
Cualquier interacción con el API retorna una JSON, incluyendo los errores.

Proximamente tendremos SDKs en distintos lenguajes, como ruby, golang y nodejs,
para que la comunicación entre el API y sus aplicaciones sean aún más fácil de integrar.

Actualmente nuestra API funciona de la siguiente manera:

- Se le pide al API obtener la lista de cuentas.
- El API responde indicando que se ha iniciado el proceso de obtención de datos.

Luego de este punto, no hay más interacción por parte del cliente, ya que la duración
del proceso es indeterminada, puede durar hasta 30 segundos, una vez que el API
obtenga los datos, ya sea de manera exitosa o no, la información es enviada a un
URL especificado por el cliente, conocidos como **callbacks**.

Para transparentar el proceso, vea la siguiente figura:

![Diagrama de secuencia, obtener sub cuentas](sub_accounts_sd_es.png)

En el caso de pedir transacciones, el proceso puede demorar entre 30 segundos y 2 minutos,
dependiendo la cantidad de transacciones contenidas en la cuenta especificada.

![Diagrama de secuencia, obtener transacciones](transactions_sd_es.png)
