(: Ejercicio 8. Consulta que devuelve los nombres de los pokemon qu sean de tiop Fuego capturados antes de 2021 :)
for $pok in doc("pokemon")//pokemon
where $pok/@f_captura<2021 and $pok/tipo="Fuego"
order by $pok/nombre
return $pok/nombre/text()