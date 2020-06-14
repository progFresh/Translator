import UIKit

/// Экраны:
///     - 
final class MeaningDetailsViewController: UIViewController, ModuleTransitionable {

    // MARK: - Public Properties

    var output: MeaningDetailsViewOutput?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - MeaningDetailsViewInput

extension MeaningDetailsViewController: MeaningDetailsViewInput { }
