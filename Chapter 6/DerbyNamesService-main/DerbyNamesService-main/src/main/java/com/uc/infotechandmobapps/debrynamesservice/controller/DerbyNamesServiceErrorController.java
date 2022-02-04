package com.uc.infotechandmobapps.debrynamesservice.controller;

import org.apache.juli.logging.Log;
import org.apache.juli.logging.LogFactory;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//OC
@Controller
public class DerbyNamesServiceErrorController implements ErrorController {

  private static final Log log = LogFactory.getLog(DerbyNamesServiceErrorController.class);

  @RequestMapping(value = "/error", produces = MediaType.APPLICATION_JSON_VALUE)
  public String handleError() {
    log.info("Rendering 404 NOT FOUND page, No mapping found for the requested URI...");

    return "error";
  }

  @Override
  public String getErrorPath() {
    return null;
  }

}
