<biblio>{
for $i in (1 to 3)
return

  <libro>
  {concat($i,".", " "),
  doc("libros.xml")//libro[$i]/titulo/text()}</libro>
}</biblio>