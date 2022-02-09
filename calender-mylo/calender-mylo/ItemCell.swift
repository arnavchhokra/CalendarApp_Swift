//
//  ItemCell.swift
//  calender-mylo
//
//  Created by Arnav on 28/01/22.
//

import UIKit

class ItemCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    @IBOutlet weak var textLabel: UILabel!
    
    func setData(text: String)
    {
        self.textLabel.text = text
    }
    
}
