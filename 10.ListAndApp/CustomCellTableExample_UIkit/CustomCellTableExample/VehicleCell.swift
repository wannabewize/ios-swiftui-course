//
//  VehicleCell.swift
//  CustomCellTableExample
//
//  Created by wannabewize on 10/28/23.
//

import UIKit

class VehicleCell: UITableViewCell {
    
    @IBOutlet weak var vehicleImageView: UIImageView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fueltypeImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
