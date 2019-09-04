//
//  ViewController.swift
//  CheckIDNowSDK
//
//  Created by Phu Nguyen on 9/4/19.
//  Copyright © 2019 Phu Nguyen. All rights reserved.
//

import UIKit
import IDnowSDK

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    private var idnController: IDnowController!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func confirm(_ sender: UIButton) {
        guard textField.hasText, let text = textField.text else {
            return
        }
        let settings = IDnowSettings()
        settings.ignoreCompanyID = true
        settings.transactionToken = text
        idnController = IDnowController(settings: settings)
        idnController.delegate = self
        idnController.initialize()
    }
}

extension ViewController: IDnowControllerDelegate {
    func idnowControllerDidFinishInitializing(_ idnowController: IDnowController) {
        print("\nidnowControllerDidFinishInitializing invoked")
        idnowController.startIdentification(from: self)
    }
    
    func idnowController(_ idnowController: IDnowController, initializationDidFailWithError error: Error) {
        print("\nInitializationDidFailWithError invoked")
    }
    
    func idnowControllerCanceled(byUser idnowController: IDnowController) {
        print("\nidnowControllerCanceled invoked")
    }
    
    func idnowControllerDidFinishIdentification(_ idnowController: IDnowController) {
        print("\nidnowControllerDidFinishIdentification invoked")
    }
}

