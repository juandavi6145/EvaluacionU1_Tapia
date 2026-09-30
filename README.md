# Análisis de Deflexión en Viga Simplemente Apoyada - Hito 1

## Descripción
Este repositorio contiene el flujo de trabajo reproducible para la Evaluación 1 (Hito 1). Se analiza la deflexión teórica (Euler-Bernoulli) frente a datos experimentales de una viga de sección rectangular sometida a una carga puntual centrada.

## Estructura del Repositorio
- `data/`: Contiene los archivos originales (entradas). No deben ser modificados.
  - `datos_viga.csv`: Datos medidos de carga y deflexión.
  - `parametros_viga.xlsx`: Parámetros geométricos y del material.
- `analysis/`: Contiene el script computacional `analisis_viga.m`.
- `figures/`: Contiene el gráfico de resultados (`carga_deflexion.png`) generado como salida.
- `report/`: Contiene el informe técnico en PDF y código LaTeX.

## Instrucciones de Reproducción
1. Descargar o clonar este repositorio manteniendo la estructura de carpetas intacta.
2. Abrir el software MATLAB y establecer la carpeta `analysis/` como el directorio de trabajo actual (Current Folder).
3. Abrir y ejecutar el script `analisis_viga.m`.
4. El script leerá automáticamente los datos de la carpeta `data/`, calculará el segundo momento de área, las deflexiones teóricas y la diferencia relativa.
5. Los resultados numéricos se imprimirán en la consola de comandos, y el gráfico comparativo se generará y sobrescribirá automáticamente en la carpeta `figures/`.