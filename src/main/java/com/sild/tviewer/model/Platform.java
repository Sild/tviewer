package com.sild.tviewer.model;

import javax.persistence.*;

@Entity
@Table(name="Platforms")
public class Platform {
	
	@Id
	@GeneratedValue
	private Integer id;
	
	private String name;
	
	private String site;
}
