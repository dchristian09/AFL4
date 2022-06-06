//
//  MyRecipe.swift
//  AFL4_0706012010033
//
//  Created by MacBook Pro on 31/05/22.
//

import SwiftUI


struct MyRecipe: View {
    @ObservedObject var data = Data()
    var body: some View {
        
        NavigationView{
            ScrollView{
                ScrollView(.horizontal){
                    HStack(spacing: 10){
                        ForEach (data.recycler, id: \.id){ recycler in
                            NavigationLink(destination: RecipeDetail(energy: recycler.energy, ingredients: recycler.ingredients, id: recycler.id, title: recycler.title, imageurl: recycler.imageUrl, about: recycler.about)){
                                    VStack{
                                        if recycler.favourite == 1{
                                        ZStack{
                                            Image(recycler.imageUrl)
                                                .resizable()
                                                .frame(width: 145, height: 180)
                                                .cornerRadius(30)
                                                .brightness(-0.13)
                                            Text(recycler.title)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                                .font(.title2)
                                            if recycler.favourite == 0{
                                                Button(action: {
                                                    self.data.recycler[recycler.id].favourite = 1
                                                }, label: {
                                                    Image("heart")
                                                        .resizable()
                                                        .frame(width:20, height: 20)
                                                })
                                                    .offset(x:48, y:-70)
                                            }else{
                                                Button(action: {
                                                    self.data.recycler[recycler.id].favourite = 0
                                                }, label: {
                                                    Image("hearted")
                                                        .resizable()
                                                        .frame(width:20, height: 20)
                                                        .foregroundColor(.white)
                                                })
                                                    .offset(x:48, y:-70)
                                            }
                                        }
                                        Text(recycler.title)
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                        }
                    }
                }
                Text("Saved Recipes")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .offset(x:-40)
                ScrollView(.horizontal){
                    HStack(spacing: 10){
                        ForEach (data.recycler, id: \.id){ recycler in
                            NavigationLink(destination: RecipeDetail(energy: recycler.energy, ingredients: recycler.ingredients, id: recycler.id, title: recycler.title, imageurl: recycler.imageUrl, about: recycler.about)){
                                
                                    VStack{
                                        if recycler.saved == 1{
                                        ZStack{
                                            Image(recycler.imageUrl)
                                                .resizable()
                                                .frame(width: 145, height: 180)
                                                .cornerRadius(30)
                                                .brightness(-0.13)
                                            Text(recycler.title)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                                .font(.title2)
                                            if recycler.favourite == 0{
                                                Button(action: {
                                                    self.data.recycler[recycler.id].favourite = 1
                                                }, label: {
                                                    Image("heart")
                                                        .resizable()
                                                        .frame(width:20, height: 20)
                                                })
                                                    .offset(x:48, y:-70)
                                            }else{
                                                Button(action: {
                                                    self.data.recycler[recycler.id].favourite = 0
                                                }, label: {
                                                    Image("hearted")
                                                        .resizable()
                                                        .frame(width:20, height: 20)
                                                        .foregroundColor(.white)
                                                })
                                                    .offset(x:48, y:-70)
                                            }
                                        }
                                        Text(recycler.title)
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favourites")
        }
    }
}

struct MyRecipe_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipe()
    }
}
