package com.sild.tviewer.service;

import com.sild.tviewer.model.Report;
import com.sild.tviewer.model.Tender;
import com.sild.tviewer.model.filter.TenderFilter;

import java.util.List;


/**
 * @author Dmitry Korchagin.
 */
public interface ReportService {

    public String generateReport(Report.ReportType type);

    public Tender get(int id);

    public List<Tender> get(TenderFilter filter);

    public void delete(int id);

    public List<Tender> getAll();

}
