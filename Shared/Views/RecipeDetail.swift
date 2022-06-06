//
//  RecipeDetail.swift
//  AFL4_0706012010033
//
//  Created by MacBook Pro on 03/06/22.
//

import SwiftUI

struct RecipeDetail: View {
    
    @State var energy:[Double] = [200,200,200,200]
    @State var ingredients:[String] = ["asfnfjkfkfkfkfkkfkffkkfkfkfkd","asd","asd","asd"]
    @State var id:Int=0
    @State var title:String = "Martabak"
    @State var imageurl:String = "martabak"
    @State var about:String="After attending computer science school, I am interested in cooking food especially Indian food. Prata bread and butter chicken are my favourite foods."
    let columns = [
        GridItem(.adaptive(minimum: 145))
    ]
    var body: some View {
        ScrollView{
            VStack{
                Image(imageurl)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 320, height: 230)
                    .cornerRadius(15)
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                    .frame(width:320)
                Text(about)
                    .font(.callout)
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding([.leading, .bottom, .trailing])
                Text("Nutritions")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .offset(x:-96)
                LazyVGrid(columns: columns, spacing: 20){
                    ZStack{
                        Rectangle()
                            .frame(width: 145, height: 70)
                            .cornerRadius(30)
                            .brightness(-0.13)
                        Text(String(energy[0]))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .font(.callout)
                            .offset(x: -38)
                        Text("Calories")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.callout)
                            .offset(x: 23, y: -10)
                        Text("Kcal")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .font(.callout)
                            .offset(x: 8, y: 10)
                    }
                    ZStack{
                        Rectangle()
                            .frame(width: 145, height: 70)
                            .cornerRadius(30)
                            .brightness(-0.13)
                        Text(String(energy[1]))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .font(.callout)
                            .offset(x: -38)
                        Text("Carbo")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.callout)
                            .offset(x: 15, y: -10)
                        Text("Gram")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .font(.callout)
                            .offset(x: 12, y: 10)
                    }
                    ZStack{
                        Rectangle()
                            .frame(width: 145, height: 70)
                            .cornerRadius(30)
                            .brightness(-0.13)
                        Text(String(energy[2]))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .font(.callout)
                            .offset(x: -38)
                        Text("Protein")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.callout)
                            .offset(x: 20, y: -10)
                        Text("Gram")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .font(.callout)
                            .offset(x: 12, y: 10)
                    }
                    ZStack{
                        Rectangle()
                            .frame(width: 145, height: 70)
                            .cornerRadius(30)
                            .brightness(-0.13)
                        Text(String(energy[3]))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .font(.callout)
                            .offset(x: -38)
                        Text("Calcium")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.callout)
                            .offset(x: 23, y: -10)
                        Text("Gram")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .font(.callout)
                            .offset(x: 12, y: 10)
                    }
                    
                    VStack{
                        Text("Ingredients")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.bottom)
                            .offset(x:-10)
                        ForEach (ingredients, id: \.self) { ingredients in
                            Text(ingredients)
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal)
                                .lineLimit(nil)
                                .offset(x:-15, y:-14)
                                .frame(width:320)
                        }
                    }
                }
            }
        }
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail()
    }
}
