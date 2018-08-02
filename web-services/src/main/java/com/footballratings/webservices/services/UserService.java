package com.footballratings.webservices.services;

import com.footballratings.webservices.entities.User;
import com.footballratings.webservices.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User getUserById(int userId) {
        return userRepository.findById(userId).get();
    }

    public User createUser() {
        User user = new User();
        user.setFirstName("Sargis");
        user.setLastName("Sulyan");
        user.setNickName("sulyan91");
        user.setPasswordHash("qwerty");
        user.setUserName("sulyan91");
        user.setRating(1900);
        return userRepository.save(user);
    }
}
