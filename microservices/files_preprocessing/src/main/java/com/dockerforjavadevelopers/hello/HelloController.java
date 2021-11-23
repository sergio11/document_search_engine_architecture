package com.dockerforjavadevelopers.hello;


import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PutMapping;





// TEST CLASS , NOT ACTUAL PREPROCESSING CLASS (which is in another project for now)
@RestController
public class HelloController {



    @RequestMapping("/")
    public String index() {
        return "Hello World\n";
    }

    @PutMapping("/")
    public String index(){
        //System.out.println("!!!!!!!!!!!!!!!!!WORKED!!!!!!!!!!!");
        return "worked...\n";
    }
    
}
