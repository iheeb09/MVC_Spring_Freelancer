package tn.essat.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import tn.essat.model.Project;


@Repository

public interface IProject extends JpaRepository<Project, Integer> {

	

	@Query("SELECT p FROM Project p WHERE p.client.role.role = :role")
	public List<Project> findAllByClientRole(@Param("role") String role);

	@Query("SELECT p FROM Project p LEFT JOIN FETCH p.propositions WHERE p.client.id = :clientId")
	public List<Project> findProjectsByClientId(@Param("clientId") int clientId);

	public List<Project> findByClientId(int id);


}
