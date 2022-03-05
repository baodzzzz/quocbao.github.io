/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author quocb
 */

@Getter
@Setter
@ToString
@Builder
public class Category {
    private int id;
    private String categoryName;
    private int status;
    private int totalC;
  
}
