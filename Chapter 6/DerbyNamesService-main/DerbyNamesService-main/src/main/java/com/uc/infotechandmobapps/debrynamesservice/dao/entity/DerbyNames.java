package com.uc.infotechandmobapps.debrynamesservice.dao.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

//OC
@Entity
@Table(name = "DerbyNames", schema = "dbo")
public class DerbyNames implements Cloneable {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  @Column(name = "DerbyNameId")
  private Long derbyNameId;

  @Column(name = "Name")
  private String name;

  @Column(name = "Number")
  private String number;

  @Column(name = "DateAdded")
  private String dateAdded;

  @Column(name = "League")
  private String league;

  public DerbyNames(String name, String number, String dateAdded, String league) {
    this.name = name;
    this.number = number;
    this.dateAdded = dateAdded;
    this.league = league;
  }

  public DerbyNames() {
  }

  public Long getDerbyNameId() {
    return derbyNameId;
  }

  public String getName() {
    return name;
  }

  public String getNumber() {
    return number;
  }

  public String getDateAdded() {
    return dateAdded;
  }

  public String getLeague() {
    return league;
  }

  public void setName(String name) {
    this.name = name;
  }

  public void setNumber(String number) {
    this.number = number;
  }

  public void setDateAdded(String dateAdded) {
    this.dateAdded = dateAdded;
  }

  public void setLeague(String league) {
    this.league = league;
  }

  @Override
  public String toString() {
    return "DerbyNames{" +
        "derbyNameId=" + derbyNameId +
        ", name='" + name + '\'' +
        ", number='" + number + '\'' +
        ", dateAdded='" + dateAdded + '\'' +
        ", league='" + league + '\'' +
        '}';
  }

}
