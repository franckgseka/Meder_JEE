package modele;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import controleur.Evenement ;
import controleur.User;

public class Modele
{
	private static Bdd uneBdd = new Bdd("localhost:8889","meder_jee","root", "root");
	
	//private static Bdd uneBdd = new Bdd("localhost:3306","stock_2021",
	// "root", "");
	
	public static ArrayList<Evenement> selectAllEvenements ()
	{
		ArrayList<Evenement> lesEvenements = new ArrayList<Evenement>();
		String requete = "select * from evenement ;"; 
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement(); 
			ResultSet desRes = unStat.executeQuery(requete); 
			while (desRes.next())
			{
				Evenement unEvenement = new Evenement(desRes.getString("designation"), 
						desRes.getString("categorie"), desRes.getInt("idevenement"), 
						desRes.getInt("qte"), desRes.getFloat("prix")); 
				
				lesEvenements.add(unEvenement);
			}
			unStat.close();
			desRes.close();
			uneBdd.seDeconnecter();
		}
		catch(SQLException exp) {
			System.out.println("Erreur Execution : " + requete);
			exp.printStackTrace();
		}
		return lesEvenements;
	}
	public static void insertEvenement(Evenement unEvenement)
	{
		String requete ="insert into evenement values (null,'"
				+unEvenement.getDesignation()+"','"
				+unEvenement.getPrix()+"','"
				+unEvenement.getQte()+"','"
				+unEvenement.getCategorie()+"'); "; 
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement(); 
			unStat.execute(requete); 
			unStat.close();
			uneBdd.seDeconnecter();
		}
		catch(SQLException exp) {
			System.out.println("Erreur de la requete :"+requete);
		}
	}
	public static void deleteEvenement (int idEvenement)
	{
		String requete ="delete from evenement where idevenement = "+idEvenement;
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement(); 
			unStat.execute(requete); 
			unStat.close();
			uneBdd.seDeconnecter();
		}
		catch(SQLException exp) {
			System.out.println("Erreur de la requete :"+requete);
		}
	}
	public static Evenement selectWhere (int idEvent)
	{
		Evenement unEvenement = null; 
		String requete = "select * from evenement where idevenement ="+idEvent; 
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement(); 
			ResultSet desRes = unStat.executeQuery(requete); 
			if (desRes.next())
			{
				 unEvenement = new Evenement(desRes.getString("designation"), 
						desRes.getString("categorie"), desRes.getInt("idevenement"), 
						desRes.getInt("qte"), desRes.getFloat("prix")); 
				 
			}
			System.out.println(requete);
			unStat.close();
			desRes.close();
			uneBdd.seDeconnecter();
		}
		catch(SQLException exp) {
			System.out.println("Erreur Execution : " + requete);
			exp.printStackTrace();
		}
		return unEvenement;
	}
	public static void updateEvenement (Evenement unEvenement) {
		String requete ="update Evenement set designation ='"
				+unEvenement.getDesignation()+"', prix = '"
				+unEvenement.getPrix()+"', qte='"
				+unEvenement.getQte()+"',categorie='"
				+unEvenement.getCategorie()
				+"' where idevenement=" + unEvenement.getIdevenement()+"; "; 
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement(); 
			unStat.execute(requete); 
			unStat.close();
			uneBdd.seDeconnecter();
		}
		catch(SQLException exp) {
			System.out.println("Erreur de la requete :"+requete);
		}
	}
	
	public static User selectWhereUser(String email,String mdp)
	{
		User unUser = null; 
		String requete = "select * from user where "
				+ " email ='"+email+"' and mdp='"+mdp+"';";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement(); 
			ResultSet desRes = unStat.executeQuery(requete); 
			if (desRes.next())
			{
				unUser = new User(desRes.getString("nom"), 
						desRes.getString("prenom"), desRes.getString("email"),
						desRes.getString("mdp"),desRes.getString("role")); 
				 
			}
			unStat.close();
			desRes.close();
			uneBdd.seDeconnecter();
		}
		catch(SQLException exp) {
			System.out.println("Erreur Execution : " + requete);
		}
		
		return unUser;
	}
	
}















