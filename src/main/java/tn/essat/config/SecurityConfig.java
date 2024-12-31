package tn.essat.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import tn.essat.service.IUserService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	IUserService userserv;

	@Bean
	public PasswordEncoder cryptage() {

		return new BCryptPasswordEncoder(); /// hedha ya3ml cryptage lel password
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		PasswordEncoder crypt = cryptage(); // toujours pour tt les confg

		auth.userDetailsService(userserv).passwordEncoder(crypt);// dynamique

	}
	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.formLogin().loginPage("/login").defaultSuccessUrl("/", true) // Redirige l’usr vers la page
																			// d’accueil après une connexion
																			// réussie.
				.failureUrl("/login?error=true").permitAll(); // Redirige vers /login avec un paramètre d’erreur en cas
																// d’échec.
		
		
	
		http.authorizeRequests().antMatchers("/src/**").permitAll(); // lien bootstrap

		http.authorizeRequests().antMatchers("/registerFreelancer", "/registerClient","/saveFreelancer","/saveClient").permitAll();
		
		//http.authorizeRequests().antMatchers("/projects/client/**").hasAuthority("CLIENT");
		//http.authorizeRequests().antMatchers("/saveProposition").hasAuthority("FREELANCER");
		http.authorizeRequests().anyRequest().authenticated();
		http.csrf().disable();
	}



}
