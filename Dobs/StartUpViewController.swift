//
//  LoginViewController.swift
//  Dobs
//
//  Created by cesar garcia on 6/7/16.
//  Copyright © 2016 CesBeast. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class StartUpViewController: UIViewController {
    
    @IBOutlet var VideoView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Video player
    func setupView(){
        let path = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("IMG_0768", ofType: "mov")!)
        
        let player  = AVPlayer(URL: path)
        
        let newLayer = AVPlayerLayer(player: player)
        newLayer.frame = self.VideoView.frame
        self.VideoView.layer.addSublayer(newLayer)
        newLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.titleText(self.VideoView)//Setting the title
        player.play()
        player.actionAtItemEnd = AVPlayerActionAtItemEnd.None
        self.createButtons(self.VideoView)

    }
    
    //Title and properties
    func titleText(containerView: UIView){
        
        let half:CGFloat = 1.0/2.0
        let titleLabel = UILabel()
        titleLabel.text = "Dobs"
        titleLabel.font = UIFont(name: "Apple Color Emoji", size: 120.0)
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.sizeToFit() //sets width
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.frame.origin.x = (containerView.frame.size.width - titleLabel.frame.size.width) * half
        titleLabel.frame.origin.y = (containerView.frame.size.height - titleLabel.frame.size.height) * half
        containerView.addSubview(titleLabel)
    }
    
    //Creating buttons
    func createButtons(containerView: UIView){
        //Login Button
        let margin:CGFloat = 15.0
        let middleSpacing:CGFloat = 7.5
        
        let signIn = UIButton() //Creates Button
        signIn.setTitle("Log In", forState: .Normal)
        signIn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        signIn.backgroundColor = UIColor.blueColor()
        signIn.frame.size.width = ((containerView.frame.size.width-signIn.frame.size.width) - (margin*2))/(2)-middleSpacing
        signIn.frame.size.height = 40.0
        signIn.frame.origin.x = margin
        signIn.frame.origin.y = ((containerView.frame.size.height - signIn.frame.size.height)-25)
        
        //Tapped
        signIn.addTarget(self, action: #selector(StartUpViewController.loginButtonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(signIn)
        
        //Register Button
        let register = UIButton() //Creates Button
        register.setTitle("Register", forState: .Normal)
        register.setTitleColor(UIColor.blackColor(), forState: .Normal)
        register.backgroundColor = UIColor.blueColor()
        register.frame.size.width = ((containerView.frame.size.width-register.frame.size.width) - (margin*2))/(2)-middleSpacing
        register.frame.size.height = 40.0
        register.frame.origin.y = ((containerView.frame.size.height - register.frame.size.height)-25)
        register.frame.origin.x = ((containerView.frame.size.width - register.frame.size.width)-margin)
        
        //Tapped
        register.addTarget(self, action: #selector(StartUpViewController.registerButtonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(register)
    }
    
    
    func loginButtonPressed(sender: UIButton){
        print("lets sign in")
        
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let registerVC:ViewController = storyBoard.instantiateViewControllerWithIdentifier("register") as! ViewController
        
        
        
        
        let navigationController = UINavigationController(rootViewController:registerVC )
        
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
    
    func registerButtonPressed(sender: UIButton){
        print("Lets Register")
        
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let registerVC:ViewController = storyBoard.instantiateViewControllerWithIdentifier("register") as! ViewController
        
        
        registerVC.buttonTitlePressed=sender.titleLabel?.text
        
        
        let navigationController = UINavigationController(rootViewController: registerVC)
        
        self.presentViewController(navigationController, animated: true, completion: nil)

        
    }
    

    
   }

