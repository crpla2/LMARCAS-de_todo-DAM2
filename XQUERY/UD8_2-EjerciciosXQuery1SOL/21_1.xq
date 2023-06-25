(: Ejercicio 21.  Consulta que devuelve los nombres de los pokemon en los que 
al menos uno de sus ataques es "Avalancha" :)

for $pok in doc("pokemon")//pokemon


where $pok/ataque/a_nombre="Avalancha"

return
$pok
