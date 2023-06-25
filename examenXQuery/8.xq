<biblioteca>{
  for $lib in doc("libros")//libro[@año/data()>1993]
  where $lib//editorial="Addison-Wesley"
  return
  <libro>{
     $lib/titulo,
    <publicado>{
      $lib//@año/data()
    }</publicado>
  }</libro>
}</biblioteca>