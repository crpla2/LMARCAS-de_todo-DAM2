(: ejer 18:)
if (some $pok in doc("pokemon")//pokemon
satisfies (count($pok/ataque)>2))
then
  doc("pokemon")
else 
 ()