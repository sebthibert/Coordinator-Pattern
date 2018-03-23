import UIKit

class RedViewController: UIViewController {
  var delegate: ColorViewControllerDelegate?

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red
    addButton(title: "Blue", action: #selector(blueButtonPressed), frame: CGRect(x: 0, y: 100, width: 100, height: 40))
    addButton(title: "Green", action: #selector(greenButtonPressed), frame: CGRect(x: 0, y: 150, width: 100, height: 40))
    addButton(title: "Alpha", action: #selector(alphaButtonPressed), frame: CGRect(x: 200, y: 125, width: 100, height: 40))
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

  @objc func blueButtonPressed(_ sender: Any) {
    delegate?.colorButtonPressed(color: .blue)
  }

  @objc func greenButtonPressed(_ sender: Any) {
    delegate?.colorButtonPressed(color: .green)
  }

  @objc func alphaButtonPressed(_ sender: Any) {
    delegate?.alphaButtonPressed()
  }

  @objc func homeButtonPressed(_ sender: Any) {
    delegate?.homeButtonPressed()
  }
}
