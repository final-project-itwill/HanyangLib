/*
 * package kr.co.itwill.config;
 * 
 * import javax.sql.DataSource;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.context.annotation.Bean; import
 * org.springframework.context.annotation.Configuration; import
 * org.springframework.security.config.annotation.authentication.builders.
 * AuthenticationManagerBuilder; import
 * org.springframework.security.config.annotation.web.builders.HttpSecurity;
 * import org.springframework.security.config.annotation.web.configuration.
 * EnableWebSecurity; import
 * org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder; import
 * org.springframework.security.crypto.password.PasswordEncoder; import
 * org.springframework.security.web.SecurityFilterChain;
 * 
 * @Configuration
 * 
 * @EnableWebSecurity public class WebSecurityConfig {
 * 
 * // application.properties의 spring.datasource.에 기록된 사항들을 상속해온다
 * 
 * @Autowired private DataSource dataSource;
 * 
 * @Bean public SecurityFilterChain securityFilterChain(HttpSecurity http)
 * throws Exception { // http의 보안설정을 상속받아서 설정을 진행한다 http
 * .authorizeHttpRequests((requests) -> requests .antMatchers("/", "/css/**",
 * "/js/**", "/images/**", "/fonts/**").permitAll() // 이렇게 되어있는 url은 로그인 하지 않아도
 * 누구나 들어올 수 있다 .anyRequest().authenticated() // 그 외의 요청(명령어)들은 꼭 반드시 로그인을 해야 한다
 * ) .formLogin((form) -> form // antMatchers에서 정의되지 않은 것은 아래의 페이지를 통해 로그인 창으로
 * 넘어간다 .loginPage("/login/loginForm") .permitAll() ) .logout((logout) ->
 * logout.permitAll()); // 로그아웃을 처리한다
 * 
 * return http.build(); } // securityFilterChain() end
 * 
 * // jdbc 인증 설정
 * 
 * @Autowired public void configureGlobal(AuthenticationManagerBuilder auth)
 * throws Exception { auth.jdbcAuthentication() .dataSource(dataSource)
 * .passwordEncoder(passwordEncoder()) // 로그인 관련 쿼리문(Authentication) : 로그인 인증
 * .usersByUsernameQuery(" select m_id, m_pw, enabled " + " from login " +
 * " where m_id = ? ") // 권한 관련 쿼리문(Authroization) : 권한 확인
 * .authoritiesByUsernameQuery(" select login_id, role_id " +
 * " from user_role ur inner join login l on ur.login_id = l.login_id " +
 * " inner join role r on ur.role_id = r.role_id " + " where email = ?"); } //
 * configureGlobal
 * 
 * // 비밀번호를 더 안전하게 보호할 수 있도록 스프링에서 제공하는 객체
 * 
 * @Bean public static PasswordEncoder passwordEncoder() { return new
 * BCryptPasswordEncoder(); }
 * 
 * } // class end
 */