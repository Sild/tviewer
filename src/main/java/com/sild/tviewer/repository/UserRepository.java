package com.sild.tviewer.repository;

import com.sild.tviewer.model.Tender;
import com.sild.tviewer.model.User;
import com.sild.tviewer.model.filter.TenderFilter;

import java.util.List;

public interface UserRepository {


    public User get(String email);

}
