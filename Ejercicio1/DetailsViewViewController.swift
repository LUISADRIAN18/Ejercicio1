//
//  DetailsViewViewController.swift
//  Ejercicio1
//
//  Created by Luis Garcia on 07/11/22.
//

import UIKit

class DetailsViewViewController: UIViewController {
    
    @IBOutlet weak var imageString: UILabel!
    var recibeInfo : info?
    
    @IBOutlet weak var namePerson: UILabel!
    
    @IBOutlet weak var imagenPerson: UIImageView!
    
    var htt: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        namePerson.text = recibeInfo!.name
       
        
    

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        htt = recibeInfo!.image
            let configuracion = URLSessionConfiguration.default
            let sesion = URLSession(configuration: configuracion)
        guard let laURL = URL(string:htt! )
            else { return }
            
            let request = URLRequest(url: laURL)
            let tarea = sesion.dataTask(with:request) { datos, response, error in
                if nil != error {
                    print ("algo salió mal \(String(describing: error?.localizedDescription))")
                    return
                }
                guard let bytes = datos else {
                    print ("el response no trajo datos")
                    return
                }
                
                //para cualquier cambio que s ehaga en UI debe ser eb el trad principal
                DispatchQueue.main.async {
                    
                    self.imagenPerson.image = UIImage(data: bytes)
                    
                }
                
            }
            tarea.resume()
        }
    



}
