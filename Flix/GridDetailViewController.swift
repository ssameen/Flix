//
//  GridDetailViewController.swift
//  Flix
//
//  Created by Mustafa Sameen on 9/23/22.
//

import UIKit

class GridDetailViewController: UIViewController {
    
    var movie : [String: Any]!
    var key : String = ""

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let id = movie["id"]
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id ?? 000))/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                 let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 let info = dataDictionary["results"] as! [[String : Any]]
                 self.key = info[0]["key"] as! String

             }
        }
        task.resume()
        // Do any additional setup after loading the view.
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        dateLabel.text = movie["release_date"] as? String
        dateLabel.sizeToFit()
        
        let baseURL = "https://image.tmdb.org/t/p/w500"
        let posterpath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterpath)
        
        let backgroundpath = movie["backdrop_path"] as! String
        let backgroundURL = URL(string: "https://image.tmdb.org/t/p/w1280" + backgroundpath)
        
        posterImage.af.setImage(withURL: posterURL!)
        backgroundImage.af.setImage(withURL: backgroundURL!)
        
    }
    
    @IBAction func tappedPoster(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(key)
        let trailer = segue.destination as! TrailerViewController
        trailer.key = self.key
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
