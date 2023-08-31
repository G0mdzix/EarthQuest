import Foundation

// MARK: - Models

struct GeoApifyPlacesFeatureCollection: Codable {
  let type: String
  let features: [GeoApifyPlacesFeature]
}

struct GeoApifyPlacesFeature: Codable {
  let type: String
  let properties: GeoApifyPlacesProperties
  let geometry: GeoApifyPlacesGeometry
}

struct GeoApifyPlacesProperties: Codable {
  let name: String
  let country: String
  let country_code: String
  let state: String
  let county: String
  let city: String
  let postcode: String
  let suburb: String?
  let street: String
  let housenumber: String?
  let lon: Double
  let lat: Double
  let formatted: String
  let address_line1: String
  let address_line2: String
  let categories: [String]
  let details: [String]
  let datasource: GeoApifyPlacesDatasource
  let place_id: String
}

struct GeoApifyPlacesDatasource: Codable {
  let sourcename: String
  let attribution: String
  let license: String
  let url: String
  let raw: GeoApifyPlacesRawData
}

struct GeoApifyPlacesRawData: Codable {
  let name: String?
  let shop: String?
  let brand: String?
  let osm_id: Int?
}

struct GeoApifyPlacesGeometry: Codable {
  let type: String
  let coordinates: [Double]
}
