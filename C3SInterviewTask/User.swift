//
//  User.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 26/06/2021.
//

import Foundation
import SwiftKeychainWrapper
struct User:Codable{
    static var shared:User?{
        didSet{
            shared?.save()
        }
    }
    let userName:String

    private static let savedKey = "userData"

    private func save(){
        guard User.shared != nil else { return }
        let data = try! JSONEncoder().encode(User.shared!)
        KeychainWrapper.standard.set(data, forKey: User.savedKey)
    }
    
    static func load(){
        let data = KeychainWrapper.standard.data(forKey: savedKey)
        
        guard let userData = data else{
            return
        }
        
        do{
            let user = try JSONDecoder().decode(User.self, from: userData)
            User.shared = user
            
        }catch {
            print ("Failed to decode saved user ")
        }
        
    }
    
    static func remove(){
        KeychainWrapper.standard.removeObject(forKey: "userData")
        User.shared = nil
    }

}
