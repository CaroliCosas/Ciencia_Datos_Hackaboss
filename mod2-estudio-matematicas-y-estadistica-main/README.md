
# Módulo 2: Numpy

Instalar Numpy y Matpotlib

* pip install numpy
* pip install matplotlib 



## ENTORNO VIRTUAL (Opcional)

Crear un entorno virtual:

python -m venv .mod2

Activar entorno virtual:

* Windows powershell: .mod2\Scripts\activate
* Bash: source .mod2/Scripts/activate

Para instalar un paquete:

pip install numpy
pip install matplotlib 

o incluso si queremos instalar varias dependencias de golpe, podemos instalarlas del requirements.txt:

pip install -r requirements.txt


## FORMAS DE EJECUTAR .PY

Abrir una terminal: python nombre_archivo.py

Si optamos por ejecutarlo con el botón de play entonces usa Code Runner:

* Manage > Settings > Code Runner > Run in terminal marcamos esta opción.

Con esto conseguimos que los scripts de python se ejecuten automáticamente por terminal donde sí nos deja escribir.


## EJERCICIO ENUNCIADO

Usaremos el dataset de madrid idealista:

https://www.kaggle.com/datasets/kanchana1990/madrid-idealista-property-listings


4 columnas numéricas

* price
* bedrooms
* bathrooms
* m2
* address (quitarle lo de ", Madrid" con numpy)

En cada apartado hacer visualizaciones con matplotlib o seaborn.

* 25 %:

* Carga de datos: cargarlo con np.genfromtext
* Media, mediana
* Máximo y mínimo
* histograma y curva de densidad

* 25 %

* Cuartiles: Q1 (25), Q2 (50), Q3 (75)
* IQR
* Filtrar 20 % más caro, y el 20 % más barato
* Opcional: filtrar los barrios 20 % más baratos
* Moda: calcular moda también de address
* Opcional: Moda de los barrios más baratos y más caros
* Dispersión: varianza y desviación estándar

25 % 

* Filtro de outliers: tukey, z-score, marcar en un gráfico los límites de outliers: rojo y azul.
* Correlación: calcular la matriz y pintarla con matplotlib/seaborn
* Estandarización

25 % 

* Asimetría y curtosis
* Transformar distribuciones e interpretar resultados
* Contraste de hipótesis:
    * Que las casas de X barrio son más baratas de las de Y barrio
    * Que las casas de >= 3 baños son más caras que las casas de 1-2 baños


Entrega: 27/12


Datasets opcionales, alternativas para futuros módulos:

* https://www.kaggle.com/datasets/harlfoxem/housesalesprediction
* https://www.kaggle.com/datasets/desalegngeb/students-exam-scores
* https://www.kaggle.com/datasets/ziya07/music-education-performance-data

Fuentes datos:

* https://www.kaggle.com/datasets
* https://datos.gob.es/es/catalogo?res_format_label=CSV
* https://datasetsearch.research.google.com/
* seaborn.load_dataset('')
* https://github.com/mwaskom/seaborn-data

* Opcional
* MySQL Community Server + MySQL Workbench