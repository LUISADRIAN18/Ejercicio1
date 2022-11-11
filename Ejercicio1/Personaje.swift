//
//  Personaje.swift
//  Ejercicio1
//
//  Created by Luis Garcia on 07/11/22.
//

import Foundation


struct Personaje: Decodable{
    let results: [info]
    
    
    
}

struct info : Decodable{
    
    let name: String?
    let image: String?
    
    
    
}
