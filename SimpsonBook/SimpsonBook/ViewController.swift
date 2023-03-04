//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Zeynep Uzunsoy on 20.02.2023.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var mySimp = [Simpson]()
    var chosenSimp : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let homer = Simpson(SimpName: "Homer Simpson", SimpJob: "Nuclear Safety", SimpImage: UIImage(named: "Homer")!)
        let marge = Simpson(SimpName: "Marge Simpson", SimpJob: "Housewife", SimpImage: UIImage(named: "barge")!)
        let bart = Simpson(SimpName: "Bart Simpson", SimpJob: "Student", SimpImage: UIImage(named: "bart")!)
        let lisa = Simpson(SimpName: "Lisa Simpson", SimpJob: "Student", SimpImage: UIImage(named: "lisa")!)
        let maggie = Simpson(SimpName: "Maggie Simpson", SimpJob: "Baby", SimpImage: UIImage(named: "maggie")!)
        
        mySimp.append(homer)
        mySimp.append(marge)
        mySimp.append(bart)
        mySimp.append(lisa)
        mySimp.append(maggie)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimp[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimp = mySimp[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! detailsVc
            destinationVC.selectedSimp = chosenSimp
        }
    }
}

