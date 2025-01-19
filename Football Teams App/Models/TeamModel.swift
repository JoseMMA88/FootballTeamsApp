//
//  TeamModel.swift
//  Football Teams App
//
//  Created by Jose Manuel Malagón Alba on 19/1/25.
//


struct TeamsResponse: Decodable {
    let teams: [Team]
    let pagination: Pagination
    
    enum CodingKeys: String, CodingKey {
        case teams = "data"
        case pagination
    }
}

struct Team: Decodable, Identifiable {
    
    let id: Int
    let sportId: Int
    let countryId: Int
    let venueId: Int
    let gender: String
    let name: String
    let shortCode: String?
    let imagePath: String
    let founded: Int
    let type: String
    let placeholder: Bool
    let lastPlayedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case sportId = "sport_id"
        case countryId = "country_id"
        case venueId = "venue_id"
        case gender
        case name
        case shortCode = "short_code"
        case imagePath = "image_path"
        case founded
        case type
        case placeholder
        case lastPlayedAt = "last_played_at"
    }
}

struct Pagination: Decodable {
    let count: Int
    let perPage: Int
    let currentPage: Int
    let nextPage: String
    let hasMore: Bool

    enum CodingKeys: String, CodingKey {
        case count
        case perPage = "per_page"
        case currentPage = "current_page"
        case nextPage = "next_page"
        case hasMore = "has_more"
    }
}

struct Subscription: Decodable {
    let meta: [String]
    let plans: [Plan]
}

struct Plan: Decodable {
    let plan: String
    let sport: String
    let category: String
}

struct RateLimit: Decodable {
    let resetsInSeconds: Int
    let remaining: Int
    let requestedEntity: String

    enum CodingKeys: String, CodingKey {
        case resetsInSeconds = "resets_in_seconds"
        case remaining
        case requestedEntity = "requested_entity"
    }
}
