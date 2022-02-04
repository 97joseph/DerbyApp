package com.uc.infotechandmobapps.debrynamesservice.dao.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

//OC
@Entity
@Table(name = "Leagues", schema = "dbo")
public class Leagues implements Cloneable {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  @Column(name = "LeagueId")
  private Long leagueId;

  @Column(name = "LeagueName")
  private String leagueName;

  @Column(name = "URL")
  private String url;

  @Column(name = "StateProvince")
  private String stateProvince;

  @Column(name = "CountryCode")
  private String countryCode;

  public Leagues(String leagueName, String url, String stateProvince, String countryCode) {
    this.leagueName = leagueName;
    this.url = url;
    this.stateProvince = stateProvince;
    this.countryCode = countryCode;
  }

  public Leagues() {
  }

  public Long getLeagueId() {
    return leagueId;
  }

  public String getLeagueName() {
    return leagueName;
  }

  public String getUrl() {
    return url;
  }

  public String getStateProvince() {
    return stateProvince;
  }

  public String getCountryCode() {
    return countryCode;
  }

  public void setLeagueName(String leagueName) {
    this.leagueName = leagueName;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  public void setStateProvince(String stateProvince) {
    this.stateProvince = stateProvince;
  }

  public void setCountryCode(String countryCode) {
    this.countryCode = countryCode;
  }

  @Override
  public String toString() {
    return "Leagues{" +
        "leagueId=" + leagueId +
        ", leagueName='" + leagueName + '\'' +
        ", url='" + url + '\'' +
        ", stateProvince='" + stateProvince + '\'' +
        ", countryCode='" + countryCode + '\'' +
        '}';
  }

}
