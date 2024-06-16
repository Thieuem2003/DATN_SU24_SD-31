package com.backend.dto.request.account;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Builder
public class SearchAccountRequest {
    private String name;

    private String email;

    private Integer role;

    private Integer statusAccount;

    private int page;

    private int size;
}
