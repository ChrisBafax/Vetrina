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
        UserDetails adminDetails = User.withUsername("admin")
                .password(passwordEncoder.encode("password"))
                .roles("USER", "ADMIN")
                .build();
        return new InMemoryUserDetailsManager(userDetails, adminDetails);
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
                .requestMatchers("/").permitAll()
                .requestMatchers("/index").permitAll()
                .requestMatchers("/skill").permitAll()
                .requestMatchers("/project").permitAll()
                .requestMatchers("/categoria/view").authenticated()
                .requestMatchers("/project/view").authenticated()
                .requestMatchers("/skill/view").authenticated()
                .requestMatchers("/categoria/update/**").authenticated()
                .requestMatchers("/project/update/**").authenticated()
                .requestMatchers("/skill/update/**").authenticated()
                .requestMatchers("/categoria/create").hasRole("ADMIN")
                .requestMatchers("/project/create").hasRole("ADMIN")
                .requestMatchers("/skill/create").hasRole("ADMIN")
                .requestMatchers("/categoria/delete").hasRole("ADMIN")
                .requestMatchers("/project/delete").hasRole("ADMIN")
                .requestMatchers("/skill/delete").hasRole("ADMIN")
                .and()
                .httpBasic();
        return httpSecurity.build();
    }
}