//
//  DetailViewController.swift
//  RickMorty
//
//  Created by Francisco Padilla on 08/11/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var name : String = ""
    var picture_url : String = ""

    @IBOutlet var pictureBox: UIImageView!
    @IBOutlet var labelName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = name
        let url = URL(string: picture_url)!
        if let data = try? Data(contentsOf: url) {
            pictureBox.image = UIImage(data: data)
        }
        // Do any additional setup after loading the view.
    }


}
