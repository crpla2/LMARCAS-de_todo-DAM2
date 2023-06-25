
(:FUNCION QUE COMPRARA LOS POKEMON RESTANTES CON EL ULTIMO ELEGIDO Y DEVUELVE UNA LISTA CON POKEMON QUE NO REPITEN NI EL NOMBRE NI LOS TIPOS DEL ANTERIOR ORDENADOS POR MAYOR IDONEIDAD; RECIBE COMO PARAMETROS UN POKEMON Y UNA LISTA DE POKEMONS:)
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
                                      
(:FUNCION ESPECIFICA PARA LA COPA VOLADOR QUE PERMITE QUE SE REPITAN LOS TIPOS:)
declare function local:comparadorV($pok,$liga) 
                  {(for $p2 in $liga
                    let $nAtaques:=count($p2//ataque), $potMedia:=avg($p2//potencia)
                    order by $p2/pc/number() descending, $nAtaques descending, $potMedia descending 
                    return 
                    if($p2//nombre!=$pok//nombre)
                    then($p2))};                                      
                                      
(:VARIABLES QUE RECOGEN LOS POKEMON QUE CUMPLEN LAS ESPECIFICACIONES DE CADA LIGA ORDENADOS POR MAYOR IDONEIDAD:)
(:SUPERBALL:)
declare variable $Superball :=for $p in doc("pokemon")//pokemon
                               let $nAtaques:=count($p//ataque), $potMedia:=avg($p//potencia)
                               where $p/pc/number()<=1500
                               order by $p/pc/number() descending, $nAtaques descending, $potMedia descending 
                               return $p;
(:ULTRABALL:)                              
declare variable $Ultraball :=for $p in doc("pokemon")//pokemon
                              let $nAtaques:=count($p//ataque), $potMedia:=avg($p//potencia)
                              where $p/pc/number()<=2500
                              order by $p/pc/number() descending, $nAtaques descending, $potMedia descending 
                              return $p;         
(:MASTERBALL:)
declare variable $Masterball :=for $p in doc("pokemon")//pokemon
                               let $nAtaques:=count($p//ataque), $potMedia:=avg($p//potencia)
                               order by $p/pc/number() descending, $nAtaques descending, $potMedia descending 
                               return $p;
(:HALLOWEEN:)   
declare variable $Halloween :=for $p in doc("pokemon")//pokemon
                               let $nAtaques:=count($p//ataque), $potMedia:=avg($p//potencia)
                               where $p/pc/number()<=1500 and ($p//tipo='Veneno'or $p//tipo='Fantasma'or $p//tipo='Bicho'or $p//                                                                           tipo='Siniestro' or $p//tipo= 'Hada') 
                               order by $p/pc/number() descending, $nAtaques descending, $potMedia descending 
                               return $p;
(:VOLADOR:) 
declare variable $Volador :=for $p in doc("pokemon")//pokemon
                            let $nAtaques:=count($p//ataque), $potMedia:=avg($p//potencia)
                            where $p/pc/number()<=1500 and $p//tipo='Volador'
                            order by $p/pc/number() descending, $nAtaques descending, $potMedia descending 
                            return $p;  
(:CAPTURA:)
declare variable $Captura :=for $p in doc("pokemon")//pokemon
                            let $nAtaques:=count($p//ataque), $potMedia:=avg($p//potencia)
                            where $p/pc/number()<=1500 and $p//@f_captura/data()>=2022
                            order by $p/pc/number() descending, $nAtaques descending, $potMedia descending 
                            return $p;
(:ELEMENTAL:)
declare variable $Elemental :=for $p in doc("pokemon")//pokemon
                              let $nAtaques:=count($p//ataque), $potMedia:=avg($p//potencia)
                              where $p/pc/number()<=500 and ($p//tipo='Fuego'or $p//tipo='Agua'or $p//tipo='Planta') 
                              order by $p/pc/number() descending, $nAtaques descending, $potMedia descending 
                              return $p;                                                      
                                                   
(:VARIABLES QUE RECOGEN EL RESULTADO DE LA FUNCION "COMPARADOR":)
(:SUPERBALL:)
declare variable $SBcomp1 :=local:comparador($SBpok1,$Superball);
declare variable $SBcomp2 :=local:comparador($SBpok2,$SBcomp1);
(:ULTRABALL:)
declare variable $UBcomp1 :=local:comparador($UBpok1,$Ultraball);
declare variable $UBcomp2 :=local:comparador($UBpok2,$UBcomp1);
(:MASTERBALL:)
declare variable $MBcomp1 :=local:comparador($MBpok1,$Masterball);
declare variable $MBcomp2 :=local:comparador($MBpok2,$MBcomp1);
(:HALLOWEEN:)   
declare variable $Hcomp1 :=local:comparador($Hpok1,$Halloween);
declare variable $Hcomp2 :=local:comparador($Hpok2,$Hcomp1);
(:VOLADOR:) 
declare variable $Vcomp1 :=local:comparadorV($Vpok1,$Volador);
declare variable $Vcomp2 :=local:comparadorV($Vpok2,$Vcomp1);   
(:CAPTURA:)
declare variable $Ccomp1 :=local:comparador($Cpok1,$Captura);
declare variable $Ccomp2 :=local:comparador($Cpok2,$Ccomp1);
(:ELEMENTAL:)
declare variable $Ecomp1 :=local:comparador($Epok1,$Elemental);
declare variable $Ecomp2 :=local:comparador($Epok2,$Ecomp1);

(:VARIABLES QUE RECOGE EL PRIMER POKEMON QUE CUMPLE CON LAS ESPECIFICACIONES DE CADA LIGA:)
(:SUPERBALL:)
declare variable $SBpok1 :=($Superball)[1]; 
(:ULTRABALL:)
declare variable $UBpok1 :=($Ultraball)[1]; 
(:MASTERBALL:)
declare variable $MBpok1 :=($Masterball)[1]; 
(:HALLOWEEN:)   
declare variable $Hpok1 :=($Halloween)[1]; 
(:VOLADOR:) 
declare variable $Vpok1 :=($Volador)[1];   
(:CAPTURA:)
declare variable $Cpok1 :=($Captura)[1]; 
(:ELEMENTAL:)
declare variable $Epok1 :=($Elemental)[1]; 

(:VARIABLES QUE RECOGEN EL PRIMER POKEQUEMON DE LA LISTA OBTENIDA POR LA FUNCION COMPARADOR:)
(:SUPERBALL:)
declare variable $SBpok2 :=($SBcomp1)[1]; 
declare variable $SBpok3 :=($SBcomp2)[1]; 
(:ULTRABALL:)
declare variable $UBpok2 :=($UBcomp1)[1]; 
declare variable $UBpok3 :=($UBcomp2)[1]; 
(:MASTERBALL:)
declare variable $MBpok2 :=($MBcomp1)[1]; 
declare variable $MBpok3 :=($MBcomp2)[1]; 
(:HALLOWEEN:)   
declare variable $Hpok2 :=($Hcomp1)[1]; 
declare variable $Hpok3 :=($Hcomp2)[1]; 
(:VOLADOR:) 
declare variable $Vpok2 :=($Vcomp1)[1]; 
declare variable $Vpok3 :=($Vcomp2)[1];    
(:CAPTURA:)
declare variable $Cpok2 :=($Ccomp1)[1]; 
declare variable $Cpok3 :=($Ccomp2)[1]; 
(:ELEMENTAL:)
declare variable $Epok2 :=($Ecomp1)[1]; 
declare variable $Epok3 :=($Ecomp2)[1]; 

(:RESULTADO DE LAS CONSULTAS:)
<XML>{
  <RESUMEN>{
    '&#10;Liga Super Ball: ',$SBpok1/nombre/text(),', ',$SBpok2/nombre/text(),' y ',$SBpok3/nombre/text(),
    '&#10;Liga Ultra Ball: ',$UBpok1/nombre/text(),', ',$UBpok2/nombre/text(),' y ',$UBpok3/nombre/text(),
    '&#10;Liga Master Ball: ',$MBpok1/nombre/text(),', ',$MBpok2/nombre/text(),' y', $MBpok3/nombre/text(),
    '&#10;Copa Halloween: ',$Hpok1/nombre/text(),' y ',$Hpok2/nombre/text(),
    '&#10;Copa Volador: ',$Vpok1/nombre/text(),' , ',$Vpok2/nombre/text(),' y ',$Vpok3/nombre/text(),
    '&#10;Copa Captura: ',$Cpok1/nombre/text(),', ',$Cpok2/nombre/text(),' y ',$Cpok3/nombre/text(),
    '&#10;Copa Elemental: ',$Epok1/nombre/text(),', ',$Epok2/nombre/text(),' y ',$Epok3/nombre/text(),'&#10;'
  } </RESUMEN>,
  <LigaCombatesGO>{
  <LigaSuperBall>{$SBpok1,$SBpok2,$SBpok3}</LigaSuperBall>,
  <LigaUltraBall>{$UBpok1,$UBpok2,$UBpok3}</LigaUltraBall>,
  <LigaMasterBall>{$MBpok1,$MBpok2,$MBpok3}</LigaMasterBall>,
  <CopaHalloween>{$Hpok1,$Hpok2,$Hpok3}</CopaHalloween>,
  <CopaVolador>{$Vpok1,$Vpok2,$Vpok3}</CopaVolador>,
  <CopaCaptura>{$Cpok1,$Cpok2,$Cpok3}</CopaCaptura>,
  <CopaElemental>{$Epok1,$Epok2,$Epok3}</CopaElemental>
}</LigaCombatesGO>
}</XML>