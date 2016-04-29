package com.sild.tviewer.model;

import javax.persistence.*;

/**
 * @author Dmitry Korchagin.
 */

@Entity
@Table(name="Colors")
public class Color {

    @Id
    @GeneratedValue
    private int id;

    private String name;

    private String code;
}
