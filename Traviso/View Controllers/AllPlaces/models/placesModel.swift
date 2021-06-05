//
//  placesModel.swift
//  Traviso
//
//  Created by aksa nazir on 12/04/21.
//

import Foundation
struct placesModel: Codable {
    var response: [Places]?
    
}

struct Places: Codable {
    var Summer: String?
    var visits: [PlaceDetails]?
    
}

struct PlaceDetails: Codable {
    var name: String?
    var imageName: String?
    var description: String?
    
}





























