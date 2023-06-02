//
//  DataControl.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 6/1/23.
//

import Foundation
import SwiftUI

enum ErrorCodes: Error {
    case couldNotEncodeObject
    case couldNotFetchJSON
    case couldNotReadJSON
}

class DataControl: ObservableObject {
    
    static var shared = DataControl()
    
    static var restaurants: [Restaurant] = []
    static var currentRestaurant: Restaurant? = nil
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    
    private func getEncodedJson<T> (_ object: T) -> Data? where T: Codable {
        let encoder = JSONEncoder()
        
        do {
            let encodedObject = try encoder.encode(object)
            return encodedObject
        } catch {
            return nil
        }
    }
    
    
    func write<T>(object: T, with fileName: String, to baseUrl: URL) throws where T: Codable {
        guard let encodedObject = getEncodedJson(object) else {
            print("Could not get encoded object")
            return
        }
        
        let url = baseUrl.appendingPathComponent(fileName)
        
        do {
            try encodedObject.write(to: url)
        } catch {
            print("could not fetch json")
            throw ErrorCodes.couldNotFetchJSON
        }
    }
    
    func read<T>(fileName: String, from baseUrl: URL) throws -> T where T: Codable {
        let url = baseUrl.appendingPathComponent(fileName)

        do {
            let data = try Data(contentsOf: url)
            let decodedObject = try JSONDecoder().decode(T.self, from: data)
            return decodedObject
        } catch {
            print("Could not read JSON")
            throw ErrorCodes.couldNotReadJSON
        }
    }
}
