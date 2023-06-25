(:17 Consulta que devuelve los nombres de los pokemon añadiendo delante del texto el número 
de ataques que tiene:)
for $pok in doc("pokemon")//pokemon
return

concat(count($pok//ataque),", ",$pok//nombre/text())
