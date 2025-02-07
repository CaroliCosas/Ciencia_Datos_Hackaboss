

Crear un entorno virtual:

python -m venv .mod3

Activar entorno virtual:

* Windows powershell: .mod3\Scripts\activate
* Bash: source .mod3/Scripts/activate

Para instalar paquetes:

pip install -r requirements.txt

## EJERCICIO MÓDULO 3

* m1_python/m1_nombre_apellido.ipynb
* m2_numpy/m2_nombre_apellido.ipynb
* m3_datascience/m3_nombre_apellido.ipynb
* m4_sql/m4_nombre_apellido.ipynb + sql

Slack poner nombre y apellido, foto.



## EJERCICIO MÓDULO 3:

Uso de Pandas y Seaborn + algún gráfico de Plotly.

Dataset: diamonds.

IMPORTANTE: cargar el dataset desde CSV desde la carpeta Data porque tendrá nulos introducidos manualmente.

* PARTE 1: 25 % carga y limpieza
    * Carga con Pandas: pd.read_csv

    * Limpieza de valores error: 
        * hay columnas que tienen un valor '?', por tanto se deben reemplazar por un valor nan.

    * Cambio de tipo de dato: .astype() a numéricos y textos, por ejemplo a categorical y carat a float32 o float16

    * Limpieza de nulos (limpiar valores NaN):
        * Nulos en columnas continuas: mediana, media
        * Nulos en columnas categóricas: moda, un valor fijo

    * Encoding: texto a numérico
        * Uso de la función get_dummies() para encoding one_hot
        * Uso de map para encoding ordinal para la columna cut como una nueva columna cut_int: 1, 2, 3, 4

* PARTE 2: 25 % transformaciones:
    * Crear una columna price_iva a partir de la columna price que muestre el precio + IVA (21%). 
        * Ejemplo df['price'] * 1.21 

    * Crear una columna price_discount usando apply a partir de la columna price(con lambda o def):
        * price < 1000 and cut == 'Ideal' entonces 10 % descuento
        * 1000 <= price <= 5000 and cut == 'Premium' entonces 15 % descuento
        * si no entra en las condiciones sin descuento, devolver el precio original

    * Crear una nueva columna volumen combinando: x * y * z

    * Ordenar por dos columnas con sort_values():
        * tipo de corte (cut) y precio (price)

    * Agrupaciones con groupby y visualizarla
        * Agrupar por las 3 que hay de tipo categórico calculando la media, max, min por ejemplo de alguna de las numéricas: price, carat, depth

* PARTE 3: 20 % distribuciones: 

* Outliers: Visualización Q1 y Q3 y calcular límites tukey y filtrar. Sobre la columna precio.

* asimetría, curtosis y transformar datos con logaritmo o raíz cuadrada, aplicar sobre precio, visualizar el histograma y/o boxplot por tipo de corte. Opcional ajustar la escala.

* Discretizar la columna precio por barato, medio, caro usando la función pd.cut


* PARTE 4: 30 % visualizaciones:

* Seaborn EDAS:
    * univariantes:
        * histogramas y curvas de densidad
        * boxplot
        * countplot
    * bivariantes y multivariantes
        * scatterplot con hue, con size, con style
        * Calcular correlación con Pandas y mostrarla con seaborn
        * Hacer la correlación en un gráfico de barras para la columna 'price'
        * Crear una pivot table usando como index y columns algunas variables categóricas y como values usar el price y visualizarla con heatmap de seaborn
    * Combinarlas con:
        * hue, style, size, row, col usando un relplot
        * filtro

Domingo 19/01 23:59 fecha entrega.

* m3_nombre_apellido.ipynb



## ESQUEMA


CRISP-DM:

* Entendimiento de negocio
* Entendimiento de los datos ( numpy, pandas, matplotlib, seaborn, plotly )
    * Recopilar datasets
    * Entender las columnas
    * Correlación
    * EDAs:
        * histogramas, box, violin
        * scatter
        * heatmap, imshow
    * ordenar datos
    * agrupación
    * filtrar
    * visualizar
    * estandarizar
    * profiling con ydata-profiling genera un reporte html con EDAs ya hechos
* Preparación de los datos  ( numpy, pandas, matplotlib, seaborn, plotly, scikit learn )
    * limpieza-tratamiento de nulos
    * limpieza-tratamiento de errores y duplicados
    * limpieza-tratamiento de outliers
    * transformaciones
    * encoding
    * escalado
* Modelado (scikit learn, tensorflow)
    * Crear modelos para predecir datos
    * aprendizaje supervisado: regresión, clasificación
    * aprendizaje no supervisado: clustering, reducción de dimensionalidad
* Evaluación (scikit learn, tensorflow)
     * métricas
     * comparaciones entre modelos
* Despliegue:
    * AWS, Azure, GCP
    * Dockerizar envuelto en una aplicación web con Flask, Streamlit, Django, FastAPI

## VISUALIZACIÓN:

* matplotlib
    * plt.hist
    * plt.scatter

* seaborn
    * sns.kdeplot
    * sns.boxplot
    * sns.scatterplot

* plotly express
    * px.box
    * px.scatter


## USO de beautiful soup y selenium

* Selenium es una herramienta para testing de interfaz de usuario UI
    * Habitual para automatizar un flujo de navegación en una página web desde el navegador, es decir, simular lo que haría un usuario por pantalla. El objetivo es comprobar que una web funciona, es decir, que las funcionalidades son correctas.

* Beautiful Soup: herramienta para scrapear o leer/interacturar generalmente con documentos HTML. Se usa para ubicar elementos en el HTML de una web por ejemplo y extraer datos.
    * Ejemplo: 
        * 1 - queremos un dataset en CSV de todos los productos de Amazon
        * 2 - Si no existe un dataset CSV con esos datos, podemos construirlo nosotros mismos
        * 3 - Podemos usar beautiful soup para leer la página web de Amazon y leer sus productos, iterarlos y leer sus títulos, precio, fecha, fabricante, descripción, imágenes, comentarios, etc etc
        * 4 - con esa información podemos construir un dataframe de pandas y exportarlo a CSV o SQL o lo que queramos.
    * BS nos ayuda a interpretar el HTML permitiendo acceso a sus nodos utilizando selectores por etiqueta html, por clase css, por xpath


Ejemplo: 

* Las páginas suelen tener un sitemap.xml

* tienda.com
* tienda.com/pantalones/
* tienda.com/pantalones/pantalon-hugo-boss-terciopelo
* tienda.com/camisetas/
* tienda.com/camisetas/camiseta-licra-deporte-domyos

Problemas que pueden surgir:

* Componente ético y legal: muchas webs tienen términos y condiciones que impiden scrapear la información
* Para usar BS lanzar peticiones HTML, el servidor puede bloquearnos si detecta muchas peticiones seguidas o comportamiento automatizado, por user agent pueden detectar si estás usando un programa y bloquear, también te pueden bloquear por ip
* Las web pueden cambiar su estructura html completamente y romper los programas de scrapeo


Legalmente:
* lo habitual sería usar una API que te devuelva los datos en un formato de intercambio de datos como JSON mucho más cómodo de procesar a nivel programático
* No todas las empresas van a ofrecer una API ni acceso a la misma
* Para usar apis es normal tener que crear una cuenta, autenticarse, obtener un token, tener un permisos


Flujo de ejecución: 

* requests lanza una petición HTTP GET a una página web como https://www.google.com esto devuelve un HTML como respuesta
* Cargamos el HTML en BS
* Con BS le pedimos datos concretos del HTML
