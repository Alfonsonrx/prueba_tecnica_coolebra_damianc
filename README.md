# Prueba tecnica Python y React

Como vera me tome cierta libertad para desarrollar esta prueba, me tome un
tiempo para investigar ya que con el margen de libertad que daba el documento
vi varias formas de hacerlo, uno de ellos era hacer un backend con express, pero
ya que estaba haciendo backend y frontend, considere que realizando el backtend con python
seria mas eficaz para ejecutar el script de python, el cual es la vista que procesa
la query.

## Respuestas al documento

### 1. La query utilizada (que esta siendo aprovechada desde el backend de este proyecto) es:
`SELECT prod.name, prod.SKU, prod.ean, prod.market_id, CASE WHEN pri.active = 0 THEN pri.normal_price WHEN pri.active = 1 THEN pri.discount_price END AS menor_precio FROM `product` AS prod JOIN `price` AS pri  WHERE prod.SKU = pri.product_SKU;`

### 2. Un proceso de automatizacion que puedo pensar con la base de datos que se presenta, seria
que una pagina web muestre en la pantalla principal, la cantidad de productos por cada mercado
de forma que se pueda categorizar y se muestre a tiempo real, a esto se le podria agregar el dato
de descuentos activos, y asi que los usuarios puedan estar al tanto que tipo de productos estan 
teniendo mas descuentos en ese momento.

### 3. Funcion de python y despliegue en react

Para esta respuesta decidi que lo mas logico, seria hacer un backend con python y el frontend con react,
debido a que para establecer una comunicacion entre ambas tecnologias, era mas eficaz usar este metodo

Primero que todo necesitara clonar el repositorio y luego seguir los pasos de instalacion.

Para la base de datos he dejado el archivo sql el cual simplemente se importa a la base de datos y viene con 
datos simples listos: 
`store_prueba_tec.sql`

Luego ir a la carpeta de `python_backend` y ejecutar los siguientes comandos para crear el entorno

```
> python -m venv venv
> ./venv/Script/activate
> pip i -r ./requirements.txt
```

Con ello esta listo el entorno y puede correr el backend con:

```
py ./manage.py runserver
```

Teniendo eso puede pasar a instalar y correr el frontend, se dirige a la carpeta `react_test` y 
en otra consola ejecuta el siguiente comando:

```
npm install
```

Espere a que termine de instalar e inicia react con el siguiente comando:

```
npm start
```

Y listo, podra visualizar los datos requeridos y filtrarlos con el input en la zona de arriba 
a tiempo.