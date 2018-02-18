//
//  ViewController.swift
//  realtimeDatabaseDemo1
//
//  Created by 申潤五 on 2018/2/17.
//  Copyright © 2018年 申潤五. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    //設定資料庫參照
    var ref:DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        //取得資料庫參照
        ref = Database.database().reference()
        Auth.auth().signInAnonymously { (user, error) in
            if error != nil{
                print(error?.localizedDescription)
            }else{
                //登入無誤時，取得 codename 字串
                self.ref.child("appdefault/codename").observeSingleEvent(of: .value, with: { (snapshot) in
                    print("App Codename:\(snapshot.value as! String)")
                })
            }
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

