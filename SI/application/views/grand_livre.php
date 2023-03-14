<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!DOCTYPE html>
<html>
<head>
	<title> Grand Livre </title>
</head>
<body>

<h1>Grand Livre</h1>
<p>
    <ul>
        <li> Periode du 01/01/13 </li>
        <li> au 31/12/13 </li>
    </ul>
</p>
<p>
    <ul>
        <li> Nom de la Societe </li>
        <li> Complete </li>
        <li> Tenue de Compte: AR </li>
    </ul>
</p>
<p>
    <ul>
        <li> Comptabilite 100 10 01 </li>
        <li> Date de tirage 08/03/23 </li>
        <li> a 10:03:55 </li>
        <li> Page: 1 </li>
    </ul>
</p>

<table border="1">
    <th>
        <td> Numero de compte </td>
        <td> Intitule des comptes </td>
        <td> Mouvements Debit </td>
        <td> Mouvements Credit </td>
        <td> Soldes Debit </td>
        <td> Soldes Credit </td>
    </th>
    <?php foreach($data as $d) {?>
    <tr>
        <td> <?php echo $d['numerocompte'];?> </td>
        <td> <?php echo $d['nomcompte'];?> </td>
        <td> <?php echo $d['mvt_debit'];?> </td>
        <td> <?php echo $d['mvt_credit'];?> </td>
        <td> <?php echo $d['solde_debit'];?> </td>
        <td> <?php echo $d['solde_credit'];?> </td>
    </tr>
    <?php } ?>
</table>
</body>
</html>