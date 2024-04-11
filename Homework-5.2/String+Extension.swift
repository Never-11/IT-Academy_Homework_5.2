//
//  String+Extension.swift
//  Homework-5.2
//
//  Created by Андрей Неверовский on 4.04.24.
//

import Foundation

extension String {
    
    func makeClear() -> String {
        return self.replacingOccurrences(of: "_", with: " ")
    }
    
    func makeBig() -> String {
        return self.uppercased()
    }
    
}
