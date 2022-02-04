package com.uc.infotechandmobapps.debrynamesservice.dao.repo;

import com.uc.infotechandmobapps.debrynamesservice.dao.entity.DerbyNames;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DerbyNamesRepository extends JpaRepository<DerbyNames, String> {
}
//OC