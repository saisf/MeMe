//
//  MemedCollectionViewController.swift
//  MeMe
//
//  Created by Sai Leung on 4/28/18.
//  Copyright © 2018 Sai Leung. All rights reserved.
//

import UIKit

class MemedCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var memedCollectionView: UICollectionView!
    var num:Int?
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

        memedCollectionView.dataSource = self
        memedCollectionView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! MemedCollectionViewCell
        let meme = self.memes[(indexPath as NSIndexPath).row]
        cell.memedImage.image = meme.memedImage
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        if let originalImage = meme.originalImage {
            self.originalImage = originalImage
        }
        
        if let topText = meme.topText {
            print(topText)
            self.topText = topText
        }
        
        if let bottomText = meme.bottomText {
            print(bottomText)
            self.bottomText = bottomText
        }
        
        self.num = indexPath.row
        performSegue(withIdentifier: "CollectionViewControllerSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! EditMemedViewController
        destination.num = self.num
        destination.topText = self.topText
        destination.bottomText = self.bottomText
        destination.originalImage = self.originalImage
    }
}
