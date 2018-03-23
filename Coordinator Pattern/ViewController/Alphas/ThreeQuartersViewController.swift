import UIKit

class ThreeQuartersViewController: UIViewController {
  var delegate: AlphaViewControllerDelegate?

  override func viewDidLoad() {
    view.backgroundColor = .gray
    view.alpha = 0.75
    super.viewDidLoad()
    addButton(title: "100%", action: #selector(fullButtonPressed), frame: CGRect(x: 0, y: 100, width: 100, height: 40))
    addButton(title: "50%", action: #selector(halfButtonPressed), frame: CGRect(x: 0, y: 150, width: 100, height: 40))
    addButton(title: "Color", action: #selector(colorButtonPressed), frame: CGRect(x: 200, y: 125, width: 100, height: 40))
    addButton(title: "Home", action: #selector(homeButtonPressed), frame: CGRect(x: 0, y: 500, width: 100, height: 40))
  }

  func addButton(title: String, action: Selector, frame: CGRect) {
    let button = UIButton(frame: frame)
    button.setTitle(title, for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.addTarget(nil, action: action, for: .touchUpInside)
    button.backgroundColor = .white
    view.addSubview(button)
  }

  @objc func fullButtonPressed(_ sender: Any) {
    delegate?.alphaButtonPressed(alpha: .full)
  }

  @objc func halfButtonPressed(_ sender: Any) {
    delegate?.alphaButtonPressed(alpha: .half)
  }

  @objc func colorButtonPressed(_ sender: Any) {
    delegate?.colorButtonPressed()
  }

  @objc func homeButtonPressed(_ sender: Any) {
    delegate?.homeButtonPressed()
  }
}
