package controleur;

public class Evenement {
	private String designation, categorie; 
	private int idevenement, qte; 
	private float prix;
	
	public Evenement(String designation, String categorie, int idevenement, int qte, float prix) {	 
		this.designation = designation;
		this.categorie = categorie;
		this.idevenement = idevenement;
		this.qte = qte;
		this.prix = prix;
	}
	
	public Evenement(String designation, String categorie,  int qte, float prix) {
		this.designation = designation;
		this.categorie = categorie;
		this.idevenement = 0;
		this.qte = qte;
		this.prix = prix;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getCategorie() {
		return categorie;
	}

	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}

	public int getIdevenement() {
		return idevenement;
	}

	public void setIdevenement(int idevenement) {
		this.idevenement = idevenement;
	}

	public int getQte() {
		return qte;
	}

	public void setQte(int qte) {
		this.qte = qte;
	}

	public float getPrix() {
		return prix;
	}

	public void setPrix(float prix) {
		this.prix = prix;
	}
	
}
