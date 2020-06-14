import UIKit

final class MeaningDetailsModuleConfigurator {

    // MARK: - Public Methods

    func configure(output: MeaningDetailsModuleOutput? = nil) -> MeaningDetailsViewController {
        
        let name = String(describing: MeaningDetailsViewController.self)
        let controller = UIStoryboard(name: name, bundle: Bundle.main).instantiateInitialViewController()

        guard let view = controller as? MeaningDetailsViewController else {
            fatalError("Can't load \(name) from storyboard, check that controller is initial view controller")
        }

        let presenter = MeaningDetailsPresenter()
        let router = MeaningDetailsRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
