//
//  ContentView.swift
//  Shared
//
//  Created by MacBook Pro on 24/05/22.
//

import SwiftUI

struct profileview: View {
    @State private var showRecipe = false
    @State private var showInfo = true
    @ObservedObject var data = Data()
    
    var columns = [
        GridItem(.adaptive(minimum: 145))
    ]
    
    var body: some View {
        ScrollView{
            VStack{
                
                Image("kitchen")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250, height: 300)
                    .offset(y:-20)
                    .brightness(-0.29)
                
                Image("man")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(.white, lineWidth:4)
                    }
                    .shadow(radius:7)
                    .offset(y:-300)
                
                Text("Kenny Jinhiro")
                    .font(.title)
                    .fontWeight(.bold)
                    .offset(y:-305)
                    .foregroundColor(.white)
                Text("Home Chef")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .offset(y:-305)
                    .foregroundColor(.white)
                
                Rectangle()
                    .frame(width: 330, height: 60)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .offset(y:-290)
                
                HStack{
                    Button(action: {
                        self.showInfo=true
                        self.showRecipe = false
                    }, label: {
                        
                        if showInfo{
                            Text("Chef Info")
                                .accentColor(.black)
                        }else{
                            Text("Chef Info")
                                .accentColor(.gray)
                        }
                        
                            
                    })
                        .offset(x:-13, y:-340)
                    Button(action: {
                        self.showInfo = false
                        self.showRecipe = true
                    }, label: {
                        if showRecipe{
                            Text("Recipes")
                                .accentColor(.black)
                        }else{
                            Text("Recipes")
                                .accentColor(.gray)
                        }
                        
                    })
                        .offset(x:12, y:-340)
                }
                HStack{
                    if showRecipe{
                        Rectangle()
                            .frame(width: 100, height:2)
                            .offset(x:5,y:-350)
                            .foregroundColor(.gray)
                        Rectangle()
                            .frame(width: 100, height:2)
                            .offset(x:-5,y:-350)
                            .foregroundColor(.black)
                    }else{
                        Rectangle()
                            .frame(width: 100, height:2)
                            .offset(x:5,y:-350)
                            .foregroundColor(.black)
                        Rectangle()
                            .frame(width: 100, height:2)
                            .offset(x:-5,y:-350)
                            .foregroundColor(.gray)
                    }
                }
                Group{
                    if showInfo{
                    Text("About")
                        .font(.title2)
                        .fontWeight(.bold)
                        .offset(x:-120, y:-350)
                        .foregroundColor(.black)
                    Text("After attending computer science school, I am interested in cooking food especially Indian food. Prata bread and butter chicken are my favourite foods.")
                        .font(.body)
                        .fontWeight(.regular)
                        .padding(.horizontal)
                        .offset(x:1, y:-345)
                        .foregroundColor(.black)
                        .lineLimit(nil)
                        .fixedSize(horizontal:false, vertical:true)
                    Text("Speciality")
                        .font(.title2)
                        .fontWeight(.bold)
                        .offset(x:-102, y:-340)
                        .foregroundColor(.black)
                    Text("- Butter chicken                                               - Prata bread                                                    - Fish curry")
                        .font(.body)
                        .fontWeight(.regular)
                        .offset(x:17, y:-335)
                        .foregroundColor(.black)
                        .lineLimit(nil)
                        .fixedSize(horizontal:false, vertical:true)
                    }else{
                        LazyVGrid(columns: columns, spacing: 20){
                            ForEach (data.recycler, id: \.id){recycler in
                                if recycler.saved == 1{
                                        NavigationLink(destination: RecipeDetail(energy: recycler.energy, ingredients: recycler.ingredients, id: recycler.id, title: recycler.title, imageurl: recycler.imageUrl, about: recycler.about)){
                                        ZStack{
                                            Image(recycler.imageUrl)
                                                .resizable()
                                                .frame(width: 145, height: 145)
                                                .cornerRadius(30)
                                                .brightness(-0.13)
                                                .offset(y: -320)
                                            Text(recycler.title)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                                .font(.title2)
                                                .offset(y: -320)
                                            if recycler.favourite == 0{
                                                Button(action: {
                                                    self.data.recycler[recycler.id].favourite = 1
                                                }, label: {
                                                    Image("heart")
                                                        .resizable()
                                                        .frame(width:20, height: 20)
                                                })
                                                    .offset(x:48, y:-370)
                                            }else{
                                                Button(action: {
                                                    self.data.recycler[recycler.id].favourite = 0
                                                }, label: {
                                                    Image("hearted")
                                                        .resizable()
                                                        .frame(width:20, height: 20)
                                                        .foregroundColor(.white)
                                                })
                                                    .offset(x:48, y:-370)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct profileview_Previews: PreviewProvider {
    static var previews: some View {
        profileview()
    }
}
