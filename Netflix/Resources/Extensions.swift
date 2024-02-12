//
//  Extensions.swift
//  Netflix
//
//  Created by Raj Guggilla on 12/02/24.
//

import Foundation

extension String {
     
    func capitaliseFirstLetter() -> String {
        return ( self.prefix(1).uppercased() + self.lowercased().dropFirst() )
    }
}
