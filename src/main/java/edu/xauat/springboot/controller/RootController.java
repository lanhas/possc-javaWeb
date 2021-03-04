package edu.xauat.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//@RestController
@Controller
public class RootController {

    @RequestMapping("/")
    public String hello(Model model) {
        return "test";
    }

}
