//
//  ContentView.swift
//  Shared
//
//  Created by MacBook Pro on 24/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Image("kitchen")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 300)
                .offset(y:120)
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
                .offset(y:-155)
            
            Text("Kenny Jinhiro")
                .font(.title)
                .fontWeight(.bold)
                .offset(y:-155)
                .foregroundColor(.white)
            Text("Home Chef")
                .font(.subheadline)
                .fontWeight(.bold)
                .offset(y:-155)
                .foregroundColor(.white)
            
            Rectangle()
                .frame(width: 330, height: 60)
                .foregroundColor(.white)
                .cornerRadius(30)
                .offset(y:-150)
            
            HStack{
                Button(action: {
                    
                }, label: {
                    Text("Chef Info")
                        .accentColor(.black)
                        .offset(x:-15, y:-210)
                        
                })
                Button(action: {
                    
                }, label: {
                    Text("Recipes")
                        .accentColor(.gray)
                        .offset(x:12, y:-210)
                })
            }
            HStack{
                Rectangle()
                    .frame(width: 100, height:2)
                    .offset(x:5,y:-220)
                    .foregroundColor(.black)
                Rectangle()
                    .frame(width: 100, height:2)
                    .offset(x:-5,y:-220)
                    .foregroundColor(.gray)
            }
            Group{
                Text("About")
                    .font(.title2)
                    .fontWeight(.bold)
                    .offset(x:-130, y:-220)
                    .foregroundColor(.black)
                Text("After attending computer science school, I am interested in cooking food especially Indian food. Prata bread and butter chicken are my favourite foods.")
                    .font(.body)
                    .fontWeight(.regular)
                    .offset(x:1, y:-215)
                    .foregroundColor(.black)
                    .lineLimit(nil)
                    .fixedSize(horizontal:false, vertical:true)
                Text("Speciality")
                    .font(.title2)
                    .fontWeight(.bold)
                    .offset(x:-112, y:-210)
                    .foregroundColor(.black)
            }
            
            Text("- Butter chicken                                            - Prata bread                                                 - Fish curry")
                .font(.body)
                .fontWeight(.regular)
                .offset(x:0, y:-205)
                .foregroundColor(.black)
                .lineLimit(nil)
                .fixedSize(horizontal:false, vertical:true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
