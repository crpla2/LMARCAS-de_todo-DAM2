(: Ejercicio 5: reemplaza el nodo completo del primer ataque con los siguientes 
datos: a_nombre= Ataque Rapido potencia=8 :)

replace node doc("pokemon")//pokemon[1]/ataque[1] with 
<ataque>
  <a_nombre>Ataque Rapido</a_nombre>
  <potencia>8</potencia>
</ataque>