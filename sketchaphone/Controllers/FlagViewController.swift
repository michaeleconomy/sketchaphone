import UIKit
class FlagViewController: LoadingViewController {
    var game: GameDetailed?
    var turn: GameDetailed.Turn?
    
    @IBOutlet weak var textField: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.text = ""
        textField.becomeFirstResponder()
        
    }
    
    @IBAction func flagTouch(_ sender: UIBarButtonItem) {
        if (textField.text == nil || textField.text == "") {
            alert("Reason cannot be blank")
            return
        }
        startLoading()
        gamesManager.flag(game: game!, reason: textField.text, callback: {(error) in
            DispatchQueue.main.async(execute: {
                self.stopLoading()
                if let error = error {
                    self.alert("Error occurred: \(error.localizedDescription)")
                    return
                }
               // go back to home
                self.navigationController?.popToViewController(self.navigationController!.viewControllers.first!, animated: true)
            })
        })
    }
    
    
    @IBAction func cancelTouch(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}

