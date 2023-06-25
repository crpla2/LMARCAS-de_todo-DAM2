for $libro in doc("libros")//libro
where $libro/autor/apellido="Stevens"
order by  $libro/titulo/text()
return
$libro/titulo/text()