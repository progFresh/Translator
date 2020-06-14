final class MeaningDetailsPresenter {

    // MARK: - Public Properties

    weak var view: MeaningDetailsViewInput?
    var router: MeaningDetailsRouterInput?
    var output: MeaningDetailsModuleOutput?

    // MARK: - Private Properties

    private let meaning: Meaning

    // MARK: - Init

    init(meaning: Meaning) {
        self.meaning = meaning
    }
}

// MARK: - MeaningDetailsViewOutput

extension MeaningDetailsPresenter: MeaningDetailsViewOutput {

    func viewDidLoad() {
        view?.set(title: meaning.translation.text)
    }
}

// MARK: - MeaningDetailsModuleInput

extension MeaningDetailsPresenter: MeaningDetailsModuleInput { }

