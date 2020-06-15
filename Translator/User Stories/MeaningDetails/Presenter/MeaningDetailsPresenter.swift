final class MeaningDetailsPresenter {

    // MARK: - Public Properties

    weak var view: MeaningDetailsViewInput?
    var router: MeaningDetailsRouterInput?
    var output: MeaningDetailsModuleOutput?

    // MARK: - Private Properties

    private let meaning: Meaning
    private let wordText: String

    // MARK: - Init

    init(meaning: Meaning, wordText: String) {
        self.meaning = meaning
        self.wordText = wordText
    }
}

// MARK: - MeaningDetailsViewOutput

extension MeaningDetailsPresenter: MeaningDetailsViewOutput {

    func viewDidLoad() {
        view?.set(title: meaning.translation.text)
        view?.setContent(wordText: wordText, meaning: meaning)
    }
}

// MARK: - MeaningDetailsModuleInput

extension MeaningDetailsPresenter: MeaningDetailsModuleInput { }

