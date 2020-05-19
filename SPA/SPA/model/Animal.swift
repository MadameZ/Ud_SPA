//
//  Animal.swift
//  SPA
//
//  Created by Caroline Zaini on 18/05/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

struct Animal {
    var name: String
    var image: UIImage?
    var portee: Int
    var sevre: Bool
    var sociabilite: Int
    var date: String
    
}

enum AnimalType: String {
    /// En mettant String, on récupérera "chien", "chat", "autre"
    case chien, chat, autre
}
