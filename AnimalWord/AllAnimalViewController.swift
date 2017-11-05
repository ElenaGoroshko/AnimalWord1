//
//  AllAnimalViewController.swift
//  AnimalWord
//
//  Created by Elena Goroshko on 11/3/17.
//  Copyright © 2017 Elena Goroshko. All rights reserved.
//

import UIKit

class AllAnimalViewController: UIViewController {

    private var animals : [String: [Animal]] = [:]
    private var animalKeys : [String] = []

    @IBOutlet private weak var allAnimalTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        allAnimalTable.dataSource = self
        allAnimalTable.delegate = self
        generateAnimals()
        
    }

    private func generateAnimals(){

        self.animals["Птицы"] = [Animal(name: "Филин", kind: "Птицы", details: "Хищная ночная птица. Обитает в лесу.",
                                             image: "eagle-owl.jpg"),
                                Animal(name: "Сова", kind: "Птицы", details: "Хищная ночная птица. Обитает в лесу.", image: "owl.jpg"),
                                Animal(name: "Орел", kind: "Птицы", details: "Хищная дневная птица. Обитает в горах и степи.", image: "eagle.jpg"),
                                Animal(name: "Чайка", kind: "Птицы", details: "Дневная птица. Питается рыбой и пищевыми отходами. Обитает на морском побережье.", image: "seagull.jpg"),
                                Animal(name: "Синица", kind: "Птицы", details: "Дневная птица. Питается насекомыми, зерновыми и ягодами. Обитает в степи, лесах и селеньях людей.", image: "titmouse.jpg")]

        self.animals["Рыбы"] = [Animal(name: "Щука", kind: "Рыбы", details: "Речная крупная рыба. Питается мелкой рыбой.",
                                           image: "luce.jpg"),
                                Animal(name: "Окунь", kind: "Рыбы", details: "Речная средняя рыба. Питается мелкой рыбой.", image: "perch.jpg")]

        self.animals["Млекопитающие"] = [Animal(name: "Слон", kind: "Млекопитающие", details: "Крупное сухопутное животное. Питается травой, овощами, фруктами.", image: "elephant.jpg"),
                                        Animal(name: "Собака", kind: "Млекопитающие",  details: "Среднее домашнее животное. Всеядное", image: "dog.jpg"),
                                        Animal(name: "Мышь", kind: "Млекопитающие", details: "Мелкое сухопутное животное. Всеяное, вплоть до кактусов и мыла :-)", image: "mouse.jpg"),
                                        Animal(name: "Лиса", kind: "Млекопитающие", details: "Средний сухопутный хищник.", image: "fox.jpg")]

        self.animals["Насекомые"] = [Animal(name: "Оса", kind: "Насекомые", details: "Жалящее насекомое. Всеядное. Живет большими колониями.", image: "wasp.jpg"),
                                    Animal(name: "Тарантул", kind: "Насекомые", details: "Крупный хищный паук.", image: "tarantula.jpg"),
                                    Animal(name: "Махаон", kind: "Насекомые", details: "Крупная бабочка.", image: "machaon.jpg")]
        animalKeys = Array(self.animals.keys)
    }

    private func getAnimal(for indexPath : IndexPath) -> Animal?{
        let key = animalKeys[indexPath.section]
        let animalsForSection = self.animals[key] ?? []
        return animalsForSection[indexPath.row]
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showDatails", let destVC = segue.destination as? DetailsViewController else { return }
        guard let cell = sender as? UITableViewCell else { return }
        guard let indexPath = allAnimalTable.indexPath(for: cell) else { return }
        guard let item = getAnimal(for: indexPath) else { return }
        destVC.animal = item
    }

}

extension AllAnimalViewController : UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.animals.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = animalKeys[section]
        let animalsForSection = self.animals[key] ?? []
        return animalsForSection.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       guard let cell = allAnimalTable.dequeueReusableCell(withIdentifier: "AnimalTableCell", for: indexPath)
                        as? AnimalViewCell else {
            fatalError("Error : Cell has wrong type")
        }
        guard let item = getAnimal(for: indexPath) else {
                fatalError("Error : Animal has wrong indexPath")
        }

        cell.update(title: item.name)
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animalKeys[section]
    }

}
