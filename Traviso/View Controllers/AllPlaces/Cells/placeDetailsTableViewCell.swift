//
//  placeDetailsTableViewCell.swift
//  Traviso
//
//  Created by aksa nazir on 12/04/21.
//

import UIKit

class placeDetailsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var placeName: UILabel!
    
    @IBOutlet weak var placeDescription: UILabel!
    
    @IBOutlet weak var placePic: UIImageView!
    
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
