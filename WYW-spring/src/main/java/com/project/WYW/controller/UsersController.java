package com.project.WYW.controller;

import com.project.WYW.dao.UsersDao;
import com.project.WYW.domain.UsersDto;
import com.project.WYW.service.UsersSecvice;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@RequestMapping("/users")
@RequiredArgsConstructor
public class UsersController {

    final UsersSecvice usersSecvice;
    final UsersDao dao;

    @GetMapping("/login")
    public String login() throws Exception{
        return "login";
    }

    @GetMapping("/signup")
    public String getSignup() throws Exception{
        return "signUp";
    }

    @PostMapping("/signup")
    public String postSignup(@Valid UsersDto usersDto, Model m) throws Exception {
        int isSuccessful = usersSecvice.singUp(usersDto);

        if(0 < isSuccessful){
            m.addAttribute(usersDto);
            return "signUp_complete";
        }

        return "signUp";
    }

    @GetMapping("/find_id")
    public String find_id() {
        return "find_id";
    }

    @GetMapping("/find_pwd")
    public String find_pwd() {
        return "find_pwd";
    }

    @ResponseBody
    @PostMapping("idChk")
    public int idChk(HttpServletRequest request) throws Exception{
        String user_id = request.getParameter("user_id");
        UsersDto usersDto = usersSecvice.read(user_id);

        if(usersDto!=null){
            return 1;
        }
        return 0;
    }

    @ResponseBody
    @PostMapping("/emailChk")
    public int emailChk(HttpServletRequest request) throws Exception{
        String email = request.getParameter("email");
        UsersDto usersDto = usersSecvice.emailChk(email);

        if(usersDto!=null){
            return 1;
        }
        return 0;
    }

    @ResponseBody
    @PostMapping("/mobileChk")
    public int mobileChk(HttpServletRequest request) throws Exception{
        String mobile1 = request.getParameter("mobile1");
        String mobile2 = request.getParameter("mobile2");
        String mobile3 = request.getParameter("mobile3");
        String mobile = mobile1+"-"+mobile2+"-"+mobile3;

        System.out.println("mobile = " + mobile);

        UsersDto usersDto = usersSecvice.mobileChk(mobile);

        if(usersDto!=null){
            return 1;
        }
        return 0;
    }
}
