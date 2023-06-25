(:ejer 14 calcula el pc medio de los pokemon de cada tipo con el formato de salida
<mipokedex>
  <tipo>
    <nombre>Fuego</nombre>
    <pc_medio>33</pc_medio>
  </tipo>
</mipokedex>:)

for $type in distinct-values(doc("pokemon")//tipo)

return
 <tipo>
 {
   
   <nombre>{$type}</nombre>,
   <pc_medio>{avg(doc("pokemon")//pokemon[tipo=$type]/pc)}</pc_medio>
 }
 </tipo>