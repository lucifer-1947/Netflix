//
//  UpcomingViewController.swift
//  Netflix
//
//  Created by Raj Guggilla on 07/02/24.
//

import UIKit

class UpcomingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        
        navigationItem.title = "Netfkix"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Hello ")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
