//
//  ViewModel.swift
//  MVVM
//
//  Created by Student11 on 27/11/23.
//

import SwiftUI
import Foundation

struct Wand: Codable {
    let wood: String?
    let core: String?
    let lenght: Int?
}


struct Personagem: Codable, Identifiable {
    let id: String
    let name: String?
    let alternate_names: [String]?
    let species: String?
    let gender: String?
    let house: String?
    let dateOfBirth: String?
    let yearOfBirth: Int?
    let wizard: Bool?
    let ancestry: String?
    let eyeColour: String?
    let hairColour: String?
    let wand: Wand
    let patronus: String?
    let hogwartsStudent: Bool?
    let hogwartsStaff: Bool?
    let actor: String?
    let alternate_actors: [String]?
    let alive: Bool?
    let image: String?
}

class ViewModel: ObservableObject {
    
    @Published var personagens: [Personagem] = []
    
    func fetch() {
        guard let url = URL(string: "https://hp-api.onrender.com/api/characters/house/Slytherin") else {
            print("ERRO")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                print("ERRO2")
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Personagem].self, from: data)
                
                DispatchQueue.main.async {
                    self?.personagens = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
        
       
//    var body: some View {
//
//    }
}

//class ViewModel_Previews: PreviewProvider {
//    static var previews: some ObservableObject {
//        ViewModel()
//    }
//}
