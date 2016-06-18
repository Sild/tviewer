package com.sild.tviewer.service;

import com.google.gwt.user.client.rpc.RemoteService;
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;
import com.sild.tviewer.model.Company;

import java.util.List;

/**
 * @author Dmitry Korchagin.
 */
@RemoteServiceRelativePath("companyService.gwt")
public interface CompanyService extends RemoteService {

    public void createOrUpdate(Company company);

    public String test();

    public Company get(int id);

    public void delete(int id);

    public List<Company> getAll();

    public List<Company> getByName(String name);

    public List<Company> getProvidersByName(String name);

    public List<Company> getCustomersByName(String name);



}
