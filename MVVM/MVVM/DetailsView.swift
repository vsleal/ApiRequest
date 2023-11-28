//
//  DetailsView.swift
//  MVVM
//
//  Created by Student11 on 27/11/23.
//

import SwiftUI

struct DetailsView: View {
    var imagem: String = "test"
    var name: String = "test"
    var bornDate: Int = 1990
    var actor: String = "test"
    var personagem: Personagem
    
    
    var body: some View {
        
        ZStack {
            Color.green
            .opacity(0.7)
            .ignoresSafeArea()
            
            VStack {
                AsyncImage(url: URL(string: personagem.image ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Color.gray
                }
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                
                Text(personagem.name ?? "")
                    .font(.system(size: 40))
                    .padding(.bottom, 50)
                
                Text("Tem \(2023-(personagem.yearOfBirth ?? 1990)) anos")
                Text("E é interpretado(a) por")
                Text(personagem.actor!)
            }
            .background(Color.clear)
            .backgroundStyle(Color.clear)
            
        }
        
        
    }
}

//struct DetailsView_Previews: PreviewProvider {
//
//    var personagem: Personagem
//
//    static var previews: some View {
//        DetailsView(personagem: Personagem)
//    }
//}
