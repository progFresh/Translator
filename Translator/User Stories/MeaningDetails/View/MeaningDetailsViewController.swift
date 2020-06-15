import UIKit

final class MeaningDetailsViewController: UIViewController, ModuleTransitionable {

    // MARK: - Constants

    private enum Constants {
        static let placeholderName = "placeholder"
        static let imageViewRadius: CGFloat = 15

        static let wordTextLabelFont = UIFont.systemFont(ofSize: 27)
        static let translationLabelFont = UIFont.systemFont(ofSize: 15)
        static let notesLabelFont = UIFont.systemFont(ofSize: 12)
    }

    // MARK: - IBOutlets

    @IBOutlet private weak var meaningImageView: UIImageView!
    @IBOutlet private weak var wordTextLabel: UILabel!
    @IBOutlet private weak var translationLabel: UILabel!
    @IBOutlet private weak var notesLabel: UILabel!
    
    // MARK: - Public Properties

    var output: MeaningDetailsViewOutput?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Translate.lightBlue
        configureImageView()
        configureLabels()
        output?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

// MARK: - MeaningDetailsViewInput

extension MeaningDetailsViewController: MeaningDetailsViewInput {

    func setContent(wordText: String, meaning: Meaning) {
        let placeholder = UIImage(named: Constants.placeholderName)
        meaningImageView.setImage(
            with: meaning.imageUrl,
            placeholderImage: placeholder
        )

        wordTextLabel.text = wordText
        translationLabel.text = meaning.translation.text
        if let notes = meaning.translation.note,
            !notes.isEmpty {
            notesLabel.text = "(" + notes + ")"
        }
    }
}

// MARK: - Private Methods

private extension MeaningDetailsViewController {

    func configureImageView() {
        meaningImageView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        meaningImageView.clipsToBounds = true
        meaningImageView.layer.cornerRadius = Constants.imageViewRadius
    }

    func configureLabels() {
        wordTextLabel.font = Constants.wordTextLabelFont
        translationLabel.font = Constants.translationLabelFont
        notesLabel.font = Constants.notesLabelFont
        notesLabel.text = ""

        notesLabel.textColor = .darkGray
    }
}
