//
//  Cells.swift
//  thirdAssignment
//
//  Created by Lago on 2021/07/29.
//

import UIKit

class Cells: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var moodImage: UIImageView!
    
    var cellDelegate: cellDelegate?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

protocol cellDelegate : class {
    func didPressButton(_ tag: Int)
}
