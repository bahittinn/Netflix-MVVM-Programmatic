//
//  Extensions.swift
//  Netflix-MVVM-Programmatic
//
//  Created by Bahittin on 20.09.2023.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}


