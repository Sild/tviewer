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



}
