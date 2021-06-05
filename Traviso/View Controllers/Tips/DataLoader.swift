//
//  DataLoader.swift
//  Traviso
//
//  Created by aksa nazir on 06/04/21.
//

import Foundation


public class DataLoader {
    
    @Published var userData = [UserData]()
    
    init() {
        load()
        
    }
    
    func load() {
        
        if let fileLocation = Bundle.main.url(forResource: "mydata", withExtension: "json") {
            
            // do catch in case of an error
            do {
                
                
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([UserData].self, from: data)
                
                self.userData = dataFromJson
                
            } catch {
                print(error)
            }
        }
    }
    
    
}
