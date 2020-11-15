package com.skillshare.project.service;

import com.skillshare.project.dao.UserRepository;
import com.skillshare.project.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public User save(User user) {
        return userRepository.save(user);
    }

    @Override
    public List<User> getAll() {
        return (List<User>) userRepository.findAll();
    }

    @Override
    public User changeRole(User user,String role) {
        user.setRole(role);
        return this.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public User getCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails= (UserDetails) auth.getPrincipal();

        return this.findByUsername(userDetails.getUsername());
    }

    @Override
    public User sellService(com.skillshare.project.model.Service service) {
        User provider=service.getProvider();
        provider.setPoints(provider.getPoints()+service.getPrice());
        userRepository.save(provider);
        return provider;
    }

    @Override
    public User buyService(com.skillshare.project.model.Service service) throws Exception {
        User current=this.getCurrentUser();
        if(current.getPoints()>service.getPrice() || current.getUsername()==service.getProvider().getUsername() || service.getClients().size()==service.getLimit()) {
            current.setPoints(current.getPoints() - service.getPrice());
            current.getProvidedServices().add(service);
            userRepository.save(current);
        }
        else{
            throw new Exception("Vous ne pouvez pas effectuer cette transaction !");
        }
        return current;
    }

    @Override
    public void refund(com.skillshare.project.model.Service service) {
        Set<User> clients=service.getClients();
        User provider=service.getProvider();
        provider.setPoints(provider.getPoints()-clients.size()*service.getPrice());
        clients.forEach(client->{
            client.setPoints(client.getPoints()+service.getPrice());
            userRepository.save(client);
        });
        userRepository.save(provider);
    }
}
