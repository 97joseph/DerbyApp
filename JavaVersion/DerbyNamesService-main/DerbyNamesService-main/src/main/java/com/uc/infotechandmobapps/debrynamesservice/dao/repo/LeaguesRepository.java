package com.uc.infotechandmobapps.debrynamesservice.dao.repo;

import com.uc.infotechandmobapps.debrynamesservice.dao.entity.Leagues;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LeaguesRepository extends JpaRepository<Leagues, String> {
}
//OC