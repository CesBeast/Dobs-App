//
//  ViewController.swift
//  Dobs
//
//  Created by cesar garcia on 6/6/16.
//  Copyright © 2016 CesBeast. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func cancelLogin(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func createAccount(sender: AnyObject) {
        FIRAuth.auth()?.createUserWithEmail(username.text!, password: password.text!, completion: {
            user,error in
            
            if error != nil{ //account was already created
                print("account already created")
                self.login()
            }
            else{
                //account created
                print("account created")
                self.login()
                
            }
        })
    }
    
    func login(){
        
        //
        FIRAuth.auth()?.signInWithEmail(username.text!, password: password.text!, completion: {
            user,error in
            
            if error != nil{
                //incorrect username or password
                print("Incorrect username/password")
            }
            else{
                //logged in
                print("Logged in")
            }
        })

    }
}

