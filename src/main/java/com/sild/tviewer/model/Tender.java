package com.sild.tviewer.model;

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "Tenders")
@SQLDelete(sql="UPDATE Tenders SET deleted = '1' WHERE id = ?")
@Where(clause="deleted <> '1'")
public class Tender {

    @Id
    @GeneratedValue
    private Integer id;

    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "company_id")
    private Company owner;

    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "platform_id")
    private Platform platform;

    private Double sum;

    @Enumerated(EnumType.STRING)
    private TenderState state;

    private String direction;

    private String nomenclature;

    private String comment;

    @Column(name = "trade_form")
    private String tradeForm;

    @Column(name = "start_timestamp")
    private Long startTimestamp;

    @Column(name = "end_timestamp")
    private Long endTimestamp;

    private boolean liked;

    private boolean deleted;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "tender", orphanRemoval = true)
    @Where(clause="deleted <> '1'")
    private List<Member> memberList = new ArrayList<>();

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

    public Long getStartTimestamp() {
        return startTimestamp;
    }

    public void setStartTimestamp(Long startTimestamp) {
        this.startTimestamp = startTimestamp;
    }

    public Long getEndTimestamp() {
        return endTimestamp;
    }

    public void setEndTimestamp(Long endTimestamp) {
        this.endTimestamp = endTimestamp;
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

    public List<Member> getMemberList() {
        return memberList;
    }

    public void setMemberList(List<Member> memberList) {
        this.memberList = memberList;
    }
}
