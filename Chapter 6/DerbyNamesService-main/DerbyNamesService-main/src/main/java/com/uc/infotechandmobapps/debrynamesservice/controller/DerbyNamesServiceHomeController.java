package com.uc.infotechandmobapps.debrynamesservice.controller;

import org.apache.juli.logging.Log;
import org.apache.juli.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DerbyNamesServiceHomeController {

  private static final Log log = LogFactory.getLog(DerbyNamesServiceController.class);

  @RequestMapping("/DerbyService")
  public String home() {
    log.info("Rendering Home page...");

    return "home";
  }

}
//OC
