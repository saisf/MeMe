//
//  ViewController.swift
//  MeMe
//
//  Created by Sai Leung on 4/18/18.
//  Copyright © 2018 Sai Leung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pickAnImage(_ sender: UIBarButtonItem) {
        
        let viewController = UIImagePickerController()
        
        present(viewController, animated: true, completion: nil)
    }
    
}

