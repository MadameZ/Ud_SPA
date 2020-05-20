//
//  DetailViewController.swift
//  SPA
//
//  Created by Caroline Zaini on 20/05/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var animalProfil: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var porteeNumberLabel: UILabel!
    @IBOutlet weak var sociabilityLabel: UILabel!
    @IBOutlet weak var sevreLabel: UILabel!
    @IBOutlet weak var closeBtn: UIButton!
    
    var animal: Animal?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if navigationController != nil {
            closeBtn.isHidden = true
        } else {
            closeBtn.isHidden = false
        }
        
        if let pet = animal {
            typeLabel.text = pet.type.rawValue
            nameLabel.text = pet.name
            dateOfBirthLabel.text = "né(e) le : \(pet.date)"
            sociabilityLabel.text = "Sociabilité : \(pet.sociabilite) %"
            sevreLabel.text = pet.sevre ? "Sevré(e)" : "Non sevré(e)"
            porteeNumberLabel.text = "Nombre dans la portée: \(pet.portee)"
            setupImage(pet: pet)
            
        }
    
    }
    
    func setupImage(pet: Animal) {
        animalProfil.layer.borderWidth = 4
        animalProfil.layer.borderColor = UIColor.systemBackground.cgColor
        
        if pet.image != nil {
            animalProfil.image = pet.image
        } else {
            animalProfil.image = UIImage(named: pet.type.rawValue)
        }
    }
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    


}
