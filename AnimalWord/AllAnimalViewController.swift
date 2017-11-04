//
//  AllAnimalViewController.swift
//  AnimalWord
//
//  Created by Elena Goroshko on 11/3/17.
//  Copyright © 2017 Elena Goroshko. All rights reserved.
//

import UIKit

class AllAnimalViewController: UIViewController {

    private var animals : [Animal] = []

    @IBOutlet private weak var allAnimalTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        allAnimalTable.dataSource = self
        allAnimalTable.delegate = self
        generateAnimals()
    }

    private func generateAnimals(){
        self.animals.append(Animal(name: "Филин", kind: "Птицы"))
        self.animals.append(Animal(name: "Сова", kind: "Птицы"))
        self.animals.append(Animal(name: "Орел", kind: "Птицы"))
        self.animals.append(Animal(name: "Чайка", kind: "Птицы"))
        self.animals.append(Animal(name: "Синица", kind: "Птицы"))
        self.animals.append(Animal(name: "Щука", kind: "Рыбы"))
        self.animals.append(Animal(name: "Окунь", kind: "Рыбы"))
        self.animals.append(Animal(name: "Слон", kind: "Млекопитающие"))
        self.animals.append(Animal(name: "Собака", kind: "Млекопитающие"))
        self.animals.append(Animal(name: "Мышь", kind: "Млекопитающие"))
        self.animals.append(Animal(name: "Лиса", kind: "Млекопитающие"))
        self.animals.append(Animal(name: "Оса", kind: "Насекомые"))
        self.animals.append(Animal(name: "Тантул", kind: "Насекомые"))
        self.animals.append(Animal(name: "Махаон", kind: "Насекомые"))
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showDatails", let destVC = segue.destination as? DetailsViewController else { return }
        guard let cell = sender as? UITableViewCell else { return }
        guard let indexPath = allAnimalTable.indexPath(for: cell) else { return }
        destVC.animal = self.animals[indexPath.row]
    }



}

extension AllAnimalViewController : UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animals.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       guard let cell = allAnimalTable.dequeueReusableCell(withIdentifier: "AnimalTableCell", for: indexPath)
                        as? AnimalViewCell
        else {
            fatalError("Error : Cell has wrong type")
        }
        let item = animals[indexPath.row]
        cell.update(title: item.name)
        return cell
    }
}
