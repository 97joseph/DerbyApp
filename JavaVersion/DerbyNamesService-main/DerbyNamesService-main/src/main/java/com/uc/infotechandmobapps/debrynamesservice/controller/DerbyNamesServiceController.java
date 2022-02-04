package com.uc.infotechandmobapps.debrynamesservice.controller;

import com.google.gson.Gson;
import com.uc.infotechandmobapps.debrynamesservice.service.DerbyNamesService;
import org.apache.juli.logging.Log;
import org.apache.juli.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//OC
@RestController
@RequestMapping("/DerbyService")
public class DerbyNamesServiceController {

  private static final Log log = LogFactory.getLog(DerbyNamesServiceController.class);

  private DerbyNamesService derbyNamesService;

  public DerbyNamesServiceController(DerbyNamesService derbyNamesService) {
    this.derbyNamesService = derbyNamesService;
  }

  @GetMapping(value = "/PlayerNames", produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<String> getPlayerNames() {
    log.info("Request received to get player names...");

    final String playerNamesJson = new Gson().toJson(derbyNamesService.findPlayerNames());
    return new ResponseEntity<>(playerNamesJson, HttpStatus.OK);
  }

  @GetMapping(value = "/Leagues", produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<String> getLeagues() {
    final String leagueNamesJson = new Gson().toJson(derbyNamesService.findLeagues());
    return new ResponseEntity<>(leagueNamesJson, HttpStatus.OK);
  }

}
