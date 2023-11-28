//
//  ContentView.swift
//  MVVM
//
//  Created by Student11 on 27/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    
    var body: some View {
        
        NavigationStack {
                ScrollView {
                    VStack {
                        AsyncImage(url: URL(string: "https://w0.peakpx.com/wallpaper/847/189/HD-wallpaper-sonserina-harry-potter.jpg")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 400, height: 400)
                    }
                    ForEach(viewModel.personagens.prefix(8)){ personagem in
                            NavigationLink(destination: DetailsView(personagem: personagem)) {
                                HStack {
                                    AsyncImage(url: URL(string: personagem.image!)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    } placeholder: {
                                        Color.gray
                                    }
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                    
                                    
                                    
                                    Text(personagem.name!)
                                        .font(.subheadline)
                                        .bold()
                                        .foregroundColor(Color.black)
                                    
                                    Spacer()
                                }
                                .padding(5)
                                .padding(.horizontal, 10)
                            }
                            
                            
                        }
                    }
                    .background(Color.green)
                    .ignoresSafeArea()
            
            }
            .onAppear(){
                    viewModel.fetch()
            }
        }
        
    }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
