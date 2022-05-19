//
//  PokeworldView.swift
//  pokedex
//
//  Created by Silvia España on 18/5/22.
//

import SwiftUI

struct PokeworldView: View {
    
    @StateObject var viewModel = PokeworldViewModel()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                if viewModel.pokemon == nil {
                    
                    VStack {
                        
                        Text("""
                         \"Hello there! Welcome to the world of Pokémon!
                         
                         My name is Oak! People call me the Pokémon Prof!
                         
                         This world is inhabited by creatures called Pokémon! For some people, pokémon are pets. Others use them for fights. Myself...I study Pokémon as a profession.\"
                         """)
                            .padding(.bottom)
                        Divider()
                        Text("Click on your gameboy to find a Pokémon")
                            .padding(.top)
                        
                        Spacer()
                        
                        ButtonView(action: viewModel.getPokemon,
                                   image: viewModel.gameboyImage,
                                   helpText: "Find a Pokémon",
                                   width: 90)
                        
                        Spacer()
                    }
                    .padding()
                    
                } else {
                    
                    Spacer()
                    
                    PokemonCardView(name: viewModel.pokemon!.name, weight: viewModel.pokemon!.weight, height: viewModel.pokemon!.height, image: viewModel.pokemon!.sprites.url)
                    
                    Spacer()
                    
                    HStack {
                        
                        ButtonView(action: viewModel.getPokemon,
                                   image: viewModel.gameboyImage,
                                   helpText: "Find a Pokémon",
                                   width: 90)
                        
                        if viewModel.pokemon != nil {
                            
                            ButtonView(action: viewModel.catchPokemon,
                                       image: viewModel.pokeballImage,
                                       helpText: "Catch the Pokémon")
                                .disabled(viewModel.isCatched ? true : false)
                                .blur(radius: viewModel.isCatched ? 4 : 0)
                        }
                    }
                    Spacer()
                }
            }.overlay(ToastView(toastText: viewModel.toastText ?? "")
                        .offset(y: 20), alignment: .top)
            .toolbar {
                
                ToolbarItems(helpAction: viewModel.toggleHelp)
            }
        }.sheet(isPresented: $viewModel.showHelp) {
            HelpView()
        }
    }
}


struct PokeworldView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PokeworldView()
    }
}
