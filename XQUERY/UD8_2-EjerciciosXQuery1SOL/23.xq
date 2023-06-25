(: Ejercicio 23. Consulta que devuelve los nombres de los pokemon que tengan 
las palabras "Rapido" y "Ataque" en el mismo ataque. Si el pokemon tiene más de 
un ataque solo es necesario que aparezca en al menos uno de ellos:)

for $pok in doc("pokemon")//pokemon
let $ata:=$pok/ataque/a_nombre
(:
where contains($pok/ataque/a_nombre/text(), "Ataque")
:)


where some $p in $pok/ataque satisfies (contains($p/a_nombre,"Rapido")and contains($p/a_nombre, "Ataque"))

return
<aa>{$pok/nombre}</aa>