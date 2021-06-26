//
//  Car.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 26/06/2021.
//

import Foundation

 
struct Car:Codable{
    
    let carCompany :String?
    let logo :String?
    let car_model :String?
    let style :String?
    let year :String?
    let price :String?
    let carImg :String?
    let isAvailable:Bool?

    
    enum CodingKeys: String, CodingKey {

      case carCompany = "car_company"
      case logo
      case carModel = "car_model"
      case style
      case year
      case price
      case carImg = "car_Img"
      case isAvailable = "is_Available"
        
        
        
    }
    
}


 
