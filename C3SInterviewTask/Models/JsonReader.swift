//
//  JsonReader.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 26/06/2021.
//

import Foundation

class JsonReader{
    
     class func readLocalJSONFile(forName name: String,completion: @escaping (Data?)-> Void) {
        
        guard let filePath = Bundle.main.path(forResource: name, ofType: "json") else {    return
        }
        
        let fileUrl = URL(fileURLWithPath: filePath)
        let task = URLSession.shared.dataTask(with: fileUrl ){ data, response, error in
            DispatchQueue.main.async {
                completion(data)
            }
        }

        task.resume()
     }
    
    
    class func decode<T:Codable> (type:T.Type , data:Data)->T?{
        let decoder = JSONDecoder()
         do{
            
            let object = try decoder.decode(type.self, from: data)
            
            return object
            
        }catch{
            print("Failed in decoding: \(error)")
            return nil
        }
    }

    
}
