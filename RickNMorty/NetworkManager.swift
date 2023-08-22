//
//  NetworkManager.swift
//  RickNMorty
//
//  Created by artyom s on 20.08.2023.
//

import UIKit.UIImage

// URL https://rickandmortyapi.com/api/character

final class NetworkManager {
    static let charactersURL = URL(string: "https://rickandmortyapi.com/api/character")!

    func requestCharacters(from url: URL = charactersURL, completion: @escaping (Swift.Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: Self.charactersURL) {data, _, error in
            if let error {
                completion(.failure(error))
                return
            }

            guard let data else {
                let emptyDataError = NSError(domain: "YourAppErrorDomain", code: 0, userInfo: nil)
                completion(.failure(emptyDataError))
                return
            }
            completion(.success(data))
        }.resume()
    }

    func loadImage(with url: URL, completion: @escaping (UIImage) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data, let image = UIImage(data: data) else {
                return
            }

            DispatchQueue.main.async {
                completion(image)
            }
        }.resume()
    }

    func requestData(completion: @escaping (RickNMorty?) -> Void) {
        requestCharacters { result in
            switch result {
            case .success(let data):
                let data = try? JSONDecoder().decode(RickNMorty.self, from: data)
                DispatchQueue.main.async {
                    completion(data)
                }

            case .failure(let error):
                print(error)
            }
        }
    }
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let rickNMorty = try? JSONDecoder().decode(RickNMorty.self, from: jsonData)

// MARK: - RickNMorty
struct RickNMorty: Codable {
    var info: Info
    var results: [Result]
}

// MARK: - Info
struct Info: Codable {
    var count, pages: Int
    var next: String
    var prev: JSONNull?
}

// MARK: - Result
struct Result: Codable {
    var id: Int
    var name: String
    var status: Status
    var species: Species
    var type: String
    var gender: Gender
    var origin, location: Location
    var image: String
    var episode: [String]
    var url: String
    var created: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    var name: String
    var url: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        true
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }
    init() {}

    required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
