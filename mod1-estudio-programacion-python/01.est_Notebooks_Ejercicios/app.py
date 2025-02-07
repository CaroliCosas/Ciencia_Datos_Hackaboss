import product_crud as crud

menu = """Te damos la bienvenida a la app de productos, estas son las opciones:
          1 - Ver todos los productos
          2 - Ver todos los productos ordenados por precio
          3 - Ver un producto por titulo
          4 - Crear nuevo producto
          5 - Actualizar producto existente
          6 - Borrar un producto por su id
          7 - Borrar todos los productos
          8 - Salir
          """

while True:
    option = int(input(menu))
    match option:
        case 1:
            crud.print_products()
        case 2:
            crud.print_products_sorted_by_price_desc()
        case 3:
            crud.print_product_by_title()
        case 4:
            crud.create_product()
        case 5:
            crud.update_product()
        case 6:
            crud.delete_product_by_title()
        case 7:
            crud.delete_products()
        case 8:
            print("Hasta pronto.")
            break
        case _:
            print("Opción incorrecta")
