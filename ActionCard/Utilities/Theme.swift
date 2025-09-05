import UIKit

enum Theme {
    enum Color {
        static let bg = UIColor.systemGray6
        static let card = UIColor.systemBackground
        static let accent = UIColor.systemBlue
        static let subtitle:UIColor = .secondaryLabel
        static let divider:UIColor = .separator
    }
    
    enum Spacing {
        static let xs:CGFloat = 8
        static let sm:CGFloat = 12
        static let md:CGFloat = 16
        static let lg:CGFloat = 20
    }
    
    enum Radius {
        static let card:CGFloat = 12
        static let button:CGFloat = 8
    }
    
}
