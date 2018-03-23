import UIKit

protocol ColorCoordinatorDelegate: class {
  func alphaButtonPressed(colorCoordinator: ColorCoordinator)
  func homeButtonPressed(colorCoordinator: ColorCoordinator)
}

class ColorCoordinator: Coordinator {
  var childCoordinators: [Coordinator] = []
  var delegate: ColorCoordinatorDelegate?

  var rootViewController: UIViewController {
    return navigationController
  }

  private lazy var navigationController: UINavigationController = {
    let navigationController = UINavigationController()
    navigationController.isNavigationBarHidden = true
    return navigationController
  }()

  func start() {
    showBlueViewController()
  }

  private func showBlueViewController() {
    let blueViewController = BlueViewController()
    blueViewController.delegate = self
    navigationController.viewControllers = [blueViewController]
  }

  private func showRedViewController() {
    let redViewController = RedViewController()
    redViewController.delegate = self
    navigationController.viewControllers = [redViewController]
  }

  private func showGreenViewController() {
    let greenViewController = GreenViewController()
    greenViewController.delegate = self
    navigationController.viewControllers = [greenViewController]
  }
}

enum Color {
  case blue
  case red
  case green
}

protocol ColorViewControllerDelegate: class {
  func colorButtonPressed(color: Color)
  func alphaButtonPressed()
  func homeButtonPressed()
}

extension ColorCoordinator: ColorViewControllerDelegate {
  func colorButtonPressed(color: Color) {
    switch color {
    case .blue:
      showBlueViewController()
    case .red:
      showRedViewController()
    case .green:
      showGreenViewController()
    }
  }

  func alphaButtonPressed() {
    delegate?.alphaButtonPressed(colorCoordinator: self)
  }

  func homeButtonPressed() {
    delegate?.homeButtonPressed(colorCoordinator: self)
  }
}
