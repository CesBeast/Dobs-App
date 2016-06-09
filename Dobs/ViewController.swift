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
    @IBOutlet weak var posterWorkerControl: UISegmentedControl!
    
    
    var buttonTitlePressed:String?
    var isLogin: Bool!
    var isWorker: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.determineLoginOrRegister()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func posterWorker(sender: AnyObject) {
        if self.posterWorkerControl.selectedSegmentIndex == 1{ //Person is worker
            self.isWorker = true
            
        }
        else{
            self.isWorker = false
        }
        
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
    //Alert Function
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert,animated: true, completion: nil)
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
    
    //Sets the title to either Login or Register
    func determineLoginOrRegister(){
        if buttonTitlePressed != nil{
            if buttonTitlePressed == "Register"{
                isLogin = false
                print("register")
                self.navigationController?.topViewController?.title = "Register"
                self.posterWorkerControl.hidden = false
            }
        }
        else{
            isLogin = true
            print("Login")
            self.navigationController?.topViewController?.title = "Login"
            
        }


    }
}

