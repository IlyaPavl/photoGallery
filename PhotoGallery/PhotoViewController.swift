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
        // создаем экземпляр специального класса, который отвечает за стандартные функции системы (как раз нам нужно кнопку поделиться)
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        
        // для контроля за процессом сохранения / отправки и тд
        shareController.completionWithItemsHandler = { _, bool, _, _ in
            if bool {
                print("Success")
            }
            
        }
        
        present(shareController, animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
