import UIKit

final class MeaningDetailsViewController: UIViewController, ModuleTransitionable {

    // MARK: - Constants

    private enum Constants {
        static let placeholderName = "placeholder"
        static let imageViewRadius: CGFloat = 15
    }

    // MARK: - IBOutlets

    @IBOutlet private weak var meaningImageView: UIImageView!

    // MARK: - Public Properties

    var output: MeaningDetailsViewOutput?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Translate.lightBlue
        configureImageView()
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

    func setContent(wordText: String, meaning: Meaning) {
        let placeholder = UIImage(named: Constants.placeholderName)
        meaningImageView.setImage(
            with: meaning.imageUrl,
            placeholderImage: placeholder
        )
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

    func configureImageView() {
        meaningImageView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        meaningImageView.clipsToBounds = true
        meaningImageView.layer.cornerRadius = Constants.imageViewRadius
    }
}
