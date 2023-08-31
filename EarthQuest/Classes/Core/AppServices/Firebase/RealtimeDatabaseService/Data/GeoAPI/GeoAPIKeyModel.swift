import Foundation

// MARK: - Models

struct GeoAPIResponse: Codable {
  let geoapikeys: [GeoAPIKey]
}

struct GeoAPIKey: Codable {
  let name: String
  let items: [GeoAPIItem]
}

struct GeoAPIItem: Codable {
  let id: String
  let name: String
}
