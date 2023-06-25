(:VARIABLE QUE RECOGE LOS POKEMON QUE CUMPLEN LAS ESPECIFICACIONES DE LA LIGA ORDENADOS POR MAYOR IDONEIDAD:)
declare variable $Captura :=for $p in doc("pokemon")//pokemon
                               let $nAtaques:=count($p//ataque), $potMedia:=avg($p//potencia)
                               where $p/pc/number()<=1500 and $p//@f_captura/data()>=2022
                               order by $p/pc/number() descending, $nAtaques descending, $potMedia descending 
                               return $p;
                               
(:FUNCION QUE COMPRARA LOS POKEMON RESTANTES CON EL ULTIMO ELEGIDO Y DEVUELVE UNA LISTA CON POKEMON QUE NO REPITEN NI EL NOMBRE NI LOS TIPOS DEL ANTERIOR ORDENADOS POR MAYOR IDONEIDAD:)
declare function local:comparador($pok,$liga) 
                          {(for $p2 in $liga
                            let $nAtaques:=count($p2//ataque), $potMedia:=avg($p2//potencia)
                            order by $p2/pc/number() descending, $nAtaques descending, $potMedia descending 
                            return
                              if(count($p2//tipo)>1 and count($pok//tipo)>1) 
                              then(for $tipo in $p2//tipo
                                   return 
                                     if($p2//nombre!=$pok//nombre and ($p2//tipo)[1]!=($pok//tipo)[1] 
                                         and($p2//tipo)[2]!=($pok//tipo)[2]) 
                                     then($p2))
                              else( 
                                if(count($p2//tipo)>1 and count($pok//tipo)=1) 
                                then(for $tipo in $p2//tipo
                                   return 
                                       if($p2//nombre!=$pok//nombre and ($p2//tipo)[1]!=($pok//tipo)[1] 
                                           and($p2//tipo)[2]!=($pok//tipo)[1]) 
                                       then($p2))
                                else(
                                  if(count($p2//tipo)=1 and count($pok//tipo)>1) 
                                  then(for $tipo in $p2//tipo
                                     return 
                                        if($p2//nombre!=$pok//nombre and ($p2//tipo)[1]!=($pok//tipo)[1] 
                                           and($p2//tipo)[1]!=($pok//tipo)[2]) 
                                        then($p2))
                                   else(
                                      if($p2//nombre!=$pok//nombre and ($p2//tipo)!=($pok//tipo))then $p2)))) };
                             
(:VARIABLES QUE RECOGEN EL RESULTADO DE LA FUNCION "COMPARADOR":)                                 
declare variable $comp1 :=local:comparador($pok1,$Captura);
declare variable $comp2 :=local:comparador($pok2,$comp1);

(:VARIABLE QUE RECOGE EL PRIMER POKEMON QUE CUMPLE CON LAS ESPECIFICACIONES DE LA LIGA:)
declare variable $pok1 :=($Captura)[1]; 

(:VARIABLES QUE RECOGEN EL PRIMER POKEQUEMON DE LA LISTA OBTENIDA POR LA FUNCION COMPARADOR:)
declare variable $pok2 :=($comp1)[1]; 
declare variable $pok3 :=($comp2)[1]; 

(:RESULTADO DE LA CONSULTA:)
<CopaCaptura>{$pok1,$pok2,$pok3}</CopaCaptura>
