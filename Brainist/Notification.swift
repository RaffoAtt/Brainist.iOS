//
//  ContentView.swift
//  Notification
//
//  Created by Matteo Rocco on 26/10/2020.
//
import UserNotifications
import SwiftUI

struct NotificationView: View {
    var body: some View {
        VStack{
            Button("Request Permission"){
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            Button("Schedule Notification"){
                let content = UNMutableNotificationContent()
                content.title = "Brainist"
                content.subtitle = "Listen the playlist"
                content.sound = UNNotificationSound.default

                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                // add our notification request
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct NotificationView_Preview: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}