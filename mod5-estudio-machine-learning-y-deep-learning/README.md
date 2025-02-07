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

* dataset con numéricas y categóricas
* EDAs (menos foco para este módulo)
* Preprocesados y feature selection (25%)
* Regresión: algoritmos (25%)
* Clasificación (25%)
* Comparar resultados de modelos con validación cruzada (10 %)
* Pipeline o hacer preprocesados por separado (como se prefiera) (15 %)

Decidir dataset 10-20 columnas que se pueda hacer en 1 semana aprox o menos.
    * idealista madrid viviendas
    * diamonds
    * ? otras opciones ?

Fijar los límites de cada apartado para conseguir la nota de ese criterio.