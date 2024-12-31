package tn.essat.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tn.essat.model.Role;
import tn.essat.model.User;


@Repository
public interface IUser extends JpaRepository<User, Integer> {
	

	public User findByUsername(String username);
	public List<User> findByRole(Role role);

}
