(: ejer 17 :)

for $pok at $i in doc("pokemon")//pokemon
return
<pok>
  {
    concat($i," ", $pok/nombre)
  }
</pok>