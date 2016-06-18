package com.sild.tviewer.model;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "Platforms")
@SQLDelete(sql = "UPDATE Platforms SET deleted = '1' WHERE id = ?")
@Where(clause = "deleted <> '1'")
public class Platform {

    @Id
    @GeneratedValue
    private Integer id;

    private String name;

    private String site;

    private boolean deleted;

    @OneToMany(mappedBy = "platform", orphanRemoval = true)
    @Where(clause = "deleted <> '1'")
    @LazyCollection(LazyCollectionOption.EXTRA)
    private Set<Tender> tenderSet = new HashSet<Tender>();


    public Set<Tender> getTenderSet() {
        return tenderSet;
    }

    public void setTenderSet(Set<Tender> tenderSet) {
        this.tenderSet = tenderSet;
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

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }
}
