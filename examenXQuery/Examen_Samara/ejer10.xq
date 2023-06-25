for $libro in doc("libros.xml")//libro
group by $e := $libro/editorial
return
<editorial>{
  <nombre>{$libro/editorial/text()}</nombre>,
  <precio_medio>{avg($libro/precio)}</precio_medio>
}</editorial>