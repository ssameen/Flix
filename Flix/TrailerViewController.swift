//
//  TrailerViewController.swift
//  Flix
//
//  Created by Mustafa Sameen on 9/23/22.
//
import WebKit
import UIKit

class TrailerViewController: UIViewController, WKUIDelegate {
    @IBOutlet var trailer: WKWebView!
    var key: String = ""
    
    override func loadView() {
            let webConfiguration = WKWebViewConfiguration()
            trailer = WKWebView(frame: .zero, configuration: webConfiguration)
            trailer.uiDelegate = self
            view = trailer
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let id = self.key
        let URL = URL(string:"https://www.youtube.com/watch?v=\(id)")
        let Request = URLRequest(url: URL!)
        trailer.load(Request)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
