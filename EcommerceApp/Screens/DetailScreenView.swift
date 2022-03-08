//
//  DetailScreenView.swift
//  EcommerceApp
//
//  Created by Ivan Valero on 08/03/2022.
//

import SwiftUI

struct DetailScreenView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color("BG")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                Image("chair_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                DescriptionView()
                    .offset(y: -40)
            }
            .edgesIgnoringSafeArea(.top)

            HStack{
                Text("$2399")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "cart")
                            .foregroundColor(Color("Primary"))
                            .frame(width: 30, height: 30)
                        Text("Comprar")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Primary"))
                        
                    }
                    
                }
                .padding(.vertical, 9)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(50, corners: .topLeft)
            .frame(maxHeight: .infinity, alignment: .bottom)
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                CustomBackButtom(action: {
            presentationMode.wrappedValue.dismiss()
        }), trailing: Image("threeDot")
        )
    }
}

struct DetailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreenView()
    }
}


struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Silla Moderna en Pana Chesterfield")
                .font(.system(.title3))
                .fontWeight(.bold)
                .lineLimit(3)
            
            HStack {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Text("4.9")
                    .padding(.leading, 4)
                Spacer()
            }
            Text("Descripción")
                .font(.callout)
                .fontWeight(.medium)
                .padding(.top, 8)
            Text("Esta silla de pana con patas de manera posee un diseño moderno e innovador, diseñada para poder descansar y disfrutar de un buen libro.")
                .font(.caption2)
                .padding(.top, 6)
                .opacity(0.6)
            HStack (alignment: .top){
                VStack (alignment: .leading) {
                    Text("Dimensiones")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .padding(.top, 4)
                        .padding(.bottom, 1)
                    Text("Ancho: 90 cm")
                        .font(.caption2)
                        .opacity(0.6)
                    Text("Alto: 120 cm")
                        .font(.caption2)
                        .opacity(0.6)
                    Text("Profundo: 35 cm")
                        .font(.caption2)
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack (alignment: .leading) {
                    Text("Diseño")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .padding(.top, 4)
                        .padding(.bottom, 1)
                    Text("Tela: Pana")
                        .font(.caption2)
                        .opacity(0.6)
                    Text("Estilo: Silla chesterfield")
                        .font(.caption2)
                        .opacity(0.6)
                    Text("Profundo: 35 cm")
                        .font(.caption2)
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 4)
            
            HStack (alignment: .top){
                VStack (alignment: .leading){
                    Text("Colores")
                        .font(.callout)
                        .fontWeight(.medium)
                    HStack (alignment: .bottom){
                        ColorDotView(color: .black)
                        ColorDotView(color: Color("Primary"))
                        ColorDotView(color: .white)
                    }
                }
                
                Spacer()
                
                VStack (alignment: .leading) {
                    Text("Cantidad")
                        .font(.callout)
                        .fontWeight(.medium)
                    HStack{
                        Button {
                            
                        } label: {
                            Image(systemName: "minus")
                                .padding(.all, 8)
                        }
                        .frame(width: 24, height: 24)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                        
                        Text("1")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "plus")
                                .padding(.all, 8)
                        }
                        .frame(width: 24, height: 24)
                        .background(Color("Primary"))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    }
                }
                
            }
            .padding(.vertical, 1)
            
        }
        .padding()
        .padding(.top)
        .background(Color("BG"))
        .cornerRadius(20)
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}




struct CustomBackButtom: View {
    let action: ()-> Void
    
    var body: some View {
        Button(action: action,
               label: {
                Image(systemName: "chevron.backward")
                .padding(.all, 12)
                .background(.white)
                .cornerRadius(8.0)
                .foregroundColor(.black)
        })

    }
}
