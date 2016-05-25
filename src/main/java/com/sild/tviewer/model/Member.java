package com.sild.tviewer.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "Members")
//@SQLDelete(sql = "UPDATE Members SET deleted = '1' WHERE id = ?")
//@Where(clause = "deleted <> '1'")
public class Member {

    @Id
    @GeneratedValue
    private Integer id;

    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "company_id", nullable = false)
    private Company company;

    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "tender_id", nullable = false)
    private Tender tender;

    private Double offer;

    private Boolean winner;

    private String comment;

    @Column(name = "submit_date")
    private Date submitDate;

    @Column(name = "withdrow_date")
    private Date withdrowDate;

//    private boolean deleted;

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
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getSubmitDate() {
        return submitDate;
    }

    public void setSubmitDate(Date submitDate) {
        this.submitDate = submitDate;
    }

    public Date getWithdrowDate() {
        return withdrowDate;
    }

    public void setWithdrowDate(Date withdrowDate) {
        this.withdrowDate = withdrowDate;
    }

//    public boolean isDeleted() {
//        return deleted;
//    }

//    public void setDeleted(boolean deleted) {
//        this.deleted = deleted;
//    }
}
