//
//  ContentView.swift
//  TimerSwiftUI
//
//  Created by Martynov Evgeny on 5.04.22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack() {
            Text("Hello, \(user.name)!")
                .font(.title)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            Spacer()
            ButtonView()
                .environmentObject(timer)
            ProgressBar()
                .environmentObject(timer)
            Spacer()
            Button("Delete account", action: deleteUser)
        }.frame(width: 300)
    }
    
    private func deleteUser() {
        user.isRegister = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
                .environmentObject(UserManager())
    }
}

struct ButtonView: View {
    
    @EnvironmentObject var buttonTimer: TimeCounter
    
    var body: some View {
        Button(action: { buttonTimer.startTimer() }) {
            Text("\(buttonTimer.buttonTitle)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(buttonTimer.buttonColor)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

struct ProgressBar: View {
    
    @EnvironmentObject var timer: TimeCounter
    
    var body: some View {
        ProgressView("Left:", value: Double(timer.counter), total: 3)
            .animation(Animation.linear, value: Double(timer.counter))
    }
    
    
}
