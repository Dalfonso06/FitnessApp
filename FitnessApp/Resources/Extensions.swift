//
//  Extensions.swift
//  
//
//  Created by Daniel Alfonso on 8/16/22.
//

import Foundation

extension String {
    /// Replaces "." and "@" with - to comply with firebase requirements
    func safeDatabaseKey() -> String {
        return self.replacingOccurrences(of: ".", with: "-").self.replacingOccurrences(of: "@", with: "-")
    }
}
