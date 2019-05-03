
import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {

        SVProgressHUD.show()
        //TODO: Log in the user
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            if error != nil {
                print(error!)
                
                let errorStr = String(describing: error)
                let errorArr = errorStr.components(separatedBy: "\"") //Array for extracting the error description.
                
                SVProgressHUD.dismiss()
                
                let alert = UIAlertController(title: nil, message: errorArr[1], preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Retry", style: .default, handler: nil)
                
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
                
            } else {
                print("Log in was successful!")
                SVProgressHUD.dismiss()
                
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
            
        }
        
        
    }
    
}  
