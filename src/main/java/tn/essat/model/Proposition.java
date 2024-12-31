package tn.essat.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Proposition {

@Id@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	private Integer id ;
	private Integer montant ;
	private String delai;
	private String description ;
	@ManyToOne @JoinColumn(name ="projet_id")
	private Project proj;
	@ManyToOne @JoinColumn(name ="user_id")
	private User freelancer;
	
	
	
	
	
	
	
	public Proposition(Integer id, Integer montant, String delai, String description, Project proj, User freelancer) {
		super();
		this.id = id;
		this.montant = montant;
		this.delai = delai;
		this.description = description;
		this.proj = proj;
		this.freelancer = freelancer;
	}
	public Proposition() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getMontant() {
		return montant;
	}
	public void setMontant(Integer montant) {
		this.montant = montant;
	}
	public String getDelai() {
		return delai;
	}
	public void setDelai(String delai) {
		this.delai = delai;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Project getProj() {
		return proj;
	}
	public void setProj(Project proj) {
		this.proj = proj;
	}
	public User getFreelancer() {
		return freelancer;
	}
	public void setFreelancer(User freelancer) {
		this.freelancer = freelancer;
	}
	
	
	
	
	
}
