import numpy as np
import matplotlib.pyplot as plt

#histograma de precios estandarizados y otro al lado sin estandarizar

def filtrar_barrios_baratos(price, addresses):
    barrios = {}
    for precio, barrio in zip(price, addresses):
        if barrio not in barrios:
            barrios[barrio] = []
        barrios[barrio].append(precio)

    barrios_baratos = {}
    for barrio, precios in barrios.items():
        percentil_20 = np.percentile(precios, 20)
        precios_baratos = [p for p in precios if p <= percentil_20]
        barrios_baratos[barrio] = {
            "percentil_20": percentil_20,
            "precios_baratos": precios_baratos,
            "num_casas_baratas": len(precios_baratos)
        }

    print(f"Número total de barrios analizados: {len(barrios_baratos)}")
    print("\nBarrios con casas en el 20% más barato:")
    for barrio, info in barrios_baratos.items():
        print(f"- {barrio}:")
        print(f"  Percentil 20: {info['percentil_20']:.2f}")
        print(f"  Número de casas baratas: {info['num_casas_baratas']}")
        print(f"  Precios más baratos: {info['precios_baratos']}")
    
    return barrios_baratos

def visualizar_barrios(barrios_baratos):
    barrios = list(barrios_baratos.keys())
    num_casas_baratas = [info["num_casas_baratas"] for info in barrios_baratos.values()]
    
    plt.figure(figsize=(10, 6))
    plt.bar(barrios, num_casas_baratas, color='skyblue', edgecolor='black')
    plt.title("Número de casas baratas por barrio (20% más barato)")
    plt.xlabel("Barrios")
    plt.ylabel("Número de casas baratas")
    plt.xticks(rotation=45, ha="right")
    plt.grid(axis='y', linestyle='--', alpha=0.7)
    plt.tight_layout()
    plt.show()

def visualizar_histogramas(price):
    # Estandarizar los precios
    price_std = (price - np.mean(price)) / np.std(price)

    # Crear los histogramas
    plt.figure(figsize=(12, 6))

    # Histograma sin estandarizar
    plt.subplot(1, 2, 1)
    plt.hist(price, bins=10, color='blue', alpha=0.7, edgecolor='black')
    plt.title("Precios sin estandarizar")
    plt.xlabel("Precio (€)")
    plt.ylabel("Frecuencia")
    plt.grid(axis='y', linestyle='--', alpha=0.7)

    # Histograma estandarizado
    plt.subplot(1, 2, 2)
    plt.hist(price_std, bins=10, color='green', alpha=0.7, edgecolor='black')
    plt.title("Precios estandarizados")
    plt.xlabel("Precio estandarizado")
    plt.ylabel("Frecuencia")
    plt.grid(axis='y', linestyle='--', alpha=0.7)

    # Ajustar los gráficos
    plt.tight_layout()
    plt.show()

# Datos de ejemplo
price = np.array([1920000, 1995000, 1300000, 1650000, 1590750, 1590000, 5700000, 2190000, 1190000, 675000])
addresses = np.array(["Recoletos", "Castellana", "Hortaleza", "Chamartín", "Recoletos",
                      "Cuatro Caminos", "Recoletos", "Goya", "Goya", "Aravaca"])

# Filtrar barrios con el 20% de precios más baratos
barrios_baratos = filtrar_barrios_baratos(price, addresses)

# Visualizar el número de casas baratas por barrio
visualizar_barrios(barrios_baratos)

# Visualizar histogramas de precios
visualizar_histogramas(price)
