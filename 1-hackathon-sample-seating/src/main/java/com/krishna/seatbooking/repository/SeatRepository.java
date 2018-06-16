package com.krishna.seatbooking.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.krishna.seatbooking.dto.Seat;

public interface SeatRepository extends JpaRepository<Seat, Long> {
	
	public List<Seat> findAllBySectionId(Long sectionId);
}
