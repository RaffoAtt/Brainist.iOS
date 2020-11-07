//
//  Home.swift
//  Brainist
//
//  Created by Raffaele Attanasio on 26/10/2020.
//

import Foundation
import SwiftUI

struct Home: View{
    let user=UserDefaults.standard
    var body: some View{
        
        Button(action: {
            user.removeObject(forKey: "username")
        })
        {
            
            Text("Continue")
                .customButton()
                .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
