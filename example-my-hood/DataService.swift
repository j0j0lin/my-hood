//
//  DataService.swift
//  example-my-hood
//
//  Created by momo on 10/2/16.
//  Copyright © 2016 Jo-Jo Lin. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    
    // create singleton instance
    static let sharedInstance = DataService()
    
    private var _loadedPosts = [Post]()
    
    var loadedPosts: [Post] {
        return _loadedPosts
    }
    
    // load the data
    func loadPosts() {
        
        // use if let to check if we are able to retrive the data from user default
        if let postsData = UserDefaults.standard.object(forKey: "posts") as? NSData {
            
            if let postsArray = NSKeyedUnarchiver.unarchiveObject(with: postsData as Data) as? [Post] {
               _loadedPosts = postsArray
            }
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("postsLoadedNotification"), object: nil)
        
    }
    
    // save the data
    func savePosts() {
        
        // save data
        let postsData = NSKeyedArchiver.archivedData(withRootObject: _loadedPosts)
        UserDefaults.standard.set(postsData, forKey: "posts")
        UserDefaults.standard.synchronize()
    }
    
    func addPost(post: Post) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
    func saveImageAndCreateImagePath(image: UIImage) -> String{
        // convert image to PNG, ns data
        let imageData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate).png"
        
        print("imagePath: \(imgPath)")
        
        let fullPath = documentsPathForFileName(name: imgPath)
        
        do {
            try
                imageData?.write(to: URL(fileURLWithPath: fullPath), options: .atomic)
        } catch {
            print(error)
        }
        
        // return the fileName
        return imgPath

    }
    
    func imageForPath(path: String) -> UIImage? {
        
        let fullPath = documentsPathForFileName(name: path)
        let image = UIImage(named: fullPath)
        
        return image
        
    }
    
    func documentsPathForFileName(name: String) -> String {
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
        
        let fullPath = path.appendingPathComponent(name)
        
        print(fullPath)
        
        return fullPath
    }
}
