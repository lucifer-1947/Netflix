//
//  HomeViewController.swift
//  Netflix
//
//  Created by Raj Guggilla on 07/02/24.
//

import UIKit

class HomeViewController: UIViewController {

    
    let sectionTitles = ["Trending Movies","Trending Tv", "Popular","Upcoming Movies","Top rated"]
    private let homeFeedTable : UITableView  = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier:  CollectionViewTableViewCell.customReuseIdentifier)
        return table
    }()
    
    private func configure() {
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
    }
    
    
    

}

//MARK: NETWORK
extension HomeViewController {
    
    func configureNetwork(){
        getTrendingMovies()
        getTrendingTv()
        getUpComing()
        getPopular()
        getTopRated()
    }
    
    func getTrendingMovies(){
        ApiCaller.shared.getTrendingMovies { results in
            
            switch results {
            case .success(let movies) : print(0)
            case .failure(let error) : print(error)
                
            }
        }
    }
    
    func getTrendingTv() {
        ApiCaller.shared.getTrendingTv { results in
            
            switch results {
            case .success(let movies) : print(1)
            case .failure(let error) : print(error)
            }
        }
    }
    
    func getUpComing() {
        ApiCaller.shared.getUpcoming { results in
            
            switch results {
            case .success(let movies) : print(2)
            case .failure(let error) : print(error)
            }
        }
    }
    
    func getPopular() {
        ApiCaller.shared.getPopular { results in
            
            switch results {
            case .success(let movies) : print(3)
            case .failure(let error) : print(error)
            }
        }
        
    }
    
    func getTopRated() {
        ApiCaller.shared.getTopRated { results in
            
            switch results {
            case .success(let movies) : print(4)
            case .failure(let error) : print(error)
            }
        }
        
    }
}


//MARK: ViewController Lifecycle
extension HomeViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
#if DEBUG
        print("VC - view Did Load")
#endif

        configure() //trigged only once, when view controller is loading after its creation.
        
        configureNavBar()

        
        configureTableView()
        
        configureNetwork()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
#if DEBUG
        print("VC - view Will Appear")
#endif
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
#if DEBUG
        print("VC - view Will LayoutSubviews")
#endif
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds //scalling frame-of-subview to bounds-of-superview.
#if DEBUG
        print("VC - view Did LayoutSubviews")
#endif
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
#if DEBUG
        print("VC - view Did Appear")
#endif
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
#if DEBUG
        print("VC - view Will Disappear")
#endif
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
#if DEBUG
        print("VC - view Did Disappear")
#endif
    }
    
    
    
}



//MARK: NavigationBar & Items of UINavigationController
extension HomeViewController {
    
    //Note: NavigationItem is only avaible for a viewcontroller , when it is the child of the UINavigationController.
    //The navigationItem properties are used by NavigationController , to set content inside the existing NavigationBar .
    //Note Navigation Bar view remains same for all vc , only its contents changes but not view itself.
    private func configureNavBar(){
        var logo = UIImage(named: "logo")
        logo = logo?.withRenderingMode(.alwaysOriginal)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: logo, style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        
        navigationController?.navigationBar.tintColor = .label
    }
    
    //scroll based showing and hiding
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}



//MARK: TableView
extension HomeViewController {
    
    private func configureTableView(){
        
        //adding tableview. //This can also be done by adding the table view in storyboard and access it has iboutlet.
        view.addSubview(homeFeedTable)
        homeFeedTable.dataSource = self
        
        homeFeedTable.delegate = self
        
        homeFeedTable.tableHeaderView = HomeHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
    }

}



//MARK: Table View DataSource
//Anthing that table view needs to handle related to data , asks this DataSource.
extension HomeViewController : UITableViewDataSource {
    
  
    //MARK: SECTIONS
    func numberOfSections(in tableView: UITableView) -> Int {
        print("TableView asking DataSource - no.of sections ")
        return 5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print("TableView asking DataSource - header for a section at - \(section)")
        return sectionTitles[section]
    }
    
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        print("TableView asking DataSource - footer for a section at - \(section)")
//        return "\(section)"
//    }
    
    
    
    //MARK: ROWS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("TableView asking DataSource - no.of rows in the section at - \(section) ")
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("TableView asking DataSource - cell to show for row at - \(indexPath.row) in section - \(indexPath.section)")

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


//MARK: Table View User Interaction
//Anythign that user-interaction are done on tableview, handled by this delegate.
extension HomeViewController : UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {
            return
        }
        
        var headerConfiguration = header.defaultContentConfiguration()
        print(sectionTitles[section].capitaliseFirstLetter())
        headerConfiguration.text = sectionTitles[section].lowercased()
        headerConfiguration.textProperties.font = .systemFont(ofSize: 18, weight: .bold)
        headerConfiguration.textProperties.color = .label
        header.contentConfiguration = headerConfiguration
    }
    
   
}


