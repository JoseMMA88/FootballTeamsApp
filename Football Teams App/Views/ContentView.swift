//
//  ContentView.swift
//  Football Teams App
//
//  Created by Jose Manuel Malagón Alba on 19/1/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // MARK: - Observable Object
    
    @ObservedObject var networkManager = NetworkManager()

    var body: some View {
        NavigationView {
            List(networkManager.teams) { team in
                TeamViewCell(name: team.name,
                             gender: team.gender,
                             shortCode: team.shortCode ?? "",
                             image: team.imagePath,
                             yearFounded: "\(team.founded)",
                             lastGameDate: team.lastPlayedAt)
            }
            .navigationBarTitle("All Teams")
        }
        
        .onAppear {
            networkManager.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
