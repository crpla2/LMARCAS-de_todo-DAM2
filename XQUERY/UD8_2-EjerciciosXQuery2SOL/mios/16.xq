(:16 Consulta que devuelve el nombre y el pc de los 3 primeros pokemon con el siguiente 
formato de salida (numero de orden. Nombre - PC): 
<mipokedex> 
 <pokemon>1. Bulbasaur - 300</pokemon> 
 <pokemon>2. Charmander - 200</pokemon> 
 <pokemon>3. Squirtle -100</pokemon> 
</mipokedex> :)
<mipokedex>{
for $i in(1 to 3)
return
<pokemon>{
  concat($i,". ",doc("pokemon")//pokemon[$i]/nombre/text()," - ",doc("pokemon")//pokemon[$i]/pc/number())
}</pokemon>
  
}</mipokedex>