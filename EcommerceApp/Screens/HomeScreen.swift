//
//  HomeScreen.swift
//  EcommerceApp
//
//  Created by Ivan Valero on 18/02/2022.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selectedIndex: Int = 0
    private let categories = ["Todo","Silla","Sofa","Lamparas","Cocina","Mesas","Habitación"]
    var body: some View {
        NavigationView {
            ZStack {
                Color("BG")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView (.vertical, showsIndicators: false){
                    VStack(alignment: .leading) {
                        BarView()
                        
                        TitleView()
                            .padding()
                        
                        SearchView()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(0 ..< categories.count) { i in
                                    CategoryView(isActive: i == selectedIndex, text: categories[i])
                                        .onTapGesture {
                                            selectedIndex = i
                                        }
                                }
                            }
                        }
                        .padding()
                        
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 25))
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
                                    NavigationLink {
                                        DetailScreenView()
                                    } label: {
                                        ProductCardView(image: Image("chair_\(index + 1)"), size: 210)
                                            .padding(.horizontal, 5)
                                    }
                                    .navigationBarHidden(true)
                                    .foregroundColor(.black)
                                    

                                }
                            }.padding()
                        }
                        
                        
                        Text("Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 25))
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
                                    ProductCardView(image: Image("chair_\(index + 1)"), size: 180)
                                        .padding(.horizontal, 5)
                                }
                            }.padding()
                        }
                        
                        
                    }
                }
                
                
                HStack {
                    HStack  {
                        Button {
                            
                        } label: {
                            Image("home")
                        }.padding(.horizontal)
                        Spacer()
                        Button{
                            
                        } label: {
                            Image("corazon")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }.padding(.horizontal)
                        Spacer()
                        Button{
                            
                        } label: {
                            Image("carro-de-la-compra")
                                .resizable()
                                .frame(width: 22, height: 22)
                        }.padding(.horizontal)
                        Spacer()
                        Button{
                            
                        } label: {
                            Image("User")
                            
                        }.padding(.horizontal)
                    }
                    .padding()
                    .background(.white)
                    .clipShape(Capsule())
                    .frame(width: .infinity)
                    .padding(.horizontal)
                    .shadow(color: Color.black.opacity(0.15), radius: 2, x: 8, y: 6)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    
                }
                
                
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct BarView: View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image("menu")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            Spacer()
            Button {
                
            } label: {
                Image("Perfil")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            Text("Encuentra lo mejor \nen")
                .font(.custom("PlayfairDisplay-Regular", size: 20))
                .foregroundColor(Color("Primary"))
            + Text(" Mandioca")
                .font(.custom("PlayfairDisplay-Bold", size: 30))
                .foregroundColor(Color("Primary"))
        }
    }
}

struct SearchView: View {
    @State private var search: String = ""
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Busca en Mandioca", text: $search)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
            
            Button {
                
            } label: {
                Image("flecha-izquierda")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10)
                    .padding(.trailing)
            }
        }
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(text)
                .font(.system(size: 15))
                .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.5))
                .fontWeight(.medium)
            
            if (isActive) {
                Color("Primary")
                .frame(width: 15, height: 3)
                .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20)
            Text("Silla Moderna en Pana Chesterfield")
                .font(.title3)
                .fontWeight(.bold)
                .lineLimit(1)
            
            HStack(spacing: 5){
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                Text("$23990")
                    .fontWeight(.bold)
                    .lineLimit(1)
            }
            
        }
        .frame(width: size)
        .padding()
        .background(.white)
        .cornerRadius(20)
    }
}
