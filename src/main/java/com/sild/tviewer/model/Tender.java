package com.sild.tviewer.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "Tenders")
public class Tender {

    @Id
    @GeneratedValue
    private Integer id;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "company_id")
    private Company owner;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "platform_id")
    private Platform platform;

    private Double sum;

    //    @Enumerated(EnumType.STRING)
    private String state;

    private String direction;

    private String nomenclature;

    private String comment;

    @Column(name = "trade_form")
    private String tradeForm;

    @Column(name = "start_timestamp")
    private Long startTimestamp;

    @Column(name = "end_timestamp")
    private Long endTimestamp;

    private Boolean liked;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "tender")
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

    public String getState() {
        return state;
    }

    public void setState(String state) {
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

    @Override
    public String toString() {
        return "Tender{" +
                "id=" + id +
                ", owner=" + owner +
                ", platform=" + platform +
                ", sum=" + sum +
                ", state='" + state + '\'' +
                ", direction='" + direction + '\'' +
                ", nomenclature='" + nomenclature + '\'' +
                ", comment='" + comment + '\'' +
                ", tradeForm='" + tradeForm + '\'' +
                ", startTimestamp=" + startTimestamp +
                ", endTimestamp=" + endTimestamp +
                ", liked=" + liked +
                ", memberList=" + memberList +
                '}';
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

    public Boolean getLiked() {
        return liked;
    }

    public void setLiked(Boolean liked) {
        this.liked = liked;
    }

    public List<Member> getMemberList() {
        return memberList;
    }

    public void setMemberList(List<Member> memberList) {
        this.memberList = memberList;
    }
}
