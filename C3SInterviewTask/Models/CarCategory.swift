//
//  CarCategory.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 26/06/2021.
//

import Foundation

 
struct CarCategory:Codable{
    
    let name:String
    let imageName:String?
    let description:String?
    
    
    enum CodingKeys: String, CodingKey {

        case name = "category"
        case imageName = "ïmage_name"
        case description

    }
    
}
 
