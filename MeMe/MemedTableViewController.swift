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
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    @IBOutlet weak var memeCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeTableView.dataSource = self
        memeTableView.delegate = self
        memeTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MemeTableViewCell
        
        let meme = self.memes[(indexPath as NSIndexPath).row]
        cell.memedImage.image = meme.memedImage
        cell.memedLabel.text = meme.topText
        return cell
        
    }
    
    @IBAction func addNewMemeButton(_ sender: UIBarButtonItem) {
        let loginVC: UIViewController? = self.storyboard?.instantiateViewController(withIdentifier: "memeEditor")
        
        if let loginVC = loginVC {
            self.present(loginVC, animated: true, completion: nil)
        }
    }
}
