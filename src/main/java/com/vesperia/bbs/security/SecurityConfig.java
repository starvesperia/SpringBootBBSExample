package com.vesperia.bbs.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	CustomUserDetailsService memberDetailsService;
	
	@Autowired
	DataSource dataSource;
	
//	@Override
//	public void configure(WebSecurity web) throws Exception
//	{
		//web.ignoring().antMatchers("/**");
//	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception
	{
		http.authorizeRequests()
			.antMatchers("/bbs/**").authenticated()	
			.antMatchers("/**").permitAll()
			.and()
		.formLogin()
			.loginPage("/SignIn")
			.loginProcessingUrl("/SignIn")
			.defaultSuccessUrl("/Home")
			.successHandler(SuccessHandler())
			.failureUrl("/SignIn")
			.permitAll()
			.and()
//		.rememberMe()
//			.key("myAppKey")
//			.rememberMeParameter("remember-me")			
//			.rememberMeCookieName("remember-me")
//			.tokenValiditySeconds(86400)
//			.userDetailsService(memberDetailsService)
//			.tokenRepository(persistentTokenRepository())
//			.and()
		.logout()
			.logoutRequestMatcher(new AntPathRequestMatcher("/SignOut"))
			.logoutSuccessUrl("/Home")
			.invalidateHttpSession(true)
			.deleteCookies("JSESSIONID", "remember-me")
			.permitAll();
	}
	
	@Bean
	public PasswordEncoder PWEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public AuthenticationSuccessHandler SuccessHandler() {
	  return new SignInSuccessHandler("/Home");
	}
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(memberDetailsService).passwordEncoder(PWEncoder());
	}
	
	@Bean
    public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl tokenRepo = new JdbcTokenRepositoryImpl();
		tokenRepo.setDataSource(dataSource);
		return tokenRepo;
    }
}
