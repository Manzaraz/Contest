//
//  ViewController.swift
//  Contest
//
//  Created by Christian Manzaraz on 28/01/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func enterButtonDidTouchUpInside(_ sender: Any) {
        if emailTextField.text?.isEmpty == true {
            performLabTextFieldShakeAnimation()
        } else {
            performSegue(withIdentifier: "toEnteredView", sender: nil)
        }
    }
    
    private func performLabTextFieldShakeAnimation() {
        UIView.animate(withDuration: 0.2, animations: {
            let rightTransform = CGAffineTransform(translationX: 20, y: 0)
            self.emailTextField.transform = rightTransform
        }) {(_) in
            UIView.animate(withDuration: 0.2, animations: {
                self.emailTextField.transform = CGAffineTransform.identity
            })
        }
    }
}

