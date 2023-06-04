import UIKit

/// Controller to show and search for Character
final class RMCharacterViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        view.backgroundColor = .systemBackground
        
        RMService.shared.execute(.listCharactersRequests, expecting: RMGetAllCharactersResponnse.self) { result in
            switch result {
                case .success(let model):
                    print("Total: \(model.info.pages)")
                    print("Page result count: \(model.results.count)")
                case .failure(let error):
                    print(String(describing: error))
            }
        }
    }
}
