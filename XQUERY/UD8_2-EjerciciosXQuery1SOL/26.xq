(: Ejercicio 26: Consulta que crea una tabla HTML con los nombres de 
todos los pokemon:)
<html>
{
  <head>
  
    <title>Mis superPokemon</title>
  
  </head>,
  <body>
  
    <p style="color:red">{for $pok in doc("pokemon")//pokemon
                            return concat($pok/nombre/text(), ", ")}</p>
  
  </body>
}
</html>