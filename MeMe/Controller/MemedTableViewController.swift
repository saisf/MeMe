//
//  MemedTableViewController.swift
//  MeMe
//
//  Created by Sai Leung on 4/25/18.
//  Copyright © 2018 Sai Leung. All rights reserved.
//

import UIKit

class MemedTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var memeTableView: UITableView!
    var num:Int?
    
    var topText: String?
    var bottomText: String?
    var originalImage: UIImage?
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.reloadInputViews()
    }
    
    @IBOutlet weak var memeCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeTableView.dataSource = self
        memeTableView.delegate = self
        memeTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MemeTableViewCell


        let meme = self.memes[(indexPath as NSIndexPath).row]
        print(indexPath.row)
        cell.memedImage.image = meme.memedImage
        cell.memedLabel.text = "\(meme.topText ?? "")...\(meme.bottomText ?? "")"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! EditMemedViewController
        destination.num = self.num
        destination.topText = self.topText
        destination.bottomText = self.bottomText
        destination.originalImage = self.originalImage
    }


    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
        performSegue(withIdentifier: "EditMemedViewControllerSegue", sender: self)
    }
    
    @IBAction func toEditButton(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func addNewMemeButton(_ sender: UIBarButtonItem) {
        let loginVC: UIViewController? = self.storyboard?.instantiateViewController(withIdentifier: "memeEditor")
        if let loginVC = loginVC {
            self.present(loginVC, animated: true, completion: nil)
        }
    }
}
