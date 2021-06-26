//
//  CarCategory.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 26/06/2021.
//

import Foundation

 
struct CarCategory:Codable{
    
    let category:String
    let imageName:String?
    let description:String?
    
    
    enum CodingKeys: String, CodingKey {

        case category
        case imageName = "image_name"
        case description

    }
    
}
 
