//
//  TableViewController.swift
//  RickMorty
//
//  Created by Francisco Padilla on 07/11/22.
//

import UIKit

class TableViewController: UITableViewController {
    var personajes = [Result]()
    var name:String = "Vuelva a seleccionar un personaje"
    var picture_url : String = "N/A"
    
    @IBOutlet var labelAlert: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let ad = UIApplication.shared.delegate as! AppDelegate
        if ad.internetStatus{
            if let url=URL(string: "https://rickandmortyapi.com/api/character/") {
                do {
                    let bytes = try Data(contentsOf: url)
                    let rick = try JSONDecoder().decode(Rick.self, from: bytes)
                    personajes = rick.results
                }
                catch {
                }
            }
        }else{
            labelAlert.text = "NO HAY INTERNET"
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personajes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        let personaje = personajes[indexPath.row]
        cell.textLabel?.text = personaje.name
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    @IBOutlet var tableCharacter: UITableView!
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "segueDetail", sender: Self.self)
        name = personajes[indexPath.row].name
        picture_url = personajes[indexPath.row].image
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailViewController
        destination.name = name
        destination.picture_url = picture_url
        print("prepare",name)
    }
    

}
