//
//  PersonajeDataMAnager.swift
//  Ejercicio1
//
//  Created by Luis Garcia on 07/11/22.
//

import Foundation

class PersonajeDataMAnager {
    private var personajes : [info] = []
    
    
    func buscarPersonajes() -> [info]{
        
        if let laURL = URL(string: "https://rickandmortyapi.com/api/character/"){
            
            do{
                let data = try Data(contentsOf: laURL)
                let decodePerson = try JSONDecoder().decode(Personaje.self, from: data)
                //print("Datos decodificados: \(decodePerson.results.count)")
                
                personajes = decodePerson.results
                
            }catch{
                print("error....")
                
            }
        } ;return personajes
    }
    
    
    func personajesCoutn() -> Int{
        return personajes.count
        
    }
    
    func personajeAt(index: Int) -> info{
        return personajes[index]
        
    }
    
    
    
    
}
