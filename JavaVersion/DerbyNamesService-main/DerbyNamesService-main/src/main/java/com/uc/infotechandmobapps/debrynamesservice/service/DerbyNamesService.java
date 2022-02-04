package com.uc.infotechandmobapps.debrynamesservice.service;

import com.uc.infotechandmobapps.debrynamesservice.dao.entity.DerbyNames;
import com.uc.infotechandmobapps.debrynamesservice.dao.entity.Leagues;
import com.uc.infotechandmobapps.debrynamesservice.dao.repo.DerbyNamesRepository;
import com.uc.infotechandmobapps.debrynamesservice.dao.repo.LeaguesRepository;
import org.apache.juli.logging.Log;
import org.apache.juli.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class DerbyNamesService {

  private static final Log log = LogFactory.getLog(DerbyNamesService.class);

  private DerbyNamesRepository derbyNamesRepository;

  private LeaguesRepository leaguesRepository;

  public DerbyNamesService(DerbyNamesRepository derbyNamesRepository, LeaguesRepository leaguesRepository) {
    this.derbyNamesRepository = derbyNamesRepository;
    this.leaguesRepository = leaguesRepository;
  }

  public List<DerbyNames> findPlayerNames() {
    log.info("Fetching all player names from database...");

    return derbyNamesRepository.findAll();
  }

  public List<Leagues> findLeagues() {
    log.info("Fetching all leagues from database...");

    return leaguesRepository.findAll();
  }

}
