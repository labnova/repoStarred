//
//  StarredUserTableViewCell.swift
//  progetto_subito
//
//  Created by Innocenzo Tremamondo on 04/10/2019.
//  Copyright © 2019 Innocenzo Tremamondo. All rights reserved.
//

import UIKit

class StarredUserTableViewCell: UITableViewCell {

    @IBOutlet weak var starredImage: UIImageView!
    
    @IBOutlet weak var starredName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
