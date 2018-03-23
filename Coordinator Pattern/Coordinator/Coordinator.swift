protocol Coordinator: class {
  var childCoordinators: [Coordinator] { get set }
}

extension Coordinator {
  func addChildCoordinator(_ childCoordinator: Coordinator) {
    childCoordinators.append(childCoordinator)
  }

  func removeChildCoordinator(_ childCoordinator: Coordinator) {
    childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
  }
}


