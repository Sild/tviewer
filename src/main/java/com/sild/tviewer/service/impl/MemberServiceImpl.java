package com.sild.tviewer.service.impl;

import com.sild.tviewer.model.Member;
import com.sild.tviewer.repository.CRUDRepository;
import com.sild.tviewer.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private CRUDRepository<Member> repository;

    public void createOrUpdate(Member member) {
        if (null == member.getId() || member.getId().equals("")) {
            repository.add(member);
        } else {
            repository.update(member);
        }
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