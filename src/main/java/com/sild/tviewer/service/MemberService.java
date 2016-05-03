package com.sild.tviewer.service;

import com.sild.tviewer.model.Company;
import com.sild.tviewer.model.Member;

import java.util.List;
import java.util.Map;

/**
 * @author Dmitry Korchagin.
 */
public interface MemberService {
    public void add(Member element);

    public void update(Member element);

    public Member get(int id);

    public void delete(int id);

    public List<Member> getAll();
}
