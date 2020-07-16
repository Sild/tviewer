package com.sild.tviewer.service;

import com.sild.tviewer.model.Company;
import com.sild.tviewer.model.User;

import java.util.List;

/**
 * @author Dmitry Korchagin.
 */
public interface UserService {

    public User get(String email);

}
