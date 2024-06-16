package com.backend.filter;

import com.backend.security.CustomUserDetailService;
//import javax.servlet.FilterChain;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
//import org.springframework.util.StringUtils;
//import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

public class JwtAuthFilter {

//    @Autowired
//    private JwtTokenProvider jwtTokenProvider;
//
//    @Autowired
//    private CustomUserDetailService customUserDetailService;
//
//    private static final Logger logger = LoggerFactory.getLogger(JwtAuthFilter.class);
//
//    @Override
//    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
//        try {
//            String jwt = parseJwt(request);
//            if (jwt != null && jwtTokenProvider.validateJwtToken(jwt)) {
//                // lấy userNam từ chuỗi JWT
//                String username = jwtTokenProvider.getUserNameFromJwtToken(jwt);
//                // lấy thông tin người dùng từ USerID
//                UserDetails userDetails = customUserDetailService.loadUserByUsername(username);
//
//                //nếu người dùng hợp lệ set thông tin cho security context
//                UsernamePasswordAuthenticationToken authentication =
//                        new UsernamePasswordAuthenticationToken(
//                                userDetails,
//                                null,
//                                userDetails.getAuthorities());
//                authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
//
//                SecurityContextHolder.getContext().setAuthentication(authentication);
//            }
//        } catch (Exception e) {
//            logger.error("Không thể đặt xác thực người dùng: {}", e);
//        }
//
//        filterChain.doFilter(request, response);
//    }
//
//
//    // check jwt
//    private String parseJwt(HttpServletRequest request) {
//        String headerAuth = request.getHeader("Authorization");
//        // kiểm tra xem header Authorization có chứa jwt không
//        if (StringUtils.hasText(headerAuth) && headerAuth.startsWith("Bearer ")) {
//            return headerAuth.substring(7);
//        }
//
//        return null;
//    }
}
