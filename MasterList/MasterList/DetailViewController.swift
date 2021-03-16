//
//  DetailViewController.swift
//  csmit207-MasterList
//
//  Created by Colette Smith on 3/1/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
        
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    var listing: Listing?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let l = listing {
            imageView.image = UIImage(named: l.imgName)
            titleLabel.text = l.title
            self.title = l.title
            descriptionLabel.text = "Print of mixed media painting, \(l.title)." + " Printed on heavyweight 100% cotton hot press paper with archival pigment inks.  Each print is signed on the back so you can orient the piece however you like."
            priceLabel.text = "$" + l.price.rawValue
        }
    }

}
