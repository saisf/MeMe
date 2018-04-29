//
//  EditMemedViewController.swift
//  MeMe
//
//  Created by Sai Leung on 4/26/18.
//  Copyright © 2018 Sai Leung. All rights reserved.
//

import UIKit

class EditMemedViewController: UIViewController {
    var num: Int?
    
    var topText: String?
    var bottomText: String?
    var originalImage: UIImage?
    
    @IBOutlet weak var editMemedImage: UIImageView!
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let topText = self.topText {
            print(topText)
        }
        let meme = self.memes[num!]
        editMemedImage.image = meme.memedImage

    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationVC = segue.destination as! ViewController
//
//        let meme = self.memes[num!]
//        destinationVC.num = self.num
//    }
//
//    @IBAction func backButton(_ sender: UIBarButtonItem) {
//
//        dismiss(animated: true, completion: nil)
//    }
    @IBAction func editButton(_ sender: UIBarButtonItem) {
//                let meme = self.memes[num!]
                let controller = self.storyboard!.instantiateViewController(withIdentifier: "viewController") as! ViewController
                controller.originalImage = self.originalImage
                controller.topText = self.topText
                controller.bottomText = self.bottomText
                num = 1
                controller.num = self.num
                self.present(controller, animated: true, completion: nil)
//        performSegue(withIdentifier: "toViewController", sender: self)
    }
    
}
