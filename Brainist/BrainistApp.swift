//
//  BrainistApp.swift
//  Brainist
//
//  Created by Raffaele Attanasio on 23/10/2020.
//

import SwiftUI

@main
struct BrainistApp: App {

    
    let user = UserDefaults.standard.string(forKey: "code") ?? ""
    
    @State  var showMainView1=true
        
    init() {
        _showMainView1=State(initialValue: user == "" ? true : false)
    }
    var body: some Scene {
        
        
        WindowGroup {
            
            if showMainView1{
                
                IntroductionView(show: $showMainView1)
            }
            else{
                PlaylistView(state: $showMainView1)
            }
        }
    }
}




