<TiPoks>{
for$pok in doc("pokemon")//pokemon
return
   if(count($pok//tipo)=1) then (
   <tipoPokemon>{
      <nombre> {$pok//nombre/text()}</nombre> ,
      <tipo>{$pok//tipo/text()}</tipo>
    }</tipoPokemon>
   )
   else ( 
   <tipoPokemon>{
      <nombre>{$pok//nombre/text()}</nombre> ,
      <tipo>{$pok//tipo[1]/text()}</tipo>
    }</tipoPokemon>,
   <tipoPokemon>{
      <nombre>{$pok//nombre/text()}</nombre> ,
      <tipo>{$pok//tipo[2]/text()}</tipo>
    }</tipoPokemon>
   )
}</TiPoks>