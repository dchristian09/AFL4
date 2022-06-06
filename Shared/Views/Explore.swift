//
//  Explore.swift
//  AFL4_0706012010033
//
//  Created by MacBook Pro on 31/05/22.
//

import SwiftUI

class Data: ObservableObject{
    struct recyclerview{
        var id: Int
        var title, imageUrl, about: String
        var energy:[Double]
        var ingredients:[String]
        var favourite: Int
        var saved: Int
        
    }
    @Published var recycler:[recyclerview] = [
        recyclerview(id:0, title: "Sushi", imageUrl:"sushi", about: "Sushi is a Japanese dish of prepared vinegared rice, usually with some sugar and salt, accompanied by a variety of ingredients, such as seafood, often raw, and vegetables.", energy: [93,18.4,2.9,7.5], ingredients: ["Seaweed", "Rice", "Chicken", "Crabstick", "Avocado"], favourite: 0, saved:0),
        recyclerview(id:1, title: "Martabak", imageUrl:"martabak",about: "Martabak is a stuffed pancake or pan-fried bread which is commonly found in the Arabian Peninsula and Southeast Asia, notably in Saudi Arabia, Yemen, Indonesia, Malaysia, Singapore, Brunei, Thailand and Bangladesh. Depending on the location, the name and ingredients can significantly vary. ", energy: [431,0.2,25.4,1.7], ingredients: ["Eggs", "Meat", "Flour", "Onion", "Scallions"], favourite: 1, saved:1),
        recyclerview(id:2, title: "Water Spanich", imageUrl:"kangkung", about: "Stir-fried water spinach is a common Asian vegetable dish, known by various names in Asian languages. Water spinach is stir-fried with a variety of vegetables, spices, and sometimes meats.", energy: [19,3.1,2.5,8], ingredients: ["Water Spinach", "Garlic", "Chilli", "Oyster Sauce", "Salt", "Pepper"], favourite: 1, saved:0),
        recyclerview(id:3, title: "Kofta", imageUrl:"kofta", about:"Kofta are a family of meatball or meatloaf dishes found in Middle Eastern, South Caucasian, South Asian, Balkan, and Central Asian cuisines. In the simplest form, koftas consist of balls of minced meat – usually beef, chicken, pork, lamb or mutton, or a mixture – mixed with spices and sometimes other ingredients.", energy: [155.3,26.6,10.7,34], ingredients: ["Ground Meat", "Salt", "Lamb", "Onion", "Tomato", "Garlic", "Cumin", "Coriander", "Black Pepper", "Chili"], favourite: 0, saved:1),
        recyclerview(id:4, title: "Taco", imageUrl:"Taco", about:"A taco is a traditional Mexican dish consisting of a small hand-sized corn or wheat tortilla topped with a filling.", energy: [226.1,20,9,8], ingredients: ["Ground Meat", "Salt", "Onion", "Tomato", "Cheese", "Black Pepper", "Chili"], favourite: 0, saved:0),
        recyclerview(id:5, title: "Rendang", imageUrl:"rendang", about:"Rendang is a Minang dish originating from the Minangkabau region in West Sumatra, Indonesia. It has spread across Indonesian cuisine to the cuisines of neighbouring Southeast Asian countries such as Malaysia, Singapore, Brunei and the Philippines.", energy: [468,10.78,47.23,73], ingredients: ["Beef", "Kaffir Lime", "Coconut Milk", "Garlic", "Chili"], favourite: 1, saved:0),
        recyclerview(id:6, title: "Indomie", imageUrl:"indomie", about:"Indomie is a brand of instant noodle produced by the Indonesian company Indofood. Indofood itself is the largest instant noodle producer in the world with 16 factories. Over 15 billion packets of Indomie are produced annually. Indomie is also exported to more than 90 countries around the world.", energy: [390,53,8,0], ingredients: ["Indomie pack", "Egg", "Water", "Oil", "Salt", "Shrimp", "Tomato"], favourite: 1, saved:0),
        recyclerview(id:7, title: "Fried Rice", imageUrl:"friedrice", about:"Fried rice is a dish of cooked rice that has been stir-fried in a wok or a frying pan and is usually mixed with other ingredients such as eggs, vegetables, seafood, or meat. It is often eaten by itself or as an accompaniment to another dish.", energy: [163,4.7,31,1], ingredients: ["Rice", "Egg", "Oil", "Salt", "Black Pepper", "Oyster Sauce", "Spring Onion", "Chicken"], favourite: 1, saved:1),
    ]
}

struct Explore: View {
    
    @StateObject var data = Data()
    
    var columns = [
        GridItem(.adaptive(minimum: 145))
    ]
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20){
                    ForEach (data.recycler, id: \.id){recycler in
                        NavigationLink(destination: RecipeDetail(energy: recycler.energy, ingredients: recycler.ingredients, id: recycler.id, title: recycler.title, imageurl: recycler.imageUrl, about: recycler.about)){
                            ZStack{
                                Image(recycler.imageUrl)
                                    .resizable()
                                    .frame(width: 145, height: 145)
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
                                        .offset(x:48, y:-50)
                                }else{
                                    Button(action: {
                                        self.data.recycler[recycler.id].favourite = 0
                                    }, label: {
                                        Image("hearted")
                                            .resizable()
                                            .frame(width:20, height: 20)
                                            .foregroundColor(.white)
                                    })
                                        .offset(x:48, y:-50)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Explore Recipes")
        }
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}
