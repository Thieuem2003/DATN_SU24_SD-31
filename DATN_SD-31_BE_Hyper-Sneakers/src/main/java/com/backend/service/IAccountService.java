package com.backend.service;

import com.backend.ServiceResult;
import com.backend.dto.request.AccountRequest;
import com.backend.dto.request.RegisterRequest;
import com.backend.dto.request.account.AccountAddress;
import com.backend.dto.response.AccountPageResponse;
import com.backend.dto.response.AccountResponse;
import com.backend.dto.response.RegisterResponse;
import com.backend.entity.Account;

import java.util.List;

public interface IAccountService {

    Boolean exitsEmail(RegisterRequest registerRequest);

    List<AccountAddress> getAllAddressAndAccount(Long id);

    ServiceResult<Account>getOneAccount(Long id);

    Account findByEmailAccount(String email);

    List<Account> searchNameAccount(String name);

    Account updateAccount(AccountRequest accountRequest);

    RegisterResponse register(RegisterRequest registerRequest);

    AccountResponse addAccount(AccountRequest accountRequest);

    Account deActiveAccount(AccountRequest accountRequest);

    Account activeAccount(AccountRequest accountRequest);

    AccountPageResponse findAllAccount(int pageNo, int pageSize);

    AccountResponse result(String mess);
}
