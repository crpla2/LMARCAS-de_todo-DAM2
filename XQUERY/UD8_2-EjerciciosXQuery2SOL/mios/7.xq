(:7  Consulta que devuelve los nombres ordenados alfabéticamente de los pokemon que tienen 
un ataque llamado “Avalancha”:)
for $pok in doc ("pokemon")/pokedex/pokemon
where $pok /ataque/a_nombre="Avalancha"
order by $pok//nombre
return $pok//nombre/text()