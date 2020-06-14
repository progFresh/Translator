import UIKit

final class MeaningDetailsViewController: UIViewController, ModuleTransitionable {

    // MARK: - Public Properties

    var output: MeaningDetailsViewOutput?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Translate.lightBlue
        output?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigation()
    }
}

// MARK: - MeaningDetailsViewInput

extension MeaningDetailsViewController: MeaningDetailsViewInput {

    func set(title: String) {
        self.title = title
    }
}

// MARK: - Private Methods

private extension MeaningDetailsViewController {

    func configureNavigation() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.black
        ]
        }
}
