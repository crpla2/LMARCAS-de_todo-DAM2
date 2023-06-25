for $pok in doc("libros")//libro
group by $ed:= $pok/editorial
return
<editorial>{
  <nombre>{$pok/editorial/text()}</nombre>,
  <precio_medio>{avg($pok/precio)}</precio_medio>

}</editorial>