//
//  Extensions.swift
//  
//
//  Created by Daniel Alfonso on 8/16/22.
//

import UIKit
import Foundation

extension UIView {
    
    /// Variable to use width in place of frame.size.width
    /// - Returns
    ///     - Width variable from frame class
    public var width: CGFloat {
        return frame.size.width
    }
    
    /// Variable to use height in place of frame.size.height
    /// - Returns
    ///     - Height variable from frame class
    public var height: CGFloat {
        return frame.size.height
    }
    
    /// Variable to use top in place of frame.origin.y
    /// - Returns
    ///     - Computated top position
    public var top: CGFloat {
        return frame.origin.y
    }
    
    /// Variable to use bottom in place of computing bottom position
    /// - Returns
    ///     - Computated bottom position
    public var bottom: CGFloat {
        return frame.origin.y + frame.size.height
    }
    
    /// Variable to use left in place of frame.origin.x
    /// - Returns
    ///     - Computated left position
    public var left: CGFloat {
        return frame.origin.x
    }
    
    /// Variable to use right in place of computing right position
    /// - Returns
    ///     - Computated right position
    public var right: CGFloat {
        return frame.origin.x + frame.size.width
    }
}

extension String {
    /// Replaces "." and "@" with "-" to comply with firebase requirements
    /// - Returns
    ///     - String that replaces "." and "@" with "-"
    func safeDatabaseKey() -> String {
        return self.replacingOccurrences(of: ".", with: "-").self.replacingOccurrences(of: "@", with: "-")
    }
}
