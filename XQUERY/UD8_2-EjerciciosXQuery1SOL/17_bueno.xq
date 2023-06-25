(: ejer 17:)
for $pok  in doc("pokemon")//pokemon
let $ata:= count($pok/ataque)
return
<pok>
{
  concat($ata, ". ", $pok/nombre/text())
}</pok>