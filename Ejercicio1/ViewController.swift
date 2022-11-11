//
//  ViewController.swift
//  Ejercicio1
//
//  Created by Luis Garcia on 07/11/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tablaRicky: UITableView!
    
    var selectedPerson : info?
    let personajeDataManager = PersonajeDataMAnager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ad = UIApplication.shared.delegate as! AppDelegate
               if ad.internetStatus {
                   personajeDataManager.buscarPersonajes()
                  
               }
               else {
                   let ac = UIAlertController(title:"Error", message:"Lo sentimos, pero al parecer no hay conexión a Internet", preferredStyle: .alert)
                   let action = UIAlertAction(title: "Enterado", style: .default)
                   ac.addAction(action)
                   self.present(ac, animated: true)
               }
        
        
      
        
        
        tablaRicky.delegate = self
        tablaRicky.dataSource = self
    }
   

    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*let ad = UIApplication.shared.delegate as! AppDelegate
               if ad.internetStatus {
                   let ac = UIAlertController(title:"Confirma", message:"Deseas abrir personajes de Ricky Morty?", preferredStyle: .alert)
                   let action = UIAlertAction(title: "SI", style: .default, handler: { boton in
                       
                      
                     
                   })
                   ac.addAction(action)
                   self.present(ac, animated: true)
               }
               else {
                   let ac = UIAlertController(title:"Error", message:"Lo sentimos, pero al parecer no hay conexión a Internet", preferredStyle: .alert)
                   let action = UIAlertAction(title: "Enterado", style: .default)
                   ac.addAction(action)
                   self.present(ac, animated: true)
               }*/
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailsViewViewController
        destination.recibeInfo = selectedPerson
    }


}


extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personajeDataManager.personajesCoutn()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaRicky.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        
        let person = personajeDataManager.personajeAt(index: indexPath.row)
        
        celda.textLabel?.text = person.name
        
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPerson = personajeDataManager.personajeAt(index: indexPath.row)
        self.performSegue(withIdentifier: "segue", sender: Self.self)
    }
    
    
    
}
