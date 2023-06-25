(:8 Consulta que devuelve los nombres de los pokemon que sean de tipo Fuego capturados 
antes de 2021 :)
for $pok in doc("pokemon")//pokemon
where $pok//tipo="Fuego" and $pok/@f_captura<2021
order by $pok/nombre
return $pok//nombre/text()
