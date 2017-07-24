package com.neusoft.controller.user;

import com.neusoft.config.ModuleConfig;
import com.neusoft.mapper.IAdminMapper;
import com.neusoft.mapper.IChatMapper;
import com.neusoft.mapper.IUserMapper;
import com.neusoft.model.ChatUserRecord;
import com.neusoft.model.User;
import com.neusoft.service.IUserService;
import com.neusoft.service.impl.UserService;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import sun.security.pkcs11.Secmod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * Created by Bruce Lee on 2017/7/17.
 */
/**
 * 本文件是与用户管理相关的所有Servlet
 * 例如，用户登录及注册
 */
@Controller
public class UserController {

    @Value("#{userManager}")
    private IUserService userService;

    @RequestMapping("verify_username.do")
    public String verify_username(String username) throws IOException {
        if(userService.check_username(username) == true)
            return "ok";
        return "unvalid username";
    }

    @RequestMapping("user_login.do")
    public ModelAndView user_login(User _user, HttpServletRequest request) throws IOException {
        ModelAndView mav = new ModelAndView();
        User user = userService.user_login(_user);
        if(user != null){
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            mav.setViewName("login");
        }else{
            mav.setViewName("login");
        }
        return mav;
    }

    //用户注册
    @RequestMapping("user_register.do")
    public ModelAndView user_register(User user, HttpServletRequest request) throws IOException {
        return null;
    }

    @RequestMapping("chat.do")
    public ModelAndView chat(HttpServletRequest request){
        ModelAndView mav = new ModelAndView("chat");

        mav.addObject("chat_users", userService.getChatUsers(new User()));

        return mav;
    }

    @RequestMapping("add_chat_user.do")
    public ModelAndView add_chat_user(HttpServletResponse response) throws IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("utf-8");
        response.getWriter().write("heh");
        return null;
    }
}