import UIKit

protocol AlphaCoordinatorDelegate: class {
  func colorButtonPressed(alphaCoordinator: AlphaCoordinator)
  func homeButtonPressed(alphaCoordinator: AlphaCoordinator)
}

class AlphaCoordinator: Coordinator {
  var childCoordinators: [Coordinator] = []
  var delegate: AlphaCoordinatorDelegate?

  var rootViewController: UIViewController {
    return navigationController
  }

  private lazy var navigationController: UINavigationController = {
    let navigationController = UINavigationController()
    navigationController.isNavigationBarHidden = true
    return navigationController
  }()

  func start() {
    showFullViewController()
  }

  private func showFullViewController() {
    let fullViewController = FullViewController()
    fullViewController.delegate = self
    navigationController.viewControllers = [fullViewController]
  }

  private func showThreeQuartersViewController() {
    let threeQuartersViewController = ThreeQuartersViewController()
    threeQuartersViewController.delegate = self
    navigationController.viewControllers = [threeQuartersViewController]
  }

  private func showHalfViewController() {
    let halfViewController = HalfViewController()
    halfViewController.delegate = self
    navigationController.viewControllers = [halfViewController]
  }
}

enum Alpha {
  case full
  case threeQuarters
  case half
}

protocol AlphaViewControllerDelegate: class {
  func alphaButtonPressed(alpha: Alpha)
  func colorButtonPressed()
  func homeButtonPressed()
}

extension AlphaCoordinator: AlphaViewControllerDelegate {
  func alphaButtonPressed(alpha: Alpha) {
    switch alpha {
    case .full:
      showFullViewController()
    case .threeQuarters:
      showThreeQuartersViewController()
    case .half:
      showHalfViewController()
    }
  }

  func colorButtonPressed() {
    delegate?.colorButtonPressed(alphaCoordinator: self)
  }

  func homeButtonPressed() {
    delegate?.homeButtonPressed(alphaCoordinator: self)
  }
}
