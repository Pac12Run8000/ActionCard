import UIKit

final class ViewController: UIViewController {
    private let stack = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.Color.bg

        stack.axis = .vertical
        stack.spacing = Theme.Spacing.md
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Theme.Spacing.md),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Theme.Spacing.md),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Theme.Spacing.md)
        ])

        let linkCard = ActionCardView(
            config: .init(
                title: "External accounts",
                subtitle: "Link your external accounts to better organize your money, budget and plan for the future.",
                buttonTitle: "Link account",
                icon: UIImage(systemName: "link"),
                showsDivider: true
            )
        )
        linkCard.onButtonTap = {
            // handle linking flow
            print("Link account tapped")
        }

        let payCard = ActionCardView(
            config: .init(
                title: "Prime Visa (...9410)",
                subtitle: "Current balance: $1,253.69",
                buttonTitle: "Pay card",
                icon: UIImage(systemName: "creditcard"),
                showsDivider: false
            )
        )
        payCard.onButtonTap = { 
            // handle payment flow
            print("Pay card tapped")
        }

        [linkCard, payCard].forEach { stack.addArrangedSubview($0) }
    }
}
