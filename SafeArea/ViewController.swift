//
//  ViewController.swift
//  SafeArea
//
//  Created by umar on 10/27/17.
//  Copyright © 2017 Arpatech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Example#1: experiment on Layout Anchors
        
        let guide = UILayoutGuide()
        guide.identifier = "layoutguide"
        guide.owningView?.backgroundColor = .yellow
        self.view.addLayoutGuide(guide)
        
        //setting layout guide
        guide.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        guide.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        guide.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        //adding views
        let redview = UIView()
        redview.backgroundColor = .red
        redview.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(redview)
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        greenView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(greenView)
        
        //giving height and width explicitly
        redview.widthAnchor.constraint(equalToConstant: 50).isActive = true
        redview.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        greenView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        greenView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //making center with guide layout
        redview.centerYAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
        greenView.centerYAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
        
        greenView.trailingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        redview.leadingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        
        
        //Example#2: Showing spacing b/w buttons using bottom layout guide which is deprecated
        /*
        let saveBtn = UIButton(type: .roundedRect)
        saveBtn.setTitle("Save", for: .normal)
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(saveBtn)
        
        let revertBtn = UIButton(type: .roundedRect)
        revertBtn.setTitle("Revert", for: .normal)
        revertBtn.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(revertBtn)
        
        let cancelBtn = UIButton(type: .roundedRect)
        cancelBtn.setTitle("Cancel", for: .normal)
        cancelBtn.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(cancelBtn)
        
        //layout guide
        let guide = UILayoutGuide()
        guide.identifier = "group-buttons"
        
        self.view.addLayoutGuide(guide)
        
        guide.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        guide.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor, constant: -20).isActive = true
        
        saveBtn.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        saveBtn.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        saveBtn.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        
        revertBtn.topAnchor.constraint(equalTo: saveBtn.bottomAnchor, constant: 20).isActive = true
        revertBtn.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        revertBtn.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        
        cancelBtn.topAnchor.constraint(equalTo: revertBtn.bottomAnchor, constant: 20).isActive = true
        cancelBtn.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        cancelBtn.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        
        cancelBtn.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        */
        
        
        //Example# 4 (SAFE AREA INTRO iOS11)
        /*
        let greenView = UIView()
        greenView.backgroundColor = .green
        greenView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(greenView)
        
        greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
            greenView.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1.0).isActive = true
            guide.bottomAnchor.constraintEqualToSystemSpacingBelow(greenView.bottomAnchor, multiplier: 1.0).isActive = true
            
        }else {
            let standardSpacing : CGFloat = 8.0
            greenView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: standardSpacing).isActive = true
            self.bottomLayoutGuide.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: standardSpacing).isActive = true
        }
        */
    }
    
    //rendering border on guide to show it visible on screen
    override func viewDidLayoutSubviews() {
        for guide in self.view.layoutGuides {
            print(guide.layoutFrame)
            let view = UIView(frame: guide.layoutFrame)
            view.layer.borderColor = UIColor.red.cgColor
            view.layer.borderWidth = 1.0
            self.view.addSubview(view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

