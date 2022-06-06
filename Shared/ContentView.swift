//
//  ContentView.swift
//  AFL4_0706012010033
//
//  Created by MacBook Pro on 31/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Explore()
                .tabItem(){
                    Image("search")
                    Text("Explore")
                }
            MyRecipe()
                .tabItem(){
                    Image("recipes")
                    Text("My Recipe")
                }
            profileview()
                .tabItem(){
                    Image("profile")
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 15.0, height: 15)
                    Text("Profile")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
