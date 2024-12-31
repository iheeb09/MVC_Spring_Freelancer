package tn.essat.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
@Entity
public class Profil {
@Id@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	private Integer id ;
	private Integer nbExperience ;
	private String biographie;
	private String skills ;
	private String tarif;
	@ManyToOne @JoinColumn(name ="user_id")
	private User freelancer;
    private String photo;
	public Profil() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Profil(Integer id, Integer nbExperience, String biographie, String skills, String tarif, User freelancer,
			String photo) {
		super();
		this.id = id;
		this.nbExperience = nbExperience;
		this.biographie = biographie;
		this.skills = skills;
		this.tarif = tarif;
		this.freelancer = freelancer;
		this.photo = photo;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getNbExperience() {
		return nbExperience;
	}
	public void setNbExperience(Integer nbExperience) {
		this.nbExperience = nbExperience;
	}
	public String getBiographie() {
		return biographie;
	}
	public void setBiographie(String biographie) {
		this.biographie = biographie;
	}
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}
	public String getTarif() {
		return tarif;
	}
	public void setTarif(String tarif) {
		this.tarif = tarif;
	}
	public User getFreelancer() {
		return freelancer;
	}
	public void setFreelancer(User freelancer) {
		this.freelancer = freelancer;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}





















}