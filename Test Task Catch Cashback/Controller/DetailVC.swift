//
//  DetailVC.swift
//  Test Task Catch Cashback
//
//  Created by Dmitry Sachkov on 04.03.2021.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var url: UITextView!
    
    var titleString = ""
    var urlString = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        albumTitle.text = titleString
        url.text = urlString
        albumImage.setImage(imageUrl: urlString)

    }


}
