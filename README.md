# MatricesP9

La clase matriz se implementará mediante una clase abstracta, que contendrá los métodos básicos como el numero de filas y columnas de la matriz. Esta será la clase padre.

De esta clase derivarán las clases Matriz_Densa y Matriz_Dispersa.

La clase Matriz_Densa será la desarrollada en la práctica anterior.

La clase Matriz_Dispersa será una nueva clase desarrollada para aquellas matrices con más de un 60 % de ceros y se tratarán de manera distinta que las densas. Su estructura no será una matriz de elementos (dos arrays anidados con todas las posiciones ocupadas) sino la mezcla de un array de posiciones y un array de elementos, lo que reducirá la cantidad de memoria utilizada para almacenar los elementos distintos de cero. Tendrá su propio metodo de suma, resta y multiplicación, además de ser comparable (Modulo comparable).



