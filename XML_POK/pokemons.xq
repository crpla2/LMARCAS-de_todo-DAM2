<pokemons>{
  for $pok in doc ("pokemon")//pokemon
  let $cap := string($pok/@f_captura)
  order by $pok/nombre
  return
  <pokemon>{
    $pok//nombre,
    <capturado>{
               $cap
    }</capturado>,
    $pok//pc
  }</pokemon> 
}</pokemons>

 