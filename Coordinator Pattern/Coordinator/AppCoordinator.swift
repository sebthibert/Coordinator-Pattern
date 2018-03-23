import UIKit

class AppCoordinator: Coordinator {
  var childCoordinators: [Coordinator] = []

  var rootViewController: UIViewController {
    return navigationController
  }

  let window: UIWindow

  private lazy var navigationController: UINavigationController = {
    let navigationController = UINavigationController()
    navigationController.isNavigationBarHidden = true
    return navigationController
  }()

  init(window: UIWindow) {
    self.window = window
    self.window.rootViewController = self.rootViewController
    self.window.makeKeyAndVisible()
  }

  func start() {
    let homeViewController = HomeViewController()
    homeViewController.delegate = self
    navigationController.viewControllers = [homeViewController]
  }
}

extension AppCoordinator: HomeViewControllerDelegate {
  func colorPressed() {
    let colorCoordinator = ColorCoordinator()
    colorCoordinator.delegate = self
    colorCoordinator.start()
    addChildCoordinator(colorCoordinator)
    rootViewController.present(colorCoordinator.rootViewController, animated: true, completion: nil)
  }

  func alphaPressed() {
    let alphaCoordinator = AlphaCoordinator()
    alphaCoordinator.delegate = self
    alphaCoordinator.start()
    addChildCoordinator(alphaCoordinator)
    rootViewController.present(alphaCoordinator.rootViewController, animated: true, completion: nil)
  }
}

extension AppCoordinator: ColorCoordinatorDelegate {
  func alphaButtonPressed(colorCoordinator: ColorCoordinator) {
    colorCoordinator.rootViewController.dismiss(animated: true, completion: nil)
    removeChildCoordinator(colorCoordinator)
    alphaPressed()
  }

  func homeButtonPressed(colorCoordinator: ColorCoordinator) {
    colorCoordinator.rootViewController.dismiss(animated: true, completion: nil)
    removeChildCoordinator(colorCoordinator)
  }
}

extension AppCoordinator:  AlphaCoordinatorDelegate {
  func colorButtonPressed(alphaCoordinator: AlphaCoordinator) {
    alphaCoordinator.rootViewController.dismiss(animated: true, completion: nil)
    removeChildCoordinator(alphaCoordinator)
    colorPressed()
  }

  func homeButtonPressed(alphaCoordinator: AlphaCoordinator) {
    alphaCoordinator.rootViewController.dismiss(animated: true, completion: nil)
    removeChildCoordinator(alphaCoordinator)
  }
}
