//
//  Post.swift
//  example-my-hood
//
//  Created by momo on 9/30/16.
//  Copyright © 2016 Jo-Jo Lin. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding {
    
    private var _imagePath: String!
    private var _title: String!
    private var _postDesc: String!
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        
        self._title = aDecoder.decodeObject(forKey: "title") as? String
        self._imagePath = aDecoder.decodeObject(forKey: "imagePath") as? String
        self._postDesc = aDecoder.decodeObject(forKey: "description") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._title, forKey: "title")
        aCoder.encode(self._imagePath, forKey: "imagePath")
        aCoder.encode(self.postDesc, forKey: "description")
    }
    
    var imagePath: String {
        return _imagePath
    }
    
    var title: String {
        return _title
    }
    
    var postDesc: String {
        return _postDesc
    }
    
    init(title: String, imagePath: String, description: String) {
        
        self._imagePath = imagePath
        self._title = title
        self._postDesc = description
        
    }
    
    
}
