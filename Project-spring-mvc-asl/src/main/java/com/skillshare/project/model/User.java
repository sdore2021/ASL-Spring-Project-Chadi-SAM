package com.skillshare.project.model;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name="users")
public class User {

    @Id
    @Column(name="email",nullable = false,unique = true)
    private String email;

    @Column(name="username",nullable = false)
    private String username;

    @Column(name="password",nullable = false)
    private String password;

    @Column(name="points")
    private int points;

    @Column(name="role")
    private String role;

   @OneToMany(fetch = FetchType.EAGER,mappedBy = "provider",cascade = {CascadeType.REMOVE})
    private List<Service> services;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name="service_clients",
            joinColumns = @JoinColumn(name="client_id"),
            inverseJoinColumns = @JoinColumn(name="service_id")
    )
    private Set<Service> providedServices;

    public User(){
        this.points=30;
        this.role="user";
    }

    public User(String email,String username, String password) {
        this.email=email;
        this.username = username;
        this.password = password;
        this.points=30;
        this.role="user";
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public List<Service> getServices() {
        return services;
    }

    public void setServices(List<Service> services) {
        this.services = services;
    }

    public Set<Service> getProvidedServices() {
        return providedServices;
    }

    public void setProvidedServices(Set<Service> providedServices) {
        this.providedServices = providedServices;
    }


}
