//
//  AnimalViewCell.swift
//  AnimalWord
//
//  Created by Elena Goroshko on 11/4/17.
//  Copyright © 2017 Elena Goroshko. All rights reserved.
//

import UIKit

class AnimalViewCell: UITableViewCell {

    @IBOutlet private weak var ibTitle: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(title: String){
        self.ibTitle.text = title
    }
}
