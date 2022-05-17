//
//  BackpackView.swift
//  pokedex
//
//  Created by Silvia España on 4/5/22.
//

import SwiftUI

struct BackpackView: View {
    
    @StateObject var viewModel = BackpackViewModel()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                EmptyBackpackView()
                
                if viewModel.pokemon != nil {
                    
                    Text(viewModel.pokemon!.name)
                }
                
                HStack {
                    
                    Button {
                        
                        viewModel.getPokemon()
                    } label: {
                        
                        Image("")
                            .renderImage(url: URL(string: "https://media3.giphy.com/media/eh6F4t0Pm3E6eXfumz/giphy.gif?cid=790b76111b45b3c7b3039b8372b0d6afd031df04ceb9a815&rid=giphy.gif&ct=s")!)
                            .help("Click to find a Pokemon")
                            .frame(width: 100, height: 130)
                            .padding()
                    }
                    if viewModel.pokemon != nil {
                        Button {
                            
                            //makefav
                        } label: {
                            
                            Image("")
                                .renderImage(url: URL(string: "https://media0.giphy.com/media/s21vXaSxCP0pB10I7E/giphy.gif?cid=790b761107b361d755b1e601ee54cf3cfc4d9a0d94201441&rid=giphy.gif&ct=s")!)
                                .help("Catch your pokemon")
                                .frame(width: 100, height: 100)
                                .padding()
                        }
                    }
                }
            }
            .toolbar {
                
                ToolbarItem(placement: .principal) {
                    
                    Text("Your backpack")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                }
            }
        }
    }
}

struct BackpackView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        BackpackView()
    }
}
