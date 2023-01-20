//
//  SecondViewController.swift
//  ForwardDataPassing
//
//  Created by Rachana Pandit on 02/11/22.
//

import UIKit


//MARK: Declaring Methods of Protocol

protocol BackDataPassingProtocol{
    func passDataToFirstViewController(textToPass:String)//Backward Step- 1
}

class SecondViewController: UIViewController {

@IBOutlet weak var lblOnSecondVC:UILabel!
@IBOutlet weak var txtFieldOnSecondVC:UITextField!
var delegateSecondVC:BackDataPassingProtocol!  // Backward Step-2
    
    var dataFromFirstVC:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//Data coming from firstVC and Displaying it on label:-
        lblOnSecondVC.text = dataFromFirstVC
        navigationItem.hidesBackButton = true
    }
    @IBAction func btnToNavigateFirstVC(_ sender : Any)
    {
        guard let delegateOnSecondVC = delegateSecondVC else{
        print("delegate not found") // Backward Step -- 3
        return
       }
    let dataToSendOnFirstVC = self.txtFieldOnSecondVC.text
        delegateOnSecondVC.passDataToFirstViewController(textToPass: dataToSendOnFirstVC!)  // BackWard Step --4
        
        navigationController?.popViewController(animated: true)
    }
}
