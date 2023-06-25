(: Ejercicio 7 Consulta que devuelve los nombres de los pokemon que tienen un ataque llamado "Avalancha" ordenados alfabéticamente :)
for $pok in doc("pokemon")//pokemon
where $pok//a_nombre='Avalancha'
order by $pok/nombre 
return $pok/nombre/text()