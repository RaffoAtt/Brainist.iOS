//
//  IntroducingView.swift
//  Brainist
//
//  Created by Raffaele Attanasio on 23/10/2020.
//

import Foundation

import SwiftUI



struct InformationContainerView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            InformationDetailView(title: "Target", subTitle: "Have your music therapy always with you.", imageName: "info.circle.fill")
            
            InformationDetailView(title: "Therapy", subTitle: "Relax, listen & follow the lead.", imageName: "headphones")
            
            
        }
        .padding(.horizontal)
    }
}


struct IntroductionView: View {
    

    @State var selection = false
    let def = UserDefaults.standard
    @State var code:String=""
    @Binding var show:Bool
//    @Binding var p:ParthenoKit
//    @Binding var playlist:[Playlist]
    
    var body: some View {
        NavigationView{
            VStack() {
                
                
                TitleView()
                Spacer()
                
                InformationContainerView()
                
                Spacer(minLength: 70)
                Text("Insert here your Code")
                    .foregroundColor(Color.white)
                    .bold()
                    .italic()
                
                
                TextField("Code", text:$code)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color.blue)
                    .multilineTextAlignment(.center)
                Spacer()
                
                VStack{
                    

                    Button(action:  {
                        
                            def.set(code,forKey: "code")
                            selection = true
                        self.show.toggle()
                            
                        }, label: {
                            Text("Continue")
                        }).customButton()
                        
                    
                }
            }.background(Image("background"))
            .padding(.horizontal)
        }
//        .navigationBarHidden(true)
        
        
    }
}



class UserSettings: ObservableObject {
    @Published var username: String {
        didSet {
            UserDefaults.standard.set(username, forKey: "code")
        }
    }
    
    init() {
        self.username = UserDefaults.standard.object(forKey: "code") as? String ?? ""
    }
}


func controlUser(def:UserDefaults) -> Bool {
    if def.string(forKey: "code")==nil{
        return true
    }else{
        return false
    }
}





struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView(show: .constant(true))
    }
}
