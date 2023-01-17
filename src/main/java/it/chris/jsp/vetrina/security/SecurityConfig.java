package it.chris.jsp.vetrina.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
public class SecurityConfig {

    @Bean
    public InMemoryUserDetailsManager userDetailsManager(PasswordEncoder passwordEncoder) {
        UserDetails userDetails = User.withUsername("user")
                .password(passwordEncoder.encode("password"))
                .roles("USER")
                .build();
        return new InMemoryUserDetailsManager(userDetails);
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
        httpSecurity
                .csrf().disable()
                .formLogin()
                .and()
                .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .clearAuthentication(true)
                .logoutSuccessUrl("/login")
                .deleteCookies()
                .invalidateHttpSession(true)
                .and()
                .authorizeRequests()
                .requestMatchers("/")
                .permitAll()
                .requestMatchers("/index")
                .permitAll()
                .requestMatchers("/skill")
                .permitAll()
                .requestMatchers("/project")
                .permitAll()
                .requestMatchers("/categoria/**")
                .authenticated()
                .requestMatchers("/project/**")
                .authenticated()
                .requestMatchers("/skill/**")
                .authenticated()
                .requestMatchers("/categoria/update/**")
                .authenticated()
                .requestMatchers("/project/update/**")
                .authenticated()
                .requestMatchers("/skill/update/**")
                .authenticated()
                .and()
                .httpBasic();
        return httpSecurity.build();
    }
}
