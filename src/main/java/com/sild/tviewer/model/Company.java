package com.sild.tviewer.model;


import javax.persistence.*;

@Entity
@Table(name="Companies")
public class Company {
	
	@Id
	@GeneratedValue
	private Integer id;
	
	private String name;
	
	private String comment;

    @OneToOne
    @JoinColumn(name="color_id")
	private Color color;

	private Boolean deleted;

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

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public Boolean getDeleted() {
        return deleted;
    }

    public void setDeleted(Boolean deleted) {
        this.deleted = deleted;
    }
}
