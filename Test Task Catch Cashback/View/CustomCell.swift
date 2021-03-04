//
//  CustomCell.swift
//  Test Task Catch Cashback
//
//  Created by Dmitry Sachkov on 04.03.2021.
//

import UIKit
import Kingfisher

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    func refresh(_ data: DataModel) {
//        albumId.text = "\(data.albumID)"
        albumTitle.text =  data.title
        albumImage.setImage(imageUrl: data.url)
    }
    

}
