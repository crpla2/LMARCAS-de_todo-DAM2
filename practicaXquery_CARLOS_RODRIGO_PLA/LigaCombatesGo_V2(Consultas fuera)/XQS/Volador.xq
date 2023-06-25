(:VARIABLE QUE RECOGE LOS POKEMON QUE CUMPLEN LAS ESPECIFICACIONES DE LA LIGA ORDENADOS POR MAYOR IDONEIDAD:)
declare variable $Volador :=for $p in doc("pokemon")//pokemon
                            let $nAtaques:=count($p//ataque), $potMedia:=avg($p//potencia)
                            where $p/pc/number()<=1500 and $p//tipo='Volador'
                            order by $p/pc/number() descending, $nAtaques descending, $potMedia descending 
                            return $p;
                            
(:FUNCION QUE COMPRARA LOS POKEMON RESTANTES CON EL ULTIMO ELEGIDO Y DEVUELVE UNA LISTA CON POKEMON QUE NO REPITEN EL NOMBRE  DEL ANTERIOR ORDENADOS POR MAYOR IDONEIDAD:)
declare function local:comparador($pok,$liga) 
                  {(for $p2 in $liga
                    let $nAtaques:=count($p2//ataque), $potMedia:=avg($p2//potencia)
                    order by $p2/pc/number() descending, $nAtaques descending, $potMedia descending 
                    return 
                    if($p2//nombre!=$pok//nombre)
                    then($p2))};
                             
(:VARIABLES QUE RECOGEN EL RESULTADO DE LA FUNCION "COMPARADOR":)                      
declare variable $comp1 :=local:comparador($pok1,$Volador);
declare variable $comp2 :=local:comparador($pok2,$comp1);

(:VARIABLE QUE RECOGE EL PRIMER POKEMON QUE CUMPLE CON LAS ESPECIFICACIONES DE LA LIGA:)
declare variable $pok1 :=($Volador)[1];

(:VARIABLES QUE RECOGEN EL PRIMER POKEQUEMON DE LA LISTA OBTENIDA POR LA FUNCION COMPARADOR:)
declare variable $pok2 :=($comp1)[1]; 
declare variable $pok3 :=($comp2)[1]; 

(:RESULTADO DE LA CONSULTA:)
<CopaVolador>{$pok1,$pok2,$pok3}</CopaVolador>
