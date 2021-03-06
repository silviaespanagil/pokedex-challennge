//
//  ServerTypesResponse.swift
//  pokedex
//
//  Created by Silvia España on 23/5/22.
//

import Foundation

struct ServerTypesResponse: Codable {
    
    let slot: Int
    let type: ServerTypeResponse
    
    func convertToEntity() -> PokeType {
        
        return PokeType(slot: slot, name: type.name)
    }
}
