//
//  PhotoViewController.swift
//  PhotoGallery
//
//  Created by Ilya Pavlov on 11.07.2023.
//

import UIKit

class PhotoViewController: UIViewController {
    var image: UIImage?
    
    @IBOutlet weak var photoImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.image = image
        photoImageView.contentMode = .scaleAspectFill

    }
    
    @IBAction func shareAction(_ sender: Any) {
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        
        shareController.completionWithItemsHandler = { _, bool, _, _ in
            if bool {
                print("Success")
            }
            
        }
        
        present(shareController, animated: true)
        
    }


}
