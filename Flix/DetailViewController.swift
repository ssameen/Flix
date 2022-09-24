//
//  DetailViewController.swift
//  Flix
//
//  Created by Mustafa Sameen on 9/22/22.
//

import UIKit
import AlamofireImage

class DetailViewController: UIViewController {
    
    var movie : [String: Any]!
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var synopsis: UILabel!
    @IBOutlet weak var head: UILabel!
    @IBOutlet weak var date: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        head.text = movie["title"] as? String
        head.sizeToFit()
        synopsis.text = movie["overview"] as? String
        synopsis.sizeToFit()
        date.text = movie["release_date"] as? String
        date.sizeToFit()
        
        let baseURL = "https://image.tmdb.org/t/p/w500"
        let posterpath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterpath)
        
        let backgroundpath = movie["backdrop_path"] as! String
        let backgroundURL = URL(string: "https://image.tmdb.org/t/p/w1280" + backgroundpath)
        
        poster.af.setImage(withURL: posterURL!)
        background.af.setImage(withURL: backgroundURL!)
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
