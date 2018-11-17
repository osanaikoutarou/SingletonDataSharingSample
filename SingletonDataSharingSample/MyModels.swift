//
//  MyModel.swift
//  SingletonDataSharingSample
//
//  Created by 長内幸太郎 on 2018/11/17.
//  Copyright © 2018年 長内幸太郎. All rights reserved.
//

import Foundation

class MyModel:NSObject {
    var id:Int?
    var title:String = ""
    var like:Bool {
        get {
            guard let id = id else {
                return false
            }
            return LikeCacheSingleton.shared.likes[id] ?? false
        }
        set(arg) {
            guard let id = id else {
                return
            }
            LikeCacheSingleton.shared.likes[id] = arg
        }
    }
    
    init(with data:[String:Any]) {
        super.init()
        id = data["id"] as? Int
        title = data["title"] as! String
        like = data["like"] as! Bool
    }
}

class LikeCacheSingleton:NSObject {
    static let shared = LikeCacheSingleton()
    
    var likes:[Int:Bool] = [:]
}
