<html>
 <head>
  <meta charset="utf-8">
  <title>Mechanik</title>
 </head>
 <body>
 <h1>Właściciele samochodów</h1>
  <table border="1">
   <tr>
     <th>Marka</th><th>Model</th><th>Właściciel</th>
   </tr>
<?php
include "polacz.php";
if ($sql =  $baza->prepare("SELECT samochody.marka, samochody.model, wlasciciel.imie FROM posiada INNER JOIN samochody ON samochody.numer_nadwozia=posiada.VIN INNER JOIN wlasciciel ON wlasciciel.PESEL=posiada.PESEL ORDER BY posiada.VIN;"))
{
        $sql->execute();
        $sql->bind_result($marka, $model, $imie);
        while ($sql->fetch())
        {
                echo "<tr>
                        <td>$marka</td>
                        <td>$model</td>
                        <td>$imie</td>
                   </tr>";
        }
        $sql->close();
 }
else die( "Błąd w zapytaniu SQL! Sprawdź kod SQL w PhpMyAdmin: ". $baza->error );

 $baza->close();
?>
  </table>
 </body>
</html>