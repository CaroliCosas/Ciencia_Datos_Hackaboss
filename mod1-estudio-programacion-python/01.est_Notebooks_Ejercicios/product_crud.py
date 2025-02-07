from product import Product

products = [
    Product("Smartphone", 640),
    Product("Lámpara", 40),
    Product("Ordenador", 790),
    Product("Microfono", 453),
    Product("Pantalla monitor", 367)
]

def print_products():
    if not products: # alternativa: len() == 0
        print("No hay productos disponibles.")
        return
        
    for product in products:
        print(product)
        
    print("\n")

def print_products_sorted_by_price_desc():
    # products_sorted_by_price = sorted(products, key=obtener_precio) # asc: menos a más
            # products_sorted_by_price = sorted(products, key=obtener_precio, reverse=True) # desc: más a menos
    products_sorted_by_price = sorted(products, key=lambda p : p.price, reverse=True) # desc
    # products_sorted_by_price = sorted(products, key=lambda p : p.price) # asc

    for product in products_sorted_by_price:
        print(product)
        
def print_product_by_title():
    title = input("Introduce el título del producto")
    # bucle for que itere los productos y compruebe el titulo, si coincide imprime todo el producto
    for product in products:
        if title.lower() == product.title.lower():
            print(product)
            return # salir del bucle porque ya encontramos lo que salimos

def create_product():
    title = input("Introduce título del nuevo producto")
    price = float(input("Introduce precio del nuevo producto"))
    quantity = int(input("Introduce cantidad del nuevo producto"))
    # crear el producto
    new_product = Product(title, price)
    # guardar el nuevo producto en la lista de productos
    products.append(new_product)
        
def update_product():
    title = input("Introduce el título del producto a actualizar")
    nuevo_titulo = input("Introduce el nuevo título")
    nuevo_precio = float(input("Introduce el nuevo precio"))
    actualizado = False
    
    for product in products:
        if title.lower() == product.title.lower():
            product.title = nuevo_titulo
            product.price = nuevo_precio
            actualizado = True
            break
    
    # mostrar un mensaje de cómo fue la operación
    if actualizado:
        print("Producto actualizado correctamente")
    else: 
        print("No ha sido posible actualizar el producto.")
                

def delete_product_by_title():
    title = input("Introduce el título del producto a borrar")
    # Opción 1: .remove
    # for product in products:
    #    if title.lower() == product.title.lower():
    #        products.remove(product)
    #        print("Producto eliminado correctamente")
    #        break
    
    # Opción 2: del products[1]
    for i, product in enumerate():
        if title.lower() == product.title.lower():
            del products[i]
            print("Producto eliminado correctamente")
            break

def delete_products():
    print("Borrando lista de productos")
    products.clear()
    print("Productos eliminados OK.")




