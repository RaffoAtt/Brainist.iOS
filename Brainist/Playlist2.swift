
//  ContentView.swift
//  ListBrain
//
//  Created by Matteo Rocco on 26/10/2020.
//

import SwiftUI

struct PlaylistView: View {
    
    //    @Binding var p: ParthenoKit
    //    @Binding var playlist: [Playlist]
    //    var ucode = UserDefaults.standard.string(forKey: "code")
    @State var playlist=[Playlist]()
    @Binding var state: Bool
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    let p=ParthenoKit()

    var body: some View {
        
//        VStack(alignment: .center) {
//            NavigationLink(destination: PlaylistView(), label: {
//
//            })
//            Button(action: {
//                self.mode.wrappedValue.dismiss()
//            }, label: {
//                Text("Back")
//            }).offset(x: -180, y: -20)
//
//        }
        

        
        
        NavigationView{
            
//            Text("Welcome, Let's start today's lessons")
//                .font(.headline)
//                .multilineTextAlignment(.center)
//                .padding(.top, -20.0)
                
            List(playlist) { playlist in
                NavigationLink(destination: PlayerView(playlist: playlist)){
                    FullImageRow(playlist : playlist)
                    
                    
                }
            }

            .aspectRatio(contentMode: .fill)

                
            

            .navigationBarItems(trailing:
                                    
                                    Button(action: {
                                        UserDefaults.standard.removeObject(forKey: "code")
                                        self.state.toggle()
                                    }){Text("Logout")
                                    }
            )
            .navigationBarTitle("Welcome")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                
                var code:String
                if UserDefaults.standard.string(forKey: "code")==nil{
                    code="123"
                }
                else{
                    code=UserDefaults.standard.string(forKey: "code")!
                }
                
                
                _ = p.read(team: "C", tag: code, key: "%", completion: {ris in
                    DispatchQueue.main.async {
                        let elem = ris as! String
                        if elem != ""{
                        let elem1 = elem.components(separatedBy: "§")
                        
                        
                        for elem1a in elem1{
                            let elem2 = elem1a.components(separatedBy: "|")
                            
                            let elem3 = elem2[1].components(separatedBy: ";")
                            
                            playlist.append(Playlist(name: String(elem3[0]),track: String(elem3[1]),image: String(elem3[2])))
                        }
                        }

                    }
                })}
        }

        
     
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)

                                    
        
    }
}













struct Playlist : Identifiable {
    var id = UUID()
    var name: String
    var track:String
    var image: String
}

struct FullImageRow: View {
    var playlist : Playlist
    var body: some View {
        ZStack(alignment: .center){
            
            Image(playlist.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame( height: 200)
                .cornerRadius(10.0)
            
                .overlay(
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .opacity(0)
                    
                    
                )
            Text(playlist.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.medium)
                .foregroundColor(Color.white)
            
            
        }

        
    }
    
    
    
}






struct Playlist2_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistView(state: .constant(false))
    }
}
