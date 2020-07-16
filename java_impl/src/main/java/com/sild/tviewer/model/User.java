package com.sild.tviewer.model;

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.util.Set;

/**
 * @author Dmitry Korchagin.
 */
@Entity
@Table(name = "Users")
@SQLDelete(sql = "UPDATE Users SET deleted = '1' WHERE id = ?")
@Where(clause = "deleted <> '1'")
public class User {

    @Id
    @GeneratedValue
    private Integer id;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String password;

    @ElementCollection
    @Enumerated(EnumType.STRING)
    private Set<UserRole> roleSet;

    private boolean deleted;

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public User() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public static enum UserRole {
        ADMIN, USER, ANONYMOUS;

        UserRole() {
        }

    }
}
