package com.backend.controller;

import com.backend.dto.request.LoginRequest;
import com.backend.dto.request.SignupRequest;
import com.backend.dto.response.JwtResponse;
import com.backend.dto.response.MessageResponse;
import com.backend.entity.Account;
import com.backend.entity.Role;
import com.backend.entity.login.ERole;
import com.backend.filter.JwtTokenProvider;
import com.backend.repository.AccountRepository;
import com.backend.repository.QuyenHanRepository;
import com.backend.security.CustomUserDetails;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@RestController
public class LoginController {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private QuyenHanRepository roleRepository;

    @Autowired
    private PasswordEncoder encoder;

    @Autowired
    private JwtTokenProvider jwtUtils;

    @PostMapping("/signin")
    public ResponseEntity<?> authenticateUser(@Valid @RequestBody LoginRequest loginRequest){
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getName(), loginRequest.getPassword()));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtUtils.generateToken(authentication);

        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        List<String> roles = userDetails.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.toList());

        return ResponseEntity.ok(new JwtResponse(
                jwt,
                "Bearer",  // Đặt giá trị mặc định cho type là "Bearer"
                userDetails.getId(),
                userDetails.getUsername(),
                userDetails.getCode(),
                userDetails.getEmail(),
                userDetails.getAvatar(),
                userDetails.getCreatedAt(),
                userDetails.getUpdatedAt(),
                userDetails.getStatus(),
                roles));

    }

    @PostMapping("/signup")
    public ResponseEntity<?> registerUser(@Valid @RequestBody SignupRequest signUpRequest) {

        // kiểm tra trùng tài khoản
        if (accountRepository.existsByName(signUpRequest.getName())) {
            return ResponseEntity
                    .badRequest()
                    .body(new MessageResponse("Error: Tên người dùng đã được sử dụng!"));
        }
        // kiểm tra trùng email
        if (accountRepository.existsByEmail(signUpRequest.getEmail())) {
            return ResponseEntity
                    .badRequest()
                    .body(new MessageResponse("Error: Email đã được sử dụng!"));
        }

        // add người dùng mới
        Account account = Account.builder()
                .name(signUpRequest.getName())
                .email(signUpRequest.getEmail())
                .password(encoder.encode(signUpRequest.getPassword()))
                .code(signUpRequest.getCode())
                .avatar(signUpRequest.getAvata())
                .updatedAt(signUpRequest.getCreatedAt())
                .status(signUpRequest.getStatus())
                .build();

        Set<String> strRoles = signUpRequest.getRole();
        List<Role> roles = new ArrayList<>();

        if (strRoles == null) {
            Role userRole = roleRepository.findByName(ERole.ROLE_USER)
                    .orElseThrow(() -> new RuntimeException("Error: Vai trò không được tìm thấy."));
            roles.add(userRole);
        }else {
            strRoles.forEach(role -> {
                switch (role) {
                    case "admin":
                        Role adminRole = roleRepository.findByName(ERole.ROLE_ADMIN)
                                .orElseThrow(() -> new RuntimeException("Error: Vai trò không được tìm thấy."));
                        roles.add(adminRole);

                        break;
                    case "mod":
                        Role modRole = roleRepository.findByName(ERole.ROLE_MODERATOR)
                                .orElseThrow(() -> new RuntimeException("Error: Vai trò không được tìm thấy."));
                        roles.add(modRole);

                        break;
                    default:
                        Role userRole = roleRepository.findByName(ERole.ROLE_USER)
                                .orElseThrow(() -> new RuntimeException("Error: Vai trò không được tìm thấy."));
                        roles.add(userRole);
                }
            });
        }
        account.setCreatedAt(LocalDate.now());
        account.setRole(roles);
        accountRepository.save(account);

        return ResponseEntity.ok(new MessageResponse("Người dùng đã đăng ký thành công!"));
    }
}
