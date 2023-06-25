for $libro in doc("libros")//libro
where $libro/autor/apellido="Stevens"

return
$libro/titulo/text()