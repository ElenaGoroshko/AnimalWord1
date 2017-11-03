//
//  AllAnimalViewController.swift
//  AnimalWord
//
//  Created by Elena Goroshko on 11/3/17.
//  Copyright © 2017 Elena Goroshko. All rights reserved.
//

import UIKit

class AllAnimalViewController: UIViewController {

    @IBOutlet private weak var AllAnimalTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()


    }
}

extension UIViewController : UITableViewDataSource, UITableViewDelegate {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 4
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        return UITableViewCell()
    }
}
