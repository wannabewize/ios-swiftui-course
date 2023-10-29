//
//  VehicleDetailViewController.swift
//  ListAndDetailApp
//

import UIKit
import WebKit

class VehicleDetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var detailUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(handleReload)),
        ]
    }
    
    
    @objc func handleReload() {
        webView.reload()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 웹뷰를 이용해서 상세 정보 출력
        if let urlStr = detailUrl,
           let url = URL(string: urlStr) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
