package com.sild.tviewer.model;

import com.google.gwt.user.client.rpc.IsSerializable;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "Tenders")
@SQLDelete(sql = "UPDATE Tenders SET deleted = '1' WHERE id = ?")
@Where(clause = "deleted <> '1'")
public class Tender implements IsSerializable {

    @Id
    @GeneratedValue
    private Integer id;

    @Column(nullable = false)
    private String number;

    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "company_id", nullable = false)
    private Company owner;

    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "platform_id")
    private Platform platform;

    private Double sum;

    @Enumerated(EnumType.STRING)
    private CurrencyType currency;

    @Enumerated(EnumType.STRING)
    private TenderState state;

    private String direction;

    private String nomenclature;

    private String comment;

    @Column(name = "trade_form")
    private String tradeForm;

    @Column(name = "start_date")
    private Date startDate;

    @Column(name = "end_date")
    private Date endDate;

    private boolean liked;

    //TODO add add_time field
    private Date addTime;
    @PrePersist
    private void onCreate() {
        addTime = new Date();
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    private boolean deleted;

    @OneToMany(mappedBy = "tender", orphanRemoval = true)
    @OrderBy("allowed DESC, offer ASC")
    @LazyCollection(LazyCollectionOption.EXTRA)
    private Set<Member> memberSet = new HashSet<Member>();

    public CurrencyType getCurrency() {
        return currency;
    }

    public void setCurrency(CurrencyType currency) {
        this.currency = currency;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Company getOwner() {
        return owner;
    }

    public void setOwner(Company owner) {
        this.owner = owner;
    }

    public Platform getPlatform() {
        return platform;
    }

    public void setPlatform(Platform platform) {
        this.platform = platform;
    }

    public Double getSum() {
        return sum;
    }

    public void setSum(Double sum) {
        this.sum = sum;
    }

    public TenderState getState() {
        return state;
    }

    public void setState(TenderState state) {
        this.state = state;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getNomenclature() {
        return nomenclature;
    }

    public void setNomenclature(String nomenclature) {
        this.nomenclature = nomenclature;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getTradeForm() {
        return tradeForm;
    }

    public void setTradeForm(String tradeForm) {
        this.tradeForm = tradeForm;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public boolean isLiked() {
        return liked;
    }

    public void setLiked(boolean liked) {
        this.liked = liked;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    public Set<Member> getMemberSet() {
        return memberSet;
    }

    public void setMemberSet(Set<Member> memberSet) {
        this.memberSet = memberSet;
    }


}
