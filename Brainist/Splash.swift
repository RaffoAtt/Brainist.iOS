//
//  Splash.swift
//  Brainist
//
//  Created by Raffaele Attanasio on 26/10/2020.
//

import Foundation
import SwiftUI

struct Splash: View{
    
    
    let user = UserDefaults.standard.string(forKey: "code")
    
    @State  var showMainView1=false
    @State  var showMainView2=false
    
    @State var p = ParthenoKit()
    
    var body: some View{
        NavigationView{

//                NavigationLink(destination: IntroductionView(), isActive: self.$showMainView1) {
//                        IntroductionView()
//                }
                
                NavigationLink(destination: PlaylistView(), isActive: self.$showMainView2) {
                        PlaylistView()
                }

        }
        .onAppear{
 
            if user==""{
                    showMainView1=true
                    showMainView2=false
                }
                else{
            self.showMainView1=false
            self.showMainView2=true
                }
            }
        }
    }







struct Splash_Preview: PreviewProvider {
    static var previews: some View {
        Splash()
        
    }
}
