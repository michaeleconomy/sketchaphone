import UIKit

class JoinGameViewController: LoadingViewController, JoinGameDelgate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        gamesManager.joinGame(delegate: self)
    }
    
    
    func gameJoined() {
        guard let game = gamesManager.currentGame else {
            couldNotJoinGame(message: "currentGame was nil")
            return
        }
        
        DispatchQueue.main.async(execute: {
            if (game.turns.count % 2 == 1) {
                self.performSegue(withIdentifier: "draw", sender: nil)
                return
            }
            self.performSegue(withIdentifier: "guess", sender: nil)
        })
    }
    
    func couldNotJoinGame(message: String) {
        DispatchQueue.main.async(execute: {
            self.alert(message, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            })
        })
    }
}
