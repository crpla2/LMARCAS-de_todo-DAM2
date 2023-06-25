(: Ejercicio 16 Consulta que devuelve el nombre y el pc de los 3 primeros pokemon con el siguiente formato de salida (nº orden. nombre - PC):)
<mipokedex>
{
  for $i in (1 to 3)
  return
  <pokemon>
  {
    concat($i, ". "),
    doc("pokemon")//pokemon[$i]/nombre/text(),
    " - ",
    doc("pokemon")//pokemon[$i]/pc/text()
  }
  </pokemon>
}
</mipokedex>