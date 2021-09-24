package devpro.shop14.MVCConf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.rememberme.InMemoryTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

@EnableWebSecurity
@Configuration
public class SpringSecurityConf extends WebSecurityConfigurerAdapter {

	@Autowired
	UserDetailsService detailsService;

	@Override
	protected void configure(final HttpSecurity http) throws Exception {
		
		http.csrf().disable();
		
		http.authorizeRequests().antMatchers("/cart/**").hasAnyAuthority("GUEST", "ADMIN");
		
		http.authorizeRequests().antMatchers("/admin/**").hasAuthority("ADMIN");
		
		http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/404");
		
		http.authorizeRequests()
				.and()

				// cấu hình trang đăng nhập
				.formLogin().loginPage("/manager-log-in").loginProcessingUrl("/login")
				.failureUrl("/manager-log-in?login_error=true")

				.and()

				// cấu hình cho phần logout
				.logout().logoutUrl("/log-out").logoutSuccessUrl("/home").invalidateHttpSession(true)
				.deleteCookies("JSESSIONID");
				
				// Cấu hình Remember Me.
				http.authorizeRequests().and() //
						.rememberMe().tokenRepository(this.persistentTokenRepository()) //
						.tokenValiditySeconds(1 * 24 * 60 * 60); // 24h
	}
	
	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
	    InMemoryTokenRepositoryImpl memory = new InMemoryTokenRepositoryImpl();
	    return memory;
	}

	@Autowired
	public void configureGloabal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(detailsService).passwordEncoder(new BCryptPasswordEncoder(4));
	}

}
