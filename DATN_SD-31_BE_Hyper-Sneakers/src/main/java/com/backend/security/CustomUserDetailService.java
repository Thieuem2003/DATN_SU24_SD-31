package com.backend.security;

import com.backend.entity.Account;
import com.backend.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

//@Service
public class CustomUserDetailService {

//    @Autowired
//    private AccountRepository accountRepository;
//
//    @Override
//    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//        Account account = accountRepository.findByName(username);
//        if (account == null) {
//            throw new UsernameNotFoundException("Người dùng không tìm thấy");
//        }
//        return CustomUserDetails.mapUserToUserDetail(account);
//    }
}
