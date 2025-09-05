import UIKit

class CardView: UIView {
    let content = UIStackView()
    init() {
        super.init(frame: .zero)
        backgroundColor = Theme.Color.card
        layer.cornerRadius = Theme.Radius.card
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.06
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 6
        translatesAutoresizingMaskIntoConstraints = false
        
        content.axis = .vertical
        content.spacing = Theme.Spacing.sm
        content.translatesAutoresizingMaskIntoConstraints = false
        addSubview(content)
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: topAnchor, constant: Theme.Spacing.md),
            content.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Theme.Spacing.md),
            content.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Theme.Spacing.md),
            content.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Theme.Spacing.md)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
