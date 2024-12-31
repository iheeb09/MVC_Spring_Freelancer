package tn.essat.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tn.essat.model.Message;
@Repository
public interface IMessage extends JpaRepository<Message, Integer>{
	public List<Message> findByUserreceiveId(Integer userId);

    public	List<Message> findByUsersendId(Integer userId);
	
}

