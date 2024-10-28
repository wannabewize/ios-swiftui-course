//
//  WebView.swift
//  ListAndDetail
//

import SwiftUI
import WebKit


class WebViewObservable: ObservableObject {
    weak var webView: WKWebView?
    
    func reload() {
        webView?.reload()
    }
    
    func loadUrl(_ urlStr: String) {
        if let url = URL(string: urlStr) {
            let request = URLRequest(url: url)
            webView?.load(request)
        }
        else {
            webView?.loadHTMLString("<h1>Error</h1>", baseURL: nil)
        }
    }
}



struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    
    var url: URL?
    @ObservedObject var controller: WebViewObservable
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        let request: URLRequest
        if let url = url {
            request = URLRequest(url: url)
        }
        else {
            request = URLRequest(url: URL(string: "https://developer.apple.com")!)
        }
        
        webView.load(request)
        controller.webView = webView
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}

