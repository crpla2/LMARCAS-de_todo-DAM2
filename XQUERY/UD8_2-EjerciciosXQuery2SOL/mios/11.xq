(:11  Consulta qsue devuelve el nombre de cada uno de los pokemon del archivo junto con el 
numero de ataques que tiene pero solo de los pokemon que tienen un número de ataques 
distinto de 1 :)

for $pok in doc("pokemon")//pokemon
where count($pok//ataque) ne 1
return 
<pokemon>{
  <nombre>{
    $pok//nombre/text()
  }</nombre>,
  <ataques>{
    count($pok//ataque)
  }</ataques>
 }</pokemon>