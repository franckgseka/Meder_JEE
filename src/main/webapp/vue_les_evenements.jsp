
<br/>
	<h2> Liste des evenements </h2>
	<table border ="1">
		<tr>  
			<td>  Id Evenement </td> <td> D�signation </td>
			<td>  Prix </td> <td> Quantit� </td>
			<td>  Cat�gorie </td> <td> Op�rations </td> 
		</tr>
		<%
		for (Evenement unEvenement : lesEvenements)
		{
			out.print ("<tr><td>"+unEvenement.getIdevenement() +"</td>"
					+"<td>"+unEvenement.getDesignation() +"</td>"
					+"<td>"+unEvenement.getPrix() +"</td>"
					+"<td>"+unEvenement.getQte() +"</td>"
					+"<td>"+unEvenement.getCategorie() +"</td>"
					+"<td><a href='index.jsp?action=edit&idEvenement="+ unEvenement.getIdevenement() +"'>Modifier</a>"  
					+"<a href='index.jsp?action=sup&idEvenement="+ unEvenement.getIdevenement() +"'>Supprimer</a></td>"
					+ "</tr>");
		}
		%>
	</table>