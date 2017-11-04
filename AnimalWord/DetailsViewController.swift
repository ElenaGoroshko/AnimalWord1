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

    @IBOutlet private weak var ibAnimalName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    title = self.animal?.name

    }


}
