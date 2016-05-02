package com.sild.tviewer.model;

import javax.persistence.*;

@Entity
@Table(name = "Members")
public class Member {

    @Id
    @GeneratedValue
    private Integer id;

    @OneToOne
    @JoinColumn(name = "company_id")
    private Company company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tender_id", nullable = false)
    private Tender tender;

    private Double offer;

    private Boolean winner;

    private String Comment;

    @Column(name = "submit_timestamp")
    private Long submitTimestamp;

    @Column(name = "withdrow_timestamp")
    private Long withdrowTimestamp;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Tender getTender() {
        return tender;
    }

    public void setTender(Tender tender) {
        this.tender = tender;
    }

    public Double getOffer() {
        return offer;
    }

    public void setOffer(Double offer) {
        this.offer = offer;
    }

    public Boolean getWinner() {
        return winner;
    }

    public void setWinner(Boolean winner) {
        this.winner = winner;
    }

    public String getComment() {
        return Comment;
    }

    public void setComment(String comment) {
        Comment = comment;
    }

    public Long getSubmitTimestamp() {
        return submitTimestamp;
    }

    public void setSubmitTimestamp(Long submitTimestamp) {
        this.submitTimestamp = submitTimestamp;
    }

    public Long getWithdrowTimestamp() {
        return withdrowTimestamp;
    }

    public void setWithdrowTimestamp(Long withdrowTimestamp) {
        this.withdrowTimestamp = withdrowTimestamp;
    }
}
