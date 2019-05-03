
import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        

        SVProgressHUD.show()
        //TODO: Set up a new user on our Firbase database
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
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
                print("Registration Successful!")
                SVProgressHUD.dismiss()
                
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
        
    } 
    
    
}
