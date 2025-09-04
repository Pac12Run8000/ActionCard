import UIKit

final class PrimaryButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        backgroundColor = Theme.Color.accent
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 15)
        layer.cornerRadius = Theme.Radius.button
        heightAnchor.constraint(equalToConstant: 44).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        // Dynamic Type friendly
        titleLabel?.adjustsFontForContentSizeCategory = true
    }
    required init?(coder: NSCoder) { fatalError() }
}
