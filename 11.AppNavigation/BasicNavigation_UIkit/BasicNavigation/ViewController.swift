//
//  ViewController.swift
//  NavigationBasic
//
//  Created by Jaehoon Lee on 10/29/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.value = 5
    }

    @IBAction func handleSliderChange(_ sender: Any) {
        valueLabel.text = "\(Int(slider.value))"
    }
    
    @IBAction func handleShowNext(_ sender: Any) {
        if
            let storyboard = self.storyboard,
            let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailScene") as? DetailViewController {
            // 값 주입
            detailVC.value = Int(slider.value)
            self.show(detailVC, sender: nil)
//            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailViewController {
            // 값 주입
            detailVC.value = Int(slider.value)
        }
    }
}
