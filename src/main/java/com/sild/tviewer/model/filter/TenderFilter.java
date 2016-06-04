package com.sild.tviewer.model.filter;

import com.sild.tviewer.model.TenderState;

/**
 * @author Dmitry Korchagin.
 */

public class TenderFilter {

    private String number = "";

    private String member = "";

    private String owner = "";

    private String direction = ""; //TODO update repo to apply


    private Boolean liked = false;

    @Override
    public String toString() {
        return "TenderFilter{" +
                "number='" + number + '\'' +
                ", member='" + member + '\'' +
                ", owner='" + owner + '\'' +
                ", liked=" + liked +
                ", state=" + state +
                '}';
    }

    private TenderState state;

    public TenderFilter() {
        number = "";

    }

    public Boolean getLiked() {
        return liked;
    }

    public void setLiked(Boolean liked) {
        this.liked = liked;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getMember() {
        return member;
    }

    public void setMember(String member) {
        this.member = member;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public TenderState getState() {
        return state;
    }

    public void setState(TenderState state) {
        this.state = state;
    }
}
