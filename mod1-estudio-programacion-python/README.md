# Módulo 1: Sintaxis Python

* Tipos de datos
* Variables
* Operadores
* Estructuras de control
* Funciones
* Listas
* Tuplas
* OOP

Herramientas a instalar:

* Python 3.13: https://www.python.org/downloads/
* Anaconda (3.12): proporciona Python, Jupyter Notebook y paquetes de ciencia de datos: Numpy, Pandas, matplotlib, scikit learn.
* PyCharm Community Edition: https://www.jetbrains.com/es-es/pycharm/download/?section=windows
* Visual Studio Code: https://code.visualstudio.com/download
* Google Colab: https://colab.research.google.com/
* Jetbrain Datalore

## PYTHON

Usaremos la última versión disponible: 3.13 o sirve también la 3.12

## ANACONDA

Abrir Anaconda Navigator y buscar Jupyter Labs.

## PyCharm Community Edition

* Primero instalar Python.
* Isntalar CUIDADO: PyCharm Community Edition. (NO EL PROFESSIONAL)
* Nuevo proyecto o clonar un proyecto.

## CLONAR

En PyCharm: 
* File
* Project from version control
* Pegar la URL del repositorio de Gitlab
* Si es la primera vez nos pide un usario y contraseña de Gitlab
  * Generar token --> esto abre Gitlab y con el botón de generar token genera un texto que lo copiamos y pegamos

En Git Bash:

## GIT 

Abrir una cmd y escribir: git --version

git --version
git version 2.42.0.windows.2

## VARIABLE ENTORNO PATH

## VISUAL STUDIO CODE

https://code.visualstudio.com/download

### Instalar extensiones de Visual Studio Code:

* Jupyter
* Python Environment Manager
* Code Runner
* vscode-icons

### Clonar repositorio:

* abrir visual studio code
* Hacer clic en la pestaña source control
* Clonar repositorio 
* Pegar la URL del repositorio de Gitlab: https://students.hackaboss.com/bootcamps/dsb01on/mod1-programacion-python
* Introducir usuario y token
  * Crear token: https://students.hackaboss.com/-/user_settings/personal_access_tokens
  * Usuario: https://students.hackaboss.com/-/profile/account

### Probar Jupyter Notebooks desde Visual Studio Code:

* Abrir un archivo ipynb
* Select Kernel (arriba a la derecha)
* Seleccionar donde pone Python y seleccionar versión de python
* Preguntará si queremos instalar el paquete ipykernel le decimos que sí

### Si no detecta Python AJUSTAR VARIABLE DE ENTORNO

Quizá hace falta configurar la variable de entorno.

* Windows
* Editar propiedades del sistema
* Variables de entorno
* Variables de sistema
* Path:
   * C:\Program Files\Python313\Scripts\
   * C:\Program Files\Python313

### Instalar el paquete ipykernel

Abrir una terminal en Visual Studio Code o cmd:

pip install ipykernel


## COMO CREAR NUEVO PROYECTO Y SUBIRLO A GITHUB

objetivo: crear un repositorio con los ejercicios de cada módulo.

* En windows crear una carpeta
* En Visual Studio Code abrir la carpeta
* Crear archivo README.md
* En la pestaña Source Control hay un botón Publish to GitHub
* Nos pregunta si queremos repositorio privado o publico: PUBLICO
* Hacer un commit (Hay que escribir un mensaje)
* Hay que pulsar la ruleta de sincronizar para hacer un push

Si pide user.email:

* Abrir una terminal: Ctrl + Ñ
* git config --global user.name "alansastre"
* git config --global user.email alan@certidevs.com



## ESQUEMA SINTAXIS PYTHON

* Tipos de datos: int, float, str, bool
* Estructuras de datos: list, tuples, set, dict
* string métodos: replace, swapcase, split, upper, lower, ...
* operadores: 
  * aritméticos
  * comparación
  * lógicos
* estructuras de control:
  * condicionales: if, elif, else, match case
  * iterativas: for, while, break, continue, enumerate, zip
* funciones:
  * def 
  * parámetros
  * invocar o ejecutar una función: calcular_algo()
  * parámetros opcionales
  * return
  * input() una función para leer de entrada estandar
  * Counter() calcular las frecuencias de elementos en un iterable
  * random()
  * datetime.now()
* Programación orientada a objetos
  * class: agrupan variables y funciones en un mismo sitio
  * objetos: instancias de una clase
  * Ejemplo:
    * Una clase puede ser el plano de una casa, y los objetos son las casas que construyes con el plano
    * Una clase puede ser Coche, un objeto puede ser Skoda, Alfa Romeo, BMW concreto
    * Una clase Usuario (email, password, city), un objeto puede ser el Usuario 1 con el email alan@gmail.com con la city Madrid.
    * En un excel podemos tener una pestaña Coches. La clase sería Coche, y los objetos serían las filas que hay en el excel, por ejemplo 5 filas equivale a 5 coches todos con una misma estructura de columnas que viene en el excel
    * modelo_casas = LinearRegression()
    * modelo_coches = LinearRegression()
    * usuario_1 = Usuario()
    * usuario_2 = Usuario()
    * coche_bmw = Coche()
    * coche_alfa = Coche()
* pass como palabra palabra especial para no añadir nada en un bloque

## EJERCICIOS

* Cada módulo tendrá un ejercicio evaluable individual
* Ese ejercicio se decide el último día del módulo
* La fecha de entrega es una semana: 19/12
* Subirlo al propio repositorio de github personal que hemos creado en clase
* Luego se pondrá la nota en el repositorio o se enviará por correo o slack


* Crear una clase Usuario
* lista de objetos de la clase Usuario
* Crear un menú de opciones donde las opciones sean:

  * Opción 1: Imprimir todos los usuarios de la lista

  * Opción 2: Imprimir todos los usuarios ordenados por edad descendente. Opcional: pedir por input si quiere ascendente o descendente

  * Opción 3: Imprimir un usuario por su email: Ejemplo, con input preguntamos qué usuario quiere ver, y ese cuyo id coincida lo imprimimos. (opcional, quien quiera puede pensarlo con un número int que se genere en base al máximo sumando uno o con una secuencia)

  * Opción 4: Crear un nuevo objeto usuario, se le puede pedir los datos con input(): 
    * nombre (str)
    * email (str)
    * edad (int)
    * altura (float)
    * estudiante (bool)
    * Opcional: fecha cumpleaños con date (Leer pedir primero dia, luego mes y luego año)

  * Opción 5: Actualizar un usuario que ya exista

  * Opción 6: borrar un usuario por su email

  * Opción 7: borrar todos los usuarios

  * Opción 8: Salir


- Extra opcional: Dividir en funciones cada operación para separarlas del menú
- Extra opcional: gestión de errores con try-except y bucles para reintentos
- Extra opcional: guardar los usuarios en un csv según se crean en la lista.
- Extra opcional: el usuario tenga un atributo que sea un objeto de otra clase, una clase Address (street, city, country).


- Ver usuarios / usuario: 25 % 
- Crear: 25 %
- Actualizar : 25 %
- Borrar uno / Borrar todos: 25 %
