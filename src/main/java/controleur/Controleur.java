package controleur;

import java.util.ArrayList;

import javax.lang.model.element.Element;

import modele.Modele;

public class Controleur
{
	public static ArrayList<Evenement> selectAllEvenements()
	{
		ArrayList<Evenement> lesEvenements = Modele.selectAllEvenements(); 
		//ici on fait les controles sur les données avant de les 
		// envoyer a la vue. 
		return lesEvenements; 
	}
	public static void insertEvenement(Evenement unEvenement)
	{
		Modele.insertEvenement(unEvenement);
	}
	public static void deleteEvenement(int idEvenement)
	{
		Modele.deleteEvenement(idEvenement);
	}
	public static void updateEvenement(Evenement unEvenement)
	{
		Modele.updateEvenement(unEvenement);
	}
	public static Evenement selectWhere(int idEvent)
	{
		return Modele.selectWhere(idEvent);
	}
	public static User selectWhereUser(String email, String mdp)
	{
		return Modele.selectWhereUser(email, mdp);
	}
	
}










