package com.sild.tviewer.model;


import com.fasterxml.jackson.annotation.JsonInclude;
import jdk.nashorn.internal.objects.annotations.Function;
import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "Companies")
@SQLDelete(sql = "UPDATE Companies SET deleted = '1' WHERE id = ?")
@Where(clause = "deleted <> '1'")
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Company {


    @Id
    @GeneratedValue
    private Integer id;

    private String name;

    private String comment;

    private String color;

    private boolean deleted;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "company", orphanRemoval = true)
    @OrderBy("id ASC")
    @LazyCollection(LazyCollectionOption.EXTRA)
    @Where(clause = "deleted <> '1'")
    private Set<Member> memberSet = new HashSet<>();

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "owner", orphanRemoval = true)
    @OrderBy("id ASC")
    @Where(clause = "deleted <> '1'")
    @LazyCollection(LazyCollectionOption.EXTRA)
    private Set<Tender> tenderSet = new HashSet<>();

    public Set<Tender> getTenderSet() {
        return tenderSet;
    }

    public void setTenderSet(Set<Tender> tenderSet) {
        this.tenderSet = tenderSet;
    }

    public Set<Member> getMemberSet() {
        return memberSet;
    }

    public void setMemberSet(Set<Member> memberSet) {
        this.memberSet = memberSet;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Company company = (Company) o;

        if (deleted != company.deleted) return false;
        if (!color.equals(company.color)) return false;
        if (!comment.equals(company.comment)) return false;
        if (!id.equals(company.id)) return false;
        if (!memberSet.equals(company.memberSet)) return false;
        if (!name.equals(company.name)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id.hashCode();
        result = 31 * result + name.hashCode();
        result = 31 * result + comment.hashCode();
        result = 31 * result + color.hashCode();
        result = 31 * result + (deleted ? 1 : 0);
        result = 31 * result + memberSet.hashCode();
        return result;
    }
}
