package com.krishna.seatbooking;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.krishna.seatbooking.dto.Seat;
import com.krishna.seatbooking.dto.Section;
import com.krishna.seatbooking.repository.SeatRepository;
import com.krishna.seatbooking.repository.SectionRepository;
import com.krishna.seatbooking.service.UserDetailsServiceImpl;

import lombok.val;

@CrossOrigin
@Controller
public class SeatingController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SectionRepository sectionsRepository;
	
	@Autowired
	private SeatRepository seatRepository;
	
	@Autowired
	private UserDetailsServiceImpl userDetailsService;
	
	@RequestMapping("/")
	public String home(Model model) {
		model.addAttribute("sections", getAllSections());
		return "home";
	}
	
	@RequestMapping("/login")
	public String login(Model model) {
		return "login";
	}
	
	@RequestMapping("/registration")
	public String registration(Model model) {
		return "registration";
	}
	
	// @RequestMapping(value="/register", method = RequestMethod.POST)
	@RequestMapping("/register")
	public String register(Model model, HttpServletRequest request) {
		boolean isValidUser = userDetailsService.registerUser(request);
		if (isValidUser) {
			model.addAttribute("user", request.getParameter("firstname"));
//			model.addAttribute("sections", getAllSections());
			model.addAttribute("registrationSuccessMsg", "Registration completed. Please login..");
//			return home(model);
			return "login";
		}
		return "register.html";
	}
	
	@RequestMapping("/bookTickets")
	public String bookTickets(Model model, HttpServletRequest request) {
		Double totalCost = 0.0;
		String selectedSeats[] = request.getParameterValues("testt");
		if (selectedSeats != null && selectedSeats.length != 0) {
			for (int i = 0; i < selectedSeats.length; i++) {
				Optional<Seat> seat = seatRepository.findById(Long.valueOf(selectedSeats[i]));
				seat.get().setAvailable(false);
				totalCost += seat.get().getSection().getCost();
				seatRepository.save(seat.get());
				model.addAttribute("costPerTicket", seat.get().getSection().getCost());
			}
		}
		model.addAttribute("totalTickets", selectedSeats.length);
		model.addAttribute("totalCost", totalCost);
		return "summary";
	}
	
	@RequestMapping("/seat/{sectionId}")
	public @ResponseBody List<Seat> seat(@PathVariable(value = "sectionId") Long sectionId, Model model) {
		val x = seatRepository.findAllBySectionId(sectionId);
		model.addAttribute("seats", x);
		return x;
	}
	
	private List<Section> getAllSections() {
		val x = sectionsRepository.findAll();
		return x;
	}
}