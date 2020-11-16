package com.skillshare.project.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="service")
public class Service {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;

    @Column(name="title")
    private String title;

    @Column(name="description")
    private String desc;

    @Column(name="price")
    private int price;

    @Column(name="max")
    private int limit;

    @Column(name="status")
    private boolean available;

    @Column(name = "done")
    private boolean done;

    @Column(name="tags")
    private String tags;

    @ManyToOne
    @JoinColumn(name="provider_id")
    private User provider;

    @ManyToOne
    @JoinColumn(name="category_id")
    private Category category;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name="service_clients",
            joinColumns = @JoinColumn(name="service_id"),
            inverseJoinColumns = @JoinColumn(name="client_id")
    )
    private Set<User> clients=new HashSet<User>();

    public Service(){
        this.available=false;
        this.done=false;
    };

    public Service(String title,String desc,int price,int limit, String tags,User user,Category category) {
        this.desc = desc;
        this.tags = tags;
        this.title=title;
        this.price=price;
        this.limit=limit;
        this.available=false;
        this.provider=user;
        this.done=false;
        this.category=category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public boolean isDone() {
        return done;
    }

    public void setDone(boolean done) {
        this.done = done;
    }

    public User getProvider() {
        return provider;
    }

    public void setProvider(User provider) {
        this.provider = provider;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Set<User> getClients() {
        return clients;
    }

    public void setClients(Set<User> clients) {
        this.clients = clients;
    }
}