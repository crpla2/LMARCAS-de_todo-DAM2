<ataques>{
for$pok in doc("pokemon")//pokemon
return
   if(count($pok//ataque)=1) then (
   <ataque>{
      <nombre> {$pok//nombre/text()}</nombre> ,
      <a_nombre>{$pok//a_nombre/text()}</a_nombre>,
      <potencia>{$pok/ataque/potencia/text()}</potencia>
    }</ataque>
   )
   else ( 
     if((count($pok//ataque)=2))then(
        <ataque>{
          <nombre>{$pok//nombre/text()}</nombre> ,
          <a_nombre>{$pok/ataque[1]/a_nombre/text()}</a_nombre>,
           <potencia>{$pok/ataque[1]/potencia/text()}</potencia>
        }</ataque>,
       <ataque>{
          <nombre>{$pok//nombre/text()}</nombre> ,
          <a_nombre>{$pok/ataque[2]/a_nombre/text()}</a_nombre>,
           <potencia>{$pok/ataque[2]/potencia/text()}</potencia>
        }</ataque>
       
     )else(
        <ataque>{
          <nombre>{$pok//nombre/text()}</nombre> ,
          <a_nombre>{$pok/ataque[1]/a_nombre/text()}</a_nombre>,
           <potencia>{$pok/ataque[1]/potencia/text()}</potencia>
        }</ataque>,
       <ataque>{
          <nombre>{$pok//nombre/text()}</nombre> ,
          <a_nombre>{$pok/ataque[2]/a_nombre/text()}</a_nombre>,
           <potencia>{$pok/ataque[2]/potencia/text()}</potencia>
        }</ataque>,
        <ataque>{
          <nombre>{$pok//nombre/text()}</nombre> ,
          <a_nombre>{$pok/ataque[3]/a_nombre/text()}</a_nombre>,
           <potencia>{$pok/ataque[3]/potencia/text()}</potencia>
        }</ataque>
     )
   )
}</ataques>