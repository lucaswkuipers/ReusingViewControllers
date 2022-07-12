import UIKit

final class ReusableViewController: UIViewController {
    var didLoadView: (() -> Void)?
    var willAppearView: ((_ animated: Bool) -> Void)?
    var willLayoutSubviews: (() -> Void)?
    var didLayoutSubviews: (() -> Void)?
    var didAppearView: ((_ animated: Bool) -> Void)?
    var willDisappearView: ((_ animated: Bool) -> Void)?
    var didDisappearView: ((_ animated: Bool) -> Void)?

    private let contentView: UIView

    init(with view: UIView) {
        self.contentView = view
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        self.view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        didLoadView?()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        willAppearView?(animated)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        willLayoutSubviews?()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        didLayoutSubviews?()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        didAppearView?(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        willDisappearView?(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        didDisappearView?(animated)
    }
}
