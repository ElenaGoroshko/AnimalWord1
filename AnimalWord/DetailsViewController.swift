//
//  DetailsViewController.swift
//  AnimalWord
//
//  Created by Elena Goroshko on 11/4/17.
//  Copyright © 2017 Elena Goroshko. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var animal : Animal?

    @IBOutlet private weak var ibImageView: UIImageView!
    @IBOutlet private weak var ibLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let item = animal else { return }
        title = item.name
        self.ibLabel.text = item.details
        self.ibImageView.image = UIImage(imageLiteralResourceName: item.image)

    }


}
