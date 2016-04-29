package com.sild.tviewer.model;

import javax.persistence.*;

@Entity
@Table(name="Tenders")
public class Tender {

	@Id
	@GeneratedValue
	private Integer id;

    @OneToOne
    @JoinColumn(name="company_id")
	private Company owner;

    @OneToOne
    @JoinColumn(name="platform_id")
	private Platform platform;

	private Double sum;

//    @Enumerated(EnumType.STRING)
    private String state;

    private String direction;

    private String nomenclature;

    private String comment;

    @Column(name="trade_form")
    private String tradeForm;

    @Column(name="start_timestamp")
    private Long startTimestamp;

    @Column(name="end_timestamp")
    private Long endTimestamp;

	private Boolean liked;



}
