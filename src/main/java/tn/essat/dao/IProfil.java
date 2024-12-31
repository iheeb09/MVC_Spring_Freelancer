package tn.essat.dao;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tn.essat.model.Profil;

@Repository
public interface IProfil extends JpaRepository<Profil, Integer>{
	Optional <Profil> findByfreelancer(int user_id);
}