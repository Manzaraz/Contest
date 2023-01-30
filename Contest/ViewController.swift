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
            performChallengeTextFieldShakeAnimation()
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

    private func performChallengeTextFieldShakeAnimation() {
        let dur = 0.1667
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [],
                                animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0,
                               relativeDuration: dur) {
                self.emailTextField.transform = CGAffineTransform(rotationAngle: -.pi/8)
            }
            UIView.addKeyframe(withRelativeStartTime: dur,
                               relativeDuration: dur) {
                self.emailTextField.transform = CGAffineTransform(rotationAngle: +.pi/8)
            }
            UIView.addKeyframe(withRelativeStartTime: dur*2,
                               relativeDuration: dur) {
                self.emailTextField.transform = CGAffineTransform(rotationAngle: -.pi/8)
            }
            UIView.addKeyframe(withRelativeStartTime: dur*3,
                               relativeDuration: dur) {
                self.emailTextField.transform = CGAffineTransform(rotationAngle: +.pi/8)
            }
            UIView.addKeyframe(withRelativeStartTime: dur*4,
                               relativeDuration: dur) {
                self.emailTextField.transform = CGAffineTransform(rotationAngle: -.pi/8)
            }
            UIView.addKeyframe(withRelativeStartTime: dur*5,
                               relativeDuration: dur) {
                self.emailTextField.transform = CGAffineTransform.identity
            }
        },
                                completion: nil
        )
    }
}

