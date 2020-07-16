package com.sild.tviewer.service;

import com.sild.tviewer.model.Member;

import java.util.List;

/**
 * @author Dmitry Korchagin.
 */
public interface MemberService {
    public void createOrUpdate(Member member);

    public Member get(int id);

    public void delete(int id);

    public List<Member> getAll();
}
