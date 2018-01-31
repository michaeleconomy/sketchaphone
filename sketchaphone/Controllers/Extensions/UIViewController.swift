import UIKit

extension UIViewController {
    func alert(_ error: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: "Alert", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
        present(alert, animated: true, completion: nil)
    }
    
    func confirm(_ message: String, handler: ((Bool) -> Void)? = nil) {
        let alert = UIAlertController(title: "Confirm", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            handler?(true)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { action in
            handler?(false)
        }))
        present(alert, animated: true, completion: nil)
    }
}