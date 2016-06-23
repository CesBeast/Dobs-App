//
//  HomeViewController.swift
//  Dobs
//
//  Created by cesar garcia on 6/21/16.
//  Copyright © 2016 CesBeast. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, SideBarDelegate {

    override func viewDidLoad() {
        var sideBar:SideBar = SideBar()
        
        super.viewDidLoad()
        
        sideBar = SideBar(sourceView: self.view, menuItems: ["First Item","Second Item","Third Item"])
        sideBar.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sideBarDidSelectButtonAtIndex(index: Int) {
        if index == 0{
            //first item selected
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
