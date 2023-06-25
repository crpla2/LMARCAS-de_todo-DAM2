(: ejercicio 21 Consulta que devuelve todos lso nombres de los poqkemon en los que al menos uno de sus tipos sea Fuego:)

for $pok in doc("pokemon")//pokemon
where $pok/tipo="Fuego"
return $pok/nombre/text()
