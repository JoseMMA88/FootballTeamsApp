//
//  NetworkManager.swift
//  Football Teams App
//
//  Created by Jose Manuel Malagón Alba on 19/1/25.
//

import Foundation

enum BaseURL: String {
    case allTeams = "https://api.sportmonks.com/v3/football/teams"
}

final class NetworkManager: ObservableObject {
    
    // MARK: - Properties
    
    @Published var teams: [Team] = []
    
    func fetchData() {
        if let url = URL(string: BaseURL.allTeams.rawValue) {
            var request = URLRequest(url: url)
            request.setValue("pjEVmxMlJjSyKAortvSOqcBvU1h7Dvi1zzxPWZ8sQh8Y6bO4S7ol0LDhAdrA", forHTTPHeaderField: "Authorization")
            
            let session = URLSession(configuration: .default)
            session.dataTask(with: request) { [weak self] data, response, error in
                guard let self = self else { return }
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                
                let decoder = JSONDecoder()
                do {
                    let teamsResponse = try decoder.decode(TeamsResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.teams = teamsResponse.teams
                    }
                } catch {
                    print(String(describing: error))
                }
            }.resume()
        }
    }
}
