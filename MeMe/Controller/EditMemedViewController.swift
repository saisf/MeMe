//
//  EditMemedViewController.swift
//  MeMe
//
//  Created by Sai Leung on 4/26/18.
//  Copyright © 2018 Sai Leung. All rights reserved.
//

import UIKit

class EditMemedViewController: UIViewController {
   
    
    @IBOutlet weak var editMemedImage: UIImageView!
    var num: Int?
    var topText: String?
    var bottomText: String?
    var originalImage: UIImage?
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {

        // MARK: Presenting memed image
        let meme = self.memes[num!]
        editMemedImage.image = meme.memedImage

    }

    @IBAction func editButton(_ sender: UIBarButtonItem) {
                let controller = self.storyboard!.instantiateViewController(withIdentifier: "viewController") as! ViewController
        
        // MARK: Passing memed image to viewController for editing
                controller.originalImage = self.originalImage
                controller.topText = self.topText
                controller.bottomText = self.bottomText
                num = 1
                controller.num = self.num
                self.present(controller, animated: true, completion: nil)
    }
    
}
