//
//  BlueViewController.swift
//  NavigationBasic
//
//  Created by wannabewize on 10/29/23.
//

import UIKit

class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func handleGoBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }    
}
