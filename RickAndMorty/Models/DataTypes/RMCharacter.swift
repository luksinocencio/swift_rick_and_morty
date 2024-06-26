import Foundation

struct RMCharacter: Codable {
    let id: Int
    let name: String
    let species: String
    let type: String
    let status: RMCharacterStatus
    let gender: RMCharacterGender
    let origin: RMOrigin
    let location: RMSingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

