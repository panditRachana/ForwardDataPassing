//
//  ViewController.swift
//  ForwardDataPassing
//
//  Created by Rachana Pandit on 02/11/22.
//

import UIKit

class ViewController: UIViewController,BackDataPassingProtocol{
    
    @IBOutlet weak var txtFieldOnFirstVC: UITextField!
    @IBOutlet weak var btnClick: UIButton!
    @IBOutlet weak var lblOnFirstVC:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtFieldOnFirstVC.text = ""
    }
    
    @IBAction func btnNavigateToSecondVC(_ sender: Any)
    {
        //Creating the instance of Second VC
        let SecondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
   
    // Passing the textField value 
        let dataToPass = txtFieldOnFirstVC.text
        SecondVC.dataFromFirstVC = dataToPass
        
    //Calling protocol delegate From VC2
        SecondVC.delegateSecondVC = self  // Backward Step --6
        
        self.navigationController?.pushViewController(SecondVC, animated: true)
    }
    func passDataToFirstViewController(textToPass: String)
    {
        self.lblOnFirstVC.text = textToPass //Backward step--5
    }
}

