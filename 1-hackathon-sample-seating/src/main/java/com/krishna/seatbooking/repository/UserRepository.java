package com.krishna.seatbooking.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.krishna.seatbooking.dto.User;

public interface UserRepository extends JpaRepository<User, Long> {
	
	public User findByUserName(String userName);
}
