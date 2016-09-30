//
//  ViewController.swift
//  StarWars
//
//  Created by Karim on 29/09/2016.
//  Copyright © 2016 KRS. All rights reserved.
//

import UIKit

/// Displays a list of Characters ordered by factions.
class CharactersTableViewController: UITableViewController {

    var database = Database.sharedInstance
    // MARK: Types
    
 //   typealias Model = DreamListViewControllerModel
    
    enum SegueIdentifier: String {
        case showDetail = "showDetail"
        case addCharacter = "addCharacter"
    }
    
    enum Section: Int {
        case rebel = 0
        case empire = 1
        case jedi = 2
        case firstOrder = 3
        
        init(at indexPath: IndexPath) {
            self.init(rawValue: indexPath.section)!
        }
        
        init(_ section: Int) {
            self.init(rawValue: section)!
        }
        
        static let count = 4
        
        var title: String {
            switch self {
            case .firstOrder: return "First Order"
            case .empire: return "Galactic Empire"
            case .rebel: return "Rebel Alliance"
            case .jedi: return "Jedi Faction"
            }
        }
    }
    
    // MARK: View Life Cycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
        becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        resignFirstResponder()
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func viewDidLoad() {
        
        title = "Characters"
        tableView.register(UINib.init(nibName: CharacterCell.nibIdentifier, bundle: nil), forCellReuseIdentifier: CharacterCell.cellIdentifier)
    }

    // MARK: UITableViewDelegate & UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(section) {
        case .firstOrder: return database.firstOrders.count
        case .empire: return database.empires.count
        case .rebel: return database.rebels.count
        case .jedi: return database.jedis.count
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Section(section).title
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = Section(at: indexPath)

        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.cellIdentifier, for: indexPath) as! CharacterCell
        
        cell.accessoryType = .disclosureIndicator
        switch  section {
        case .firstOrder:
            cell.character = database.firstOrders[indexPath.row]
            
        case .empire:
            cell.character = database.empires[indexPath.row]
            
        case .jedi:
            cell.character = database.jedis[indexPath.row]

        case .rebel:
            cell.character = database.rebels[indexPath.row]
        }
            
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let section = Section(at: indexPath)

            switch  section {
            case .firstOrder:
                database.firstOrders.remove(at: indexPath.row)
                
            case .empire:
                database.empires.remove(at: indexPath.row)
                
            case .jedi:
                database.jedis.remove(at: indexPath.row)
                
            case .rebel:
                database.rebels.remove(at: indexPath.row)
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        self.performSegue(withIdentifier: SegueIdentifier.showDetail.rawValue, sender: cell)
    }
    
}


extension CharactersTableViewController {
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return  // nothing to prepare
        }
        switch identifier {
        case SegueIdentifier.showDetail.rawValue:
            let characterCell = sender as! CharacterCell
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.character = characterCell.character
            
        case SegueIdentifier.addCharacter.rawValue:
            let navcon = segue.destination as! UINavigationController
            let newCharacterViewController = navcon.topViewController as! NewCharacterViewController
            newCharacterViewController.delegate = self
        default:
            break
        }
    }
    
}

extension CharactersTableViewController: NewCharacterViewControllerDelegate {
    func NewCharacterViewControllerDidCancel(_ newCharacterViewController: NewCharacterViewController) {
        newCharacterViewController.dismiss(animated: true, completion: nil)
    }
    func NewCharacterViewController(_ newCharacterViewController: NewCharacterViewController, created: Character) {
        
        let section: Int!
        
        switch created.faction {
        case .Rebel:
            section = 0
        case .Empire:
            section = 1
        case .Jedi:
            section = 2
        case .FirstOrder:
            section = 3
        }
        
        
        let insertIndexPath = IndexPath(row: 0, section: section)
        
        newCharacterViewController.dismiss(animated: true) {
            self.tableView.scrollToRow(at: insertIndexPath, at: .top, animated: true)
            switch section {
                
            case 0:
                self.database.rebels.insert(created, at: 0)
            case 1:
                self.database.empires.insert(created, at: 0)
            case 2:
                self.database.jedis.insert(created, at: 0)
            case 3:
                self.database.firstOrders.insert(created, at: 0)
            default:
                break
            }
            self.tableView.insertRows(at: [insertIndexPath], with: .automatic)
        }
    }
    
    
}





