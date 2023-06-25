(:Ejercicio 22. Consulta que devuelve todos los nombres de los pokemons en los 
que todos sus ataques sean Avalancha:)

for $pok in doc("pokemon")//pokemon

where every $p in $pok/ataque satisfies $p/a_nombre="Avalancha"

return
$pok/nombre