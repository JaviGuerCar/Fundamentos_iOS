//
//  WikiViewController.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 18/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController {


    @IBOutlet weak var browserView: UIWebView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    let model : House
    
    init(model: House){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    // Chapuza mientras UIKit no se reescriba a Swift
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func syncViewWithModel(){
        //activityView
        activityView.isHidden = false
        activityView.startAnimating()
        
        title = model.name
        
        //Hacernos delegado
        browserView.delegate = self
        browserView.loadRequest(URLRequest(url: model.wikiURL))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sincronizamos la Vista con el Modelo
        syncViewWithModel()
    }
    
}

extension WikiViewController: UIWebViewDelegate{
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        activityView.stopAnimating()
        activityView.isHidden = true
    }
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if (navigationType == .linkClicked) || (navigationType == .formSubmitted) {
            return false
        }else{
            return true
        }
    }
}
