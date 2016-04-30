package com.sild.tviewer.model;

import javax.persistence.*;

@Entity
@Table(name = "Tenders")
public class Member {

    @Id
    @GeneratedValue
    private Integer id;

    @OneToOne
    @JoinColumn(name = "company_id")
    private Company company;

    @OneToOne
    @JoinColumn(name = "tender_id")
    private Tender tender;

    private Double offer;

    private Boolean winner;

    private String Comment;

    @Column(name = "submit_timestamp")
    private Long submitTimestamp;

    @Column(name = "withdrow_timestamp")
    private Long withdrowTimestamp;

}
