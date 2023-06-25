(: ejercicio 20 Consulta que devuelve todos lso nombres de los poqkemon en los que al menos uno de sus tipos sea Fuego:)
(:
for $pok in doc("pokemon")//pokemon
where $pok/tipo="Fuego"
return $pok/nombre/text()
:)

for $pok in doc("pokemon")
where (some $a in $pok satisfies $a/tipo="Fuego")
return

 $pok/nombre/text()

