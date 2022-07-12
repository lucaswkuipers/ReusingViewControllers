import XCTest
@testable import ReusingViewControllers

final class ReusableViewControllerTests: XCTestCase {
    func test_lifeCycle_sendsEventsCorrectly() {
        let (sut, delegateSpy) = makeSUT()

        sut.viewDidLoad()

        sut.viewWillAppear(true)
        sut.viewWillAppear(false)

        sut.viewDidAppear(true)
        sut.viewDidAppear(false)

        sut.viewWillLayoutSubviews()
        sut.viewDidLayoutSubviews()

        sut.viewWillDisappear(true)
        sut.viewWillDisappear(false)

        sut.viewDidDisappear(true)
        sut.viewDidDisappear(false)

        XCTAssertEqual(
            delegateSpy.receivedMessages,
            [
                .didLoadView,

                .willAppearView(true),
                .willAppearView(false),

                .didAppearView(true),
                .didAppearView(false),

                .willLayoutSubviews,
                .didLayoutSubviews,

                .willDisappearView(true),
                .willDisappearView(false),

                .didDisappearView(true),
                .didDisappearView(false)
            ]
        )
    }

    private final class DelegateSpy {
        enum Message: Equatable {
            case didLoadView
            case willAppearView(_ animated: Bool)
            case willLayoutSubviews
            case didLayoutSubviews
            case didAppearView(_ animated: Bool)
            case willDisappearView(_ animated: Bool)
            case didDisappearView(_ animated: Bool)
        }

        private(set) var receivedMessages: [Message] = []

        func didLoadView() {
            receivedMessages.append(.didLoadView)
        }

        func willAppearView(_ animated: Bool) {
            receivedMessages.append(.willAppearView(animated))
        }

        func didAppearView(_ animated: Bool) {
            receivedMessages.append(.didAppearView(animated))
        }

        func willLayoutSubviews() {
            receivedMessages.append(.willLayoutSubviews)
        }

        func didLayoutSubviews() {
            receivedMessages.append(.didLayoutSubviews)
        }

        func willDisappearView(_ animated: Bool) {
            receivedMessages.append(.willDisappearView(animated))
        }

        func didDisappearView(_ animated: Bool) {
            receivedMessages.append(.didDisappearView(animated))
        }
    }

    private func makeSUT() -> (ReusableViewController, DelegateSpy) {
        let sut = ReusableViewController(with: UIView())
        let delegateSpy = DelegateSpy()
        sut.didLoadView = delegateSpy.didLoadView
        sut.willAppearView = delegateSpy.willAppearView
        sut.didAppearView = delegateSpy.didAppearView
        sut.willLayoutSubviews = delegateSpy.willLayoutSubviews
        sut.didLayoutSubviews = delegateSpy.didLayoutSubviews
        sut.willDisappearView = delegateSpy.willDisappearView
        sut.didDisappearView = delegateSpy.didDisappearView
        return (sut, delegateSpy)
    }
}
