//
//  HomeViewController.swift
//  Netflix
//
//  Created by Raj Guggilla on 07/02/24.
//

import UIKit

class HomeViewController: UIViewController {

    
    private let homeFeedTable : UITableView  = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier:  CollectionViewTableViewCell.customReuseIdentifier)
        return table
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable) //adding tableview. //This can also be done by adding the table view in storyboard and access it has iboutlet.
        homeFeedTable.tableHeaderView = HomeHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        
        homeFeedTable.dataSource = self
        homeFeedTable.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds //scalling frame-of-subview to bounds-of-superview.
       
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


//Anthing that table view needs to handle related to data , asks this DataSource.
extension HomeViewController : UITableViewDataSource {
    
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
//        let cell = tableView.dequeueReusableCell(withIdentifier:CollectionViewTableViewCell.identifier,for: indexPath)
//        cell.textLabel!.text = "HelloWorld!"
//        cell.backgroundColor = .red
//        return cell
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.customReuseIdentifier, for: indexPath) as? CollectionViewTableViewCell else {
            
            return UITableViewCell()
        }
        
        return cell
    }
    
    
}

//Anythign that user-interaction are done on tableview, handled by this delegate.
extension HomeViewController : UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
  
    
}
