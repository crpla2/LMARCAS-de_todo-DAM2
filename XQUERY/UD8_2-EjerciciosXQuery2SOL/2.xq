(: Ejercicio 2: Mediante "at" devuelve la posicion de cada pokemon como un atributo como muestra el ejemplo:
<pokemon pos=1>Bulbasaur</pokemon>
<pokemon pos=2>Charmander</pokemon>:)

for $pok at $i in doc("pokemon")//pokemon
return <pokemon pos="{$i}"> {$pok/nombre/text()}</pokemon>