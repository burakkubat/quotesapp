//
//  ViewController.swift
//  QuoteAppDeneme
//
//  Created by Burak Kubat on 8.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    let url = URL(string: "https://dummyjson.com/quotes/random")
    
    
    @IBAction func getQuote(_ sender: Any) {
        
        URLSession.shared.dataTask(with: url!) { data, _ , error in
            guard let data = data, error == nil else {
                print("error")
                return
            }
            let quote = try! JSONDecoder().decode(Quote.self, from: data)
            
            DispatchQueue.main.async {
                self.quoteLabel.text = quote.quote
                self.authorLabel.text = quote.author
            }
           
            
            
        }.resume()
        
        
        
    }
    

}

