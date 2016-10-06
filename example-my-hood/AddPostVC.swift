//
//  AddPostVC.swift
//  example-my-hood
//
//  Created by momo on 9/30/16.
//  Copyright © 2016 Jo-Jo Lin. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var postImg: UIImageView!
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var descField: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postImg.layer.cornerRadius = 112
        postImg.clipsToBounds = true
        
        
        print("width: \(postImg.frame.width)")
        
        // init image picker
        imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        
    
    }
    
    
    @IBAction func makePostBtnPressed(_ sender: AnyObject) {
        
        if let title = titleField.text, let desc = descField.text, let img = postImg.image {
            
            let imgPath = DataService.sharedInstance.saveImageAndCreateImagePath(image: img)
            
            let newPost = Post(title: title, imagePath: imgPath, description: desc)
            
            // when new post is added, it will save to user defaults and reload the loadedPosts
            DataService.sharedInstance.addPost(post: newPost)
            
            // dismiss the view to previous/home view
           _ = self.navigationController?.popViewController(animated: true)
        }
    }

    @IBAction func addPhotoBtnPressed(_ sender: UIButton) {
        
        sender.setTitle("", for: .normal)
        present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            postImg.contentMode = .scaleToFill
            postImg.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
