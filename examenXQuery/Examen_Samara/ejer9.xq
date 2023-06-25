for $libro in doc("libros.xml")//libro
where $libro/precio>40
return
$libro/titulo/text()