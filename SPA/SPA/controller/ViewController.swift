//
//  MainViewController.swift
//  SPA
//
//  Created by Caroline Zaini on 18/05/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

//
//  ViewController.swift
//  SPA
//
//  Created by Caroline Zaini on 18/05/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//



class ViewController: UIViewController {
    
    @IBOutlet weak var imageHolder: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var animalSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var myStepper: UIStepper!
    
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var mySlider: UISlider!
    
    @IBOutlet weak var detePicker: UIDatePicker!
    
    @IBOutlet weak var addButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    var datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        nameTextField.delegate = self
        addButton.layer.cornerRadius = 15
//        imageHolder.layer.cornerRadius = 5
        
        updateStepper()
        updateSwitch()
        updateSlider()
    }
    
   
    
// MARK: - Take picture
    
    func takePicture(source: UIImagePickerController.SourceType) {
        imagePicker.sourceType = source
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cameraPressed(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            takePicture(source: .camera)
        } else {
            print("Caméra non disponible")
        }
    }
    
    @IBAction func libraryPressed(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            takePicture(source: .photoLibrary)
        } else {
            print("Aucune galerie photo")
        }
    }
    
// MARK: - Stepper
    
    func updateStepper() {
          let number = Int(myStepper.value)
          stepperLabel.text = "Nombre dans la portée : \(number)"
      }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        updateStepper()
    }

// MARK: - Switch
    
    func updateSwitch() {
        switchLabel.text = mySwitch.isOn ? "Sevré" : "Non sevré"
    }
    
    @IBAction func switchPressed(_ sender: UISwitch) {
        updateSwitch()
    }
    
// MARK: - slider
    
    func updateSlider() {
        let percent = Int(mySlider.value)
        sliderLabel.text = "Sociabilité : \(percent) %"
    }
    
    @IBAction func sliderPressed(_ sender: UISlider) {
        updateSlider()
    }
    
// MARK: - date
    
    func getDate() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        return formatter.string(from: datePicker.date)
    }
    

// MARK: - add animal
    @IBAction func addAnimal(_ sender: Any) {
        guard let name = nameTextField.text, name != "" else { return }
        let animal = Animal(
            name: name,
            image: imageHolder.image,
            portee: Int(myStepper.value),
            sevre: mySwitch.isOn,
            sociabilite: Int(mySlider.value),
            date: getDate())
        print("Nouvel animal: " + animal.name)
        print(animal.portee)
        print(animal.sevre)
        print(animal.sociabilite)
        print(animal.date)
    }
    
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        /// Récupère les infos et je les attribue à mon image principale
        if let pictureEdited = info[.editedImage] as? UIImage {
            imageHolder.image = pictureEdited
        } else if let original = info[.originalImage] as? UIImage {
            imageHolder.image = original
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        /// Je ferme le picker
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}




