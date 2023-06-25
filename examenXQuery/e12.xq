<biblio>{
for $i in  (1 to 3)
return
<libro>{$i,". ",doc("libros")//libro[$i]/titulo/text()}</libro>
}</biblio>