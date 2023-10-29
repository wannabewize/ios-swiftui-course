//
//  DetailViewController.swift
//  NavigationBasic
//
//  Created by wannabewize on 10/29/23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var valueLabel: UILabel!
    var value: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail V.C."
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let value = value {
            valueLabel.text = "\(value)"
        }
        else {
            valueLabel.text = "nil"
        }
    }

    @IBAction func handleShowRandom(_ sender: Any) {
        if Int.random(in: 1...10) % 2 == 0 {
            performSegue(withIdentifier: "RedSegue", sender: nil)
        }
        else {
            performSegue(withIdentifier: "BlueSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Go RED" {
            print("RED 씬 전환")
        }
        else if segue.identifier == "Go BLUE" {
            print("BLUE 씬 전환")
        }
    }
    
}
