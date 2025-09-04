import UIKit

/// Card with title, optional subtitle, and a primary action button.
final class ActionCardView: CardView {

    struct Config {
        let title: String
        let subtitle: String?
        let buttonTitle: String
        let icon: UIImage?        // optional leading icon for the title
        let showsDivider: Bool    // thin separator above the button
    }

    // Expose a tap handler without leaking UIKit details to the outside
    var onButtonTap: (() -> Void)?

    // UI
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let button: PrimaryButton

    // Keep a divider optional
    private let divider = UIView()

    init(config: Config) {
        self.button = PrimaryButton(title: config.buttonTitle)
        super.init()

        // Title row (optionally with icon)
        let titleRow = UIStackView()
        titleRow.axis = .horizontal
        titleRow.alignment = .center
        titleRow.spacing = Theme.Spacing.sm

        if let icon = config.icon {
            let iv = UIImageView(image: icon)
            iv.contentMode = .scaleAspectFit
            iv.setContentHuggingPriority(.required, for: .horizontal)
            iv.widthAnchor.constraint(equalToConstant: 20).isActive = true
            iv.heightAnchor.constraint(equalToConstant: 20).isActive = true
            titleRow.addArrangedSubview(iv)
        }

        titleLabel.text = config.title
        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleRow.addArrangedSubview(titleLabel)

        // Subtitle (optional)
        subtitleLabel.font = .systemFont(ofSize: 14)
        subtitleLabel.textColor = Theme.Color.subtitle
        subtitleLabel.numberOfLines = 0
        subtitleLabel.adjustsFontForContentSizeCategory = true
        if let sub = config.subtitle { subtitleLabel.text = sub }

        // Divider (optional)
        divider.backgroundColor = Theme.Color.divider
        divider.heightAnchor.constraint(equalToConstant: 1 / UIScreen.main.scale).isActive = true
        divider.isHidden = !config.showsDivider

        // Button
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)

        // Assemble
        content.addArrangedSubview(titleRow)
        if config.subtitle != nil { content.addArrangedSubview(subtitleLabel) }
        content.setCustomSpacing(Theme.Spacing.lg, after: subtitleLabel)
        content.addArrangedSubview(divider)
        content.addArrangedSubview(button)

        // Accessibility
        isAccessibilityElement = false
        titleLabel.accessibilityTraits.insert(.header)
        button.accessibilityHint = "Activates the primary action for this card."
    }

    required init?(coder: NSCoder) { fatalError() }

    // Reconfigure later if you want to reuse the instance
    func apply(_ config: Config) {
        titleLabel.text = config.title
        subtitleLabel.text = config.subtitle
        subtitleLabel.isHidden = (config.subtitle == nil)
        button.setTitle(config.buttonTitle, for: .normal)
        divider.isHidden = !config.showsDivider
    }

    @objc private func handleTap() { onButtonTap?() }
}
