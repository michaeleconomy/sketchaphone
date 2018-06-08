import UIKit
class ResetPasswordViewController: LoadingViewController {
    @IBOutlet weak var emailField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func resetTouch() {
        guard let email = emailField.text else {
            alert("email is required for reseting password")
            return
        }
        if (email == "") {
            alert("email is required for reseting password")
            return
        }
        startLoading()
        userManager.resetPassword(email: email) { (error) in
            DispatchQueue.main.async {
                self.stopLoading()
                if let error = error {
                    self.alert(error)
                    return
                }
                self.alert("A password reset email has been sent. Please check your email for next steps.", handler: { _ in
                    self.navigationController?.popViewController(animated: true)
                })
                
            }
        }
    }
}
