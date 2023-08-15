//
//  Helper.swift
//  A small collection of quick helpers to avoid repeating the same old code.
//
//  Created by Paul Hudson on 23/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}



// ВТОРОЙ ВАРИАНТ попробовать
//func load<T: Decodable> (_ filename: String) -> T {
//    let data: Data
//    
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
//        fatalError("Coundt find \(filename) in main bundle")
//    }
//    
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldnt load \(filename) from main bundle :\n\(error)")
//    }
//    
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldnt parse \(filename) as \(T.self):\n\(error)")
//    }
//}
