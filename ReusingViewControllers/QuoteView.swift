import UIKit

final class QuoteView: UIView {
    private let portraitImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 64
        imageView.clipsToBounds = true
        return imageView
    }()

    private let quoteLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        label.numberOfLines = 1
        return label
    }()

    func setupData(imageName: String, quote: String, author: String) {
        portraitImageView.image = UIImage(named: imageName)
        quoteLabel.text = quote
        authorLabel.text = "- \(author)."
    }

    init() {
        super.init(frame: .zero)
        setupViewStyle()
        setupViewHierarchy()
        setupViewConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupViewStyle() {
        backgroundColor = .systemBackground
    }

    private func setupViewHierarchy() {
        addSubview(portraitImageView)
        addSubview(quoteLabel)
        addSubview(authorLabel)
    }

    private func setupViewConstraints() {
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            portraitImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -40),
            portraitImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            portraitImageView.widthAnchor.constraint(equalToConstant: 128),
            portraitImageView.heightAnchor.constraint(equalToConstant: 128),

            quoteLabel.topAnchor.constraint(equalTo: portraitImageView.bottomAnchor, constant: 40),
            quoteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            quoteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            authorLabel.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 20),
            authorLabel.leadingAnchor.constraint(equalTo: quoteLabel.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: quoteLabel.trailingAnchor)
        ])
    }
}
