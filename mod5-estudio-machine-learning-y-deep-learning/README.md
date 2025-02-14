python -m venv .mod5-ml

* Windows powershell: .mod5-ml\Scripts\activate
* Bash: source .mod5-ml/Scripts/activate

pip install -r requirements.txt



* Entendimiento del negocio
* Entendimiento de los datos
* Preparación de datos: scikit learn scaler, imputer
* Modelado: scikit regresión, clasificación, clustering, tensorflow
* Evaluación: scikit metrics, validación de modelos
* Despliegue: modelo empaquetar y desplegar M7

X
y 

Para exportar ipynb a PDF, instalar las dependencias:

```bash
pip install nbconvert
pip install pandoc
pip install jupyter
```

https://miktex.org/download

Alternativa: exportar desde Google Colab


* overfitting o sobreajuste: un modelo se ajusta demasiado a los datos de train y no generaliza bien y suele tener peor resultado en test.
* underfitting o subajuste: el modelo es muy generalista que da mal resultado en entrenamiento y normalmente ocurre lo mismo con test pero si en los datos hay ruido varianza podría ocurrir que diera mejor resultado en test que en train

* KNN es sensible a distancias y ruido en los datos.
* Ruido dispersión desviación de test


## ENUNCIADO EJERCICIO

* Dataset Airbnb NYC https://www.kaggle.com/datasets/dgomonov/new-york-city-airbnb-open-data AB_NYC_2019.csv
    * Quitar columnas: id, host_id, host_name
    * Fecha: probar a descomponer la fecha en campos año mes y día con pandas es decir, en 3 columnas, por ejemplo usando to_datetime de pandas y los accesores de fecha para extraer año mes y día.

* EDAs (10%) (menos foco para este módulo)
    * univariantes: histogramas boxplot countplot
    * bivariantes: scatterplot
    * multivariante: corr en heatmap, pairplot
* Preprocesados (20%)
    * numéricas: imputer, scaler, transformer
    * categóricas: imputer, encoder
    * Si queremos codificar de forma ordinal columnas de la entrada X : OrdinalEncoder: 0, 1, 2, 3, 4,5 ,6....
    * OneHotEncoder en la entrada para no introducir orden ficticio, si esto genera muchas columnas luego podemos usar PCA o SelectKBest para reducirlas
    * Requisito: hacer los preprocesados con Scikit Learn en lugar de métodos de pandas
* clustering y siluetas (10 %)
    * Crear una columna cluster usando KMeans o cualquier otro algoritmo de Clustering
    * Usar esa columna para hacer algún gráfico EDA como hue para colorear con scatterplot
* feature selection (10%)
    * SelectKBest para filtrar las mejores columnas y probar - Probar este para regresión
    * PCA - Probar este para clasificación
    * probar los dos pero quedarse con uno, o comparar resultados con ambos
    * Hay pocas columnas, por lo que esta fase no sería tan relevante
* Regresión (20%):
    * Predecir la columna 'price'
* Clasificación multiclase (20%)
    * Predecir la columna 'room_type'
* Comparar resultados de modelos con validación cruzada (10 %)
    * Mostrar un dataframe de resultados con las métricas calculadas
    * Opcional: mostrar boxplot de los resultados de validación cruzada como tiempos de ejecución y predicción y métricas

* Opcional:
    * Uso de pipelines opcional:
        * Opción 1: hacer las transformaciones por separado manualmente
        * Opción 2: hacer las transformaciones con pipelines
        * Opción 3: una primera parte con transformaciones manuales y una segunda parte con Pipeline
        * En ambos casos sería interesante calcular las métricas para ver qué técnicas de preprocesado van mejor
    * Vectorizar la columna texto 'name' y usar TruncatedSVD
    * Clasificación multiclase 'room_type' o regresión sobre price con TensorFlow-Keras
    * SMOTE si hay desbalanceo para el problema de clasificación multiclase 'room_type'
    * Crear un apartado independiente donde se eliminen filas cuya last_review sea null, y trata la fecha por ejemplo con df['last_review].dt.year o month o day para sacar año mes y día y poder usarlos como 3 columnas de entrada.
    * Transformar distribución de la variable objetivo 'price': En caso de querer transformar precio:
        * manual sin pipeline:
            * train_test_split
            * hacer transformación de precio (por ejemplo logarítmica) para y_train
            * hacer fit: model.fit(X_train, y_train_log)
            * y_pred_log = model.predict
            * deshacer transformación precio: inverse_transform o np.exp(y_pred_log) para obtener y_pred normal
        * automática con pipeline:
            * requiere de usar clase especial combinada con el pipeline: https://scikit-learn.org/stable/modules/generated/sklearn.compose.TransformedTargetRegressor.html
    * GridSearchCV para buscar mejores párametros en algún modelo


Decidir dataset 10-20 columnas que se pueda hacer en 1 semana aprox o menos.
    * idealista madrid viviendas
    * adult census: https://archive.ics.uci.edu/dataset/2/adult
    * taxis: https://github.com/mwaskom/seaborn-data/blob/master/taxis.csv
    * student performance: https://archive.ics.uci.edu/dataset/320/student+performance
        * 600 filas
    * bank marketing: https://archive.ics.uci.edu/dataset/222/bank+marketing

    * NYC Airbnb: https://www.kaggle.com/datasets/dgomonov/new-york-city-airbnb-open-data
  


Librerías:

* numpy, pandas
* matplotlib, seaborn (opcionalmente plotly)
* Scikit Learn

Entrega:

* Domingo 23/02/2025 23:59
* m5_nombre_apellido.ipynb

* Gestión de nulos:
    * number_of_reviews,last_review,reviews_per_month:
        * number_of_reviews si es nan se puede dejar a 0
        * reviews_per_month si es nan se puede dejar a 0
        * last_review: estrategias:
            * a la actual restar le resta last_review y sacas el número de días transcurridos
            * fillna con un timestamp concreto 01-01-2019
            * binarizar la columna: hay reseña o no hay reseña
            * bfill o ffill para rellenar con fechas de las filas anteriores o posteriores
            * Borrar filas que tengan esa columna null y quedarse con las otras si es que son suficientes
            * Hemos decidido eliminar esta columna para simplificar.

