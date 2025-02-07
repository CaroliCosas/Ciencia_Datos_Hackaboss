class Product:
    # atributos de clase, con valores comunes para todos los productos
    title = "Producto por defecto"
    iva = 0.21
    
    # Método constructor:
    def __init__(self, title, price): # atributos de instancia
        self.title = title
        self.price = price
        print("Producto creado correctamente")
        
    def __str__(self):
        return f"Product: title={self.title}, price={self.price}"
    
    
    def calcular_iva(self):
        """Calcula el IVA de este producto en base a su precio y lo devuelve

        Returns:
            float: Impuesto del valor añadido calculado redondeado a dos decimales
        """
        iva = self.price * self.iva
        print(f"IVA calculado {iva}")
        return round(iva, 2)