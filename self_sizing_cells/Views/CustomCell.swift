//
//  CustomCell.swift
//  self_sizing_cells
//
//  Created by Kunjeti Jassvanthh on 08/09/21.
//

import UIKit

class CustomCell: UITableViewCell {

    
    @IBOutlet weak var person_image: UIImageView!
    @IBOutlet weak var person_name: UILabel!
    @IBOutlet weak var person_description: UILabel!
    var isOpened: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        person_description.text? = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        person_description.text? = ""
    }

}
