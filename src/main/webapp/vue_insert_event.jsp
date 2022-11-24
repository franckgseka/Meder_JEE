<h2> Ajout d'un evenement </h2>

<form method="post" action="">
<table>
	<tr> 
	<td> Désignation </td>
	<td> <input type="text" name="designation" 
	value = '<%=(unEvenement!=null)?unEvenement.getDesignation():""%>' ></td>
	</tr>
	<tr> 
	<td> Prix </td>
	<td> <input type="text" name="prix"
	value = '<%=(unEvenement!=null)?unEvenement.getPrix():""%>' ></td>
	</tr>
	<tr> 
	<td> Quantité </td>
	<td> <input type="text" name="qte"
	value = '<%=(unEvenement!=null)?unEvenement.getQte():""%>' ></td>
	</tr>
	<tr> 
	<td> categorie </td>
	<td> <input type="text" name="categorie"
	value = '<%=(unEvenement!=null)?unEvenement.getCategorie():""%>' ></td>
	</tr>
	<tr> 
	<td> <input type ="reset" name="Annuler" value="Annuler"> </td>
	<td> <input type ="submit" 
	<%=(unEvenement!=null)? " name='Modifier' value='Modifier' " : 
		" name='Valider' value='Valider' " %> > 
	</td>
	</tr>
</table>
	<%=(unEvenement!=null)?"<input type='hidden' name='idevent' "
	+ " value = '"+unEvenement.getIdevenement()+"' > " : ""%>
</form>