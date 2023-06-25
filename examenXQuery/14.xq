<libros>{
  for $lib in doc("libros")//libro
  return 
    <libro>{
     '"',$lib/titulo/text(),'"', ", número de autores: ", count($lib/autor)
    }</libro>
}</libros>