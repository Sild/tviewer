package com.sild.tviewer.service.impl;

import com.sild.tviewer.model.Company;
import com.sild.tviewer.model.Member;
import com.sild.tviewer.repository.CRUDRepository;
import com.sild.tviewer.repository.CompanyCRUDRepository;
import com.sild.tviewer.repository.impl.CRUDRepositoryImpl;
import com.sild.tviewer.service.CompanyService;
import com.sild.tviewer.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private CRUDRepository<Member> repository;

    public void add(Member element) {
        repository.add(element);
    }

    public void update(Member element) {
        repository.update(element);
    }

    public Member get(int id) {
        return repository.get(Member.class, id);
    }

    public void delete(int id) {
        repository.delete(Member.class, id);
    }

    public List<Member> getAll() {
        return repository.getAll(Member.class);
    }
}