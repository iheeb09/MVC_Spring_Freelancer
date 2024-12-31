 package tn.essat.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;

@Entity

public class Project {
	@Id@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	private Integer id ;
	private String titre ;
	private String description ;
	private float budget ; 
	private String date_limite;
	private int nbre_heures ;
	private String technologies ;
	private String etat ;
	@ManyToOne @JoinColumn(name ="client_id")
	private User client;
	@OneToMany(mappedBy = "proj", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Proposition> propositions;
	public Project() {
		super(); 
		// TODO Auto-generated constructor stub
	}
	
	public Project(Integer id, String titre, String description, float budget, String date_limite, int nbre_heures,
			String technologies, String etat, User client, List<Proposition> propositions) {
		super();
		this.id = id;
		this.titre = titre;
		this.description = description;
		this.budget = budget;
		this.date_limite = date_limite;
		this.nbre_heures = nbre_heures;
		this.technologies = technologies;
		this.etat = etat;
		this.client = client;
		this.propositions = propositions;
	}

	public Project(Integer id, String titre, String description, float budget, String date_limite, int nbre_heures,
			String technologies, String etat, User client) {
		super();
		this.id = id;
		this.titre = titre;
		this.description = description;
		this.budget = budget;
		this.date_limite = date_limite;
		this.nbre_heures = nbre_heures;
		this.technologies = technologies;
		this.etat = etat;
		this.client = client;
		this.propositions = new ArrayList <Proposition>();
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getBudget() {
		return budget;
	}
	public void setBudget(float budget) {
		this.budget = budget;
	}
	public String getDate_limite() {
		return date_limite;
	}
	public void setDate_limite(String date_limite) {
		this.date_limite = date_limite;
	}
	public int getNbre_heures() {
		return nbre_heures;
	}
	public void setNbre_heures(int nbre_heures) {
		this.nbre_heures = nbre_heures;
	}
	public String getTechnologies() {
		return technologies;
	}
	public void setTechnologies(String technologies) {
		this.technologies = technologies;
	}
	public String getEtat() {
		return etat;
	}
	public void setEtat(String etat) {
		this.etat = etat;
	}
	public User getClient() {
		return client;
	}
	public void setClient(User client) {
		this.client = client;
	}

	public List<Proposition> getPropositions() {
		return propositions;
	}

	public void setPropositions(List<Proposition> propositions) {
		this.propositions = propositions;
	}
	
	
}

