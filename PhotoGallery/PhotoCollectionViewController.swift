//
//  PhotoCollectionViewController.swift
//  PhotoGallery
//
//  Created by Ilya Pavlov on 10.07.2023.
//

import UIKit


class PhotoCollectionViewController: UICollectionViewController {
    
    let photosArray = [ "kazan1",
                        "kazan2",
                        "kazan3",
                        "kazan4",
                        "kazan5",
                        "kazan6",
                        "kazan7",
                        "kazan8",
                        "kazan9",
                        "kazan10"]
    
    let itemsPerRow: CGFloat = 3
    let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        //        layout.itemSize = CGSize(width: 70, height: 70)
        //        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        //        layout.minimumLineSpacing = 1
        //        layout.minimumInteritemSpacing = 1
        //        layout.scrollDirection = .vertical
        //
        //        collectionView.showsVerticalScrollIndicator = false
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pickPhotoSegue" {
            let photoVC = segue.destination as! PhotoViewController
            let cell = sender as! PhotoCellCV
            photoVC.image = cell.kazanImageView.image
            
        }
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photosArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCellCV
        
        // вытягиваем имя фото
        let imageName = photosArray[indexPath.item]
        
        // присваиваем картинку по названию
        let image = UIImage(named: imageName)
        
        // присваиваем картинку ячейке
        cell.kazanImageView.contentMode = .scaleAspectFill
        cell.kazanImageView.image = image
        
        return cell
    }
    
}

// делаем расширение, чтобы конфигурировать ячейки - один из способов. При конфигурации можно использовать, как константные значения, так и формулы (чтобы учитывать разные размеры экрана устройств)

extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    
    // метод для конфигурации размера ячейки с помощью кода
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // зафиксируем ширину с помощью формулы, которая будет зависеть от количества объектов в строк
        let paddingWidth = sectionInsets.left * (itemsPerRow + 1)

        // узнаем, какая ширина доступна для контента
        let availableWidth = collectionView.frame.width - paddingWidth

        // вычисляем доступную ширину для одного объекта
        let widthPerItem = availableWidth / itemsPerRow

        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    
    // метод, который позволяет создавать отступы до границ safe area
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // для настройки расстояния между самими объектами коллекции по линиям
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    // для настройки расстояния между самими объектами коллекции по столбцами
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
}
