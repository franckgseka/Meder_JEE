<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="controleur.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Meder</title>
 <link rel="stylesheet" href="style.css">
</head>
<body>
	<center>
	<h1> Gestion des Evenements  </h1>
	
	<%! Evenement unEvenement= null; %>
	
	
	
	<%
	
		if ((String)session.getAttribute("email") == null) {
	%>
	<%@include file="vue_connexion.jsp" %>
	<%
	}else {
		System.out.print("Bienvenue " + session.getAttribute("nom")); 
		System.out.print("<form method ='post'> <input type='submit'"
		  + "name='deConnexion' value='déconnexion'></form>"); 
	}
	
	if (request.getParameter("deConnexion")!= null)
	{
		session.invalidate (); 
	}
	
	if (request.getParameter("SeConnecter") != null)
	{
		String email = request.getParameter("email"); 
		String mdp = request.getParameter("mdp"); 
		
		User unUser = Controleur.selectWhereUser(email, mdp); 
		if (unUser == null)
		{
			System.out.print("<br/> Veuillez vérifier vos identifiants");
		}else {
			//création de la session. 
			System.out.println("on est d");
			session.setAttribute ("email", "jerghkljrf");
			session.setAttribute ("role", unUser.getRole());
			session.setAttribute ("nom", unUser.getNom());
			session.setAttribute ("prenom", unUser.getPrenom());
		}
		
	}
	
	 
	if ((String)session.getAttribute("email") != null) {
		
		if (((String)session.getAttribute("role")).equals("admin")) {
	%>
	
	<%
		if (request.getParameter("Valider") != null)
		{
			String designation = request.getParameter("designation"); 
			String categorie = request.getParameter("categorie"); 
			float prix = 0; 
			int qte = 0; 
			try{
				prix = Float.parseFloat(request.getParameter("prix"));
			}
			catch (NumberFormatException exp)
			{
				out.print("<br/> Erreur de saisie du prix");
			}
			try{
				qte = Integer.parseInt(request.getParameter("qte"));
			}
			catch (NumberFormatException exp)
			{
				out.print("<br/> Erreur de saisie de la quantité");
			}
			if (prix > 0 && qte >0){
				Evenement unEvenement = new Evenement (designation, categorie, qte, prix);
				Controleur.insertEvenement(unEvenement);
			}
		}
		if (request.getParameter("action") != null && request.getParameter("idEvenement")!= null)
		{
			int idEvent = Integer.parseInt(request.getParameter("idEvenement"));
			if (request.getParameter("action").equals("sup"))
			{
				int idEvenement = Integer.parseInt(request.getParameter("idEvenement"));
				Controleur.deleteEvenement(idEvenement);
			}
			else if (request.getParameter("action").equals("edit"))
            {
                unEvenement = Controleur.selectWhere(idEvent);
            }
		}
		}
	%>
	<%@include file="vue_insert_event.jsp" %>
	
	<%
    if (request.getParameter("Modifier") != null)
    {
        String designation = request.getParameter("designation"); 
        String categorie = request.getParameter("categorie"); 
        float prix = 0; 
        int qte = 0; 
        try{
            prix = Float.parseFloat(request.getParameter("prix"));
        }
        catch (NumberFormatException exp)
        {
            out.print("<br/> Erreur de saisie du prix");
        }
        try{
            qte = Integer.parseInt(request.getParameter("qte"));
        }
        catch (NumberFormatException exp)
        {
            out.print("<br/> Erreur de saisie de la quantité");
        }
        int idEvent = Integer.parseInt(request.getParameter("idEvenement"));
        if (prix > 0 && qte >0){
            Evenement unEvenement = new Evenement (designation, categorie,idEvent, qte, prix);
            Controleur.updateEvenement(unEvenement);
        }
       
    }
   %>
		<%
		ArrayList<Evenement> lesEvenements = Controleur.selectAllEvenements(); 
	%>
	<%@include file="vue_les_evenements.jsp" %>
	<%} %>
	</center>
</body>
</html>