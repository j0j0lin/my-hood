//
//  ViewController.swift
//  example-my-hood
//
//  Created by momo on 9/30/16.
//  Copyright © 2016 Jo-Jo Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //tableView.estimatedRowHeight = 90
        
        setNavigationLogo()
        
        // load the existing posts
        DataService.sharedInstance.loadPosts()
        
       // add abserver to list to posts loaded event
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.onPostsLoaded(notif:)), name: NSNotification.Name(rawValue: "postsLoadedNotification"), object: nil)
        
        tableView.reloadData()
    }
   
// MARK: UITableViewDelegate & UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = DataService.sharedInstance.loadedPosts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
            
            cell.configureCell(post: post)
            return cell
            
        }else{
            
            let cell = PostCell()
            cell.configureCell(post: post)
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // fixed cell height
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return DataService.sharedInstance.loadedPosts.count
    }
    
    
    func onPostsLoaded(notif: AnyObject) {
        
        tableView.reloadData()
    }
    
// MARK: Navigation title
    func setNavigationLogo() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "bannerlogo")
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

