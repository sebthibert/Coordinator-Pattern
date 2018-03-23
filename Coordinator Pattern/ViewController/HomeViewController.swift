import UIKit

protocol HomeViewControllerDelegate {
  func colorPressed()
  func alphaPressed()
}

class HomeViewController: UIViewController {
  var delegate: HomeViewControllerDelegate?

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    addButton(title: "Color", action: #selector(colorButtonPressed), frame: CGRect(x: 0, y: 100, width: 100, height: 40))
    addButton(title: "Alpha", action: #selector(alphaButtonPressed), frame: CGRect(x: 0, y: 150, width: 100, height: 40))
  }

  func addButton(title: String, action: Selector, frame: CGRect) {
    let button = UIButton(frame: frame)
    button.setTitle(title, for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.addTarget(nil, action: action, for: .touchUpInside)
    button.backgroundColor = .white
    view.addSubview(button)
  }

  @objc func colorButtonPressed(_ sender: Any) {
    delegate?.colorPressed()
  }

  @objc func alphaButtonPressed(_ sender: Any) {
    delegate?.alphaPressed()
  }
}


