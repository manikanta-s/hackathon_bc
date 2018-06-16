/**
 * 
 */
package com.krishna.seatbooking.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.krishna.seatbooking.dto.Role;
import com.krishna.seatbooking.dto.User;
import com.krishna.seatbooking.repository.UserRepository;

/**
 * @author manikanta.s
 *
 */
@Service("userDetailsServiceImpl")
public class UserDetailsServiceImpl implements UserDetailsService {
	

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	/* (non-Javadoc)
	 * @see org.springframework.security.core.userdetails.UserDetailsService#loadUserByUsername(java.lang.String)
	 */
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		com.krishna.seatbooking.dto.User user = userRepository.findByUserName(username);
		
		if(user == null || user.getUserName() == null) {
			throw new UsernameNotFoundException(username + " is not available in the records.");
		} else {
			return new org.springframework.security.core.userdetails.User(user.getUserName(), user.getPassword(),
					true, true, true, true, getAuthorities(user.getRoles()));
		}
	}

	private Collection<? extends GrantedAuthority> getAuthorities(Collection<Role> roles) {
		// TODO Auto-generated method stub
		List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
		
		roles.stream().map(el -> el.getName()).collect(Collectors.toList()).forEach( authority -> {
			GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(authority);
			grantedAuthorities.add(grantedAuthority);
		});
		
		return grantedAuthorities;
	}
	
	public boolean registerUser(HttpServletRequest request) {
		userRepository.save(getUser(request));
		return true;
	}

	private User getUser(HttpServletRequest request) {
		User user = User.builder().firstName(request.getParameter("firstname"))
				.lastName(request.getParameter("lastname")).userName(request.getParameter("username"))
				.password(passwordEncoder.encode(request.getParameter("password")))
				.location(request.getParameter("location")).createdAt(Calendar.getInstance().getTime())
				.updatedAt(Calendar.getInstance().getTime()).build();

		return user;
	}

}
