//
//  ContentView.swift
//  Player
//
//  Created by Matteo Rocco on 28/10/2020.
//

import SwiftUI
import AVKit
import Foundation
import UIKit

struct PlayerView: View {
    
    @State var playlist: Playlist
    
    
    
    var body: some View {
        
        
        Home(playlist: playlist)
    }
}



struct Home : View {
    @State var audioPlayer:AVAudioPlayer!
    @State var playlist: Playlist
    @State var selection = false
    @State var value : CGFloat = 50
    @State var select = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View{
//        VStack(alignment: .center) {
//            NavigationLink(destination: PlaylistView(), label: {
//
//            })
//            Button(action: {
//                self.mode.wrappedValue.dismiss()
//            }, label: {
//                Text("Back")
//            })
//
//        }
        
            
            VStack{
                
                
                    Text("Now Playing")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    
                    // Track Image...
                    
                    Image(playlist.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                        
                        .padding(.horizontal, 25)
                        .clipShape(Circle())
                        
                        .background(Color("Color").opacity(0.6))
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.35),radius: 8,x: 8,y: 8)
                        .shadow(color: Color.white,radius: 10,x: -10,y: -10)
                        .padding(.top, 35)
                    
                    
                    Text(playlist.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.top, 25)
                    
                    Text(playlist.track)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.top, 8)
                    
                    
                    
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                        
                        Capsule()
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: 6)
                        
                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .center)) {
                            
                            Capsule()
                                .fill(Color("Color1").opacity(0.6))
                                .frame(width: value,height: 6)
                            
                            // Drag Button....
                            
                            Circle()
                                .fill(Color("Color1").opacity(0.7))
                                .frame(width: 10, height: 10)
                                .padding(.all, 10)
                                .background(Color("Color"))
                                .clipShape(Circle())
                                // adding shadow...
                                .shadow(color: Color("Color1").opacity(0.6),radius: 10,x: 4,y: 2)
                        }
                    })
                    
                    
                    
                    
                    
                    HStack(spacing: 20){
                        
                        
                        Button(action:{
                            self.audioPlayer.play()
                        }){
                            
                            Image(systemName: "play.fill")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.gray)
                                .padding(.all, 25)
                                .background(Color("Color"))
                                .clipShape(Circle())
                                // adding shadow...
                                .shadow(color: Color("Color1").opacity(0.6),radius: 5,x: 5,y: 5)
                                .shadow(color: Color.white,radius: 5,x: -5,y: -5)
                        }
                        Button(action: {
                            self.audioPlayer.pause()
                        }){
                            
                            Image(systemName: "pause.fill")
                                .font(.callout)
                                .foregroundColor(.gray)
                                .padding(.all, 25.0)
                                .background(Color("Color1"))
                                .clipShape(Circle())
                                // adding shadow...
                                .shadow(color: Color("Color1").opacity(0.6),radius: 5,x: 5,y: 5)
                                .shadow(color: Color.white,radius: 5,x: -5,y: -5)
                        }
                    }
                    
                    
                    .onAppear{
                        let song = Bundle.main.path(forResource: playlist.track, ofType: "mp3")
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: song!))
                        
                        
                        
                    }
                
                    
                    
            }
            

                
            


                
    }
    
}

//}


