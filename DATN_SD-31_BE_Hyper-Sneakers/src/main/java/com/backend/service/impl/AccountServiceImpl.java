package com.backend.service.impl;

import com.backend.dto.request.AccountRequest;
import com.backend.dto.request.RegisterRequest;
import com.backend.dto.request.account.AccountAddress;
import com.backend.dto.response.AccountPageResponse;
import com.backend.entity.Account;
import com.backend.repository.AccountRepository;
import com.backend.repository.AddressRepository;
import com.backend.repository.RoleRepository;
import com.backend.service.IAccountService;
import com.backend.service.ImageUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AccountServiceImpl implements IAccountService {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private AddressRepository addressRepository;

    private ImageUploadService imageUploadService;

    @Override
    public Boolean exitsEmail(RegisterRequest registerRequest) {
        return null;
    }

    @Override
    public List<AccountAddress> getAllAddressAndAccount(Long id) {
        return List.of();
    }

    @Override
    public Account getOneAccount(Long id) {
        return null;
    }

    @Override
    public Account findByEmailAccount(String email) {
        return null;
    }

    @Override
    public List<Account> searchNameAccount(String name) {
        return List.of();
    }

    @Override
    public Account updateAccount(AccountRequest accountRequest) {
        return null;
    }

    @Override
    public RegisterResponse register(RegisterRequest registerRequest) {
        return null;
    }

    @Override
    public AccountResponse addAccount(AccountRequest accountRequest) {
        return null;
    }

    @Override
    public Account deActiveAccount(AccountRequest accountRequest) {
        return null;
    }

    @Override
    public Account activeAccount(AccountRequest accountRequest) {
        return null;
    }

    @Override
    public AccountPageResponse findAllAccount(int pageNo, int pageSize) {
        return null;
    }
}
