package com.sild.tviewer.model;

import java.security.acl.Owner;
import java.util.Date;
import java.util.Set;

public class Report {

    private Owner owner;
    private Date startDate;
    private Date endDate;
    private Set<Tender> tenderSet;

    public Report(Owner owner, Date startDate, Date endDate, Set<Tender> tenderSet) {
        this.owner = owner;
        this.startDate = startDate;
        this.endDate = endDate;
        this.tenderSet = tenderSet;
    }



    public enum ReportType {
        CSV("csv"),
        PDF("pdf"),
        HTML("html");

        private String value;

        private ReportType(String value) {
            this.value = value;
        }

        public String getValue() {
            return this.value;
        }

    }

}
