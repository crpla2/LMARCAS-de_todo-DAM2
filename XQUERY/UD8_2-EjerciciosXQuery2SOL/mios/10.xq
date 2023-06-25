(:10 Consulta que devuelve los nombres de todos los pokemon contenidos en el archivo 
“pokemon.xml” y todos los comentarios de cada pokemon contenidos en el archivo 
descripción.xml :)
for $pok in doc("pokemon")//pokemon
return
<pokemon>
{
 $pok/nombre,
 doc("C:\Users\carlo\OneDrive\Escritorio\XQUERY\XML\descripcion.xml")//entrada[./nombre=$pok/nombre]/comentario
}
</pokemon>
