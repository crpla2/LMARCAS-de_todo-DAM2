for $libro in doc("libros.xml")//libro
where $libro/autor/apellido="Stevens"
order by $libro/titulo ascending

return
$libro/titulo/text()