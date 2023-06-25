for $l in doc("libros")//libro
group by $g:=$l/editorial
return
<editorial>{<nombre>{$l/editorial/text()}</nombre>,<precio_medio>{avg($l/precio)}</precio_medio>}</editorial>