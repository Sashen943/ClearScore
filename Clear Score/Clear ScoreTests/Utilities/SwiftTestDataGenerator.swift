//
//  SwiftTestDataGenerator.swift
//  Clear ScoreTests
//
//  Created by Sashen Pillay on 2022/01/12.
//

import Foundation

public struct SwiftTestDataGenerator {
    public static func jsonDictionaryFrom(fileName: String, bundle: Bundle = Bundle.main) -> Data? {
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                print(error)
            }
        } else {
            print("json file named \(fileName) not found")
        }
        return nil
    }
}
