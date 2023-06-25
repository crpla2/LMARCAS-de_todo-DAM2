<bibliteca>{
  for $l in doc("libros")//libro[@año/data()>1993]
  where $l//editorial/text()="Addison-Wesley"
  return 
  <libro>{$l/titulo, <publicado>{$l//@año/data()}</publicado>}</libro> 
}</bibliteca>