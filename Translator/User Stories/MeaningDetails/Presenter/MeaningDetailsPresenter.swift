final class MeaningDetailsPresenter {

    // MARK: - Public Properties

    weak var view: MeaningDetailsViewInput?
    var router: MeaningDetailsRouterInput?
    var output: MeaningDetailsModuleOutput?
}

// MARK: - MeaningDetailsViewOutput

extension MeaningDetailsPresenter: MeaningDetailsViewOutput { }

// MARK: - MeaningDetailsModuleInput

extension MeaningDetailsPresenter: MeaningDetailsModuleInput { }

