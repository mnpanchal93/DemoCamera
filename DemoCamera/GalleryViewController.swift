//
//  GalleryViewController.swift
//  DemoCamera
//
//  Created by NFQ-222 on 18.09.23.
//

import UIKit
import Photos


class GalleryViewController: UIViewController{

    
    @IBOutlet weak var photosGalleryView: UICollectionView!
    
    var allPhotos = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photosGalleryView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier)
        loadPhtots()
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func loadPhtots() {
        let manager = PHImageManager.default()
            let requestOptions = PHImageRequestOptions()
            requestOptions.isSynchronous = false
            requestOptions.deliveryMode = .highQualityFormat
            // .highQualityFormat will return better quality photos
            let fetchOptions = PHFetchOptions()
            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]

            let results: PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
            if results.count > 0 {
                for i in 0..<results.count {
                    let asset = results.object(at: i)
                    let size = CGSize(width: 700, height: 700)
                    manager.requestImage(for: asset, targetSize: size, contentMode: .aspectFill, options: requestOptions) { (image, _) in
                        if let image = image {
                            self.allPhotos.append(image)
                            self.photosGalleryView.reloadData()
                        } else {
                            print("error asset to image")
                        }
                    }
                }
            } else {
                print("no photos to display")
            }
    }

}


extension GalleryViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.identifier, for: indexPath) as! GalleryCollectionViewCell
        cell.configure(with: allPhotos[indexPath.row])
         //let asset = allPhotos?.object(at: indexPath.row)
         //cell.imgPicture.fetchImage(asset: asset!, contentMode: .aspectFit, targetSize: cell.imgPicture.frame.size)
         return cell
    }
    
}

//extension UIImageView{
// func fetchImage(asset: PHAsset, contentMode: PHImageContentMode, targetSize: CGSize) {
//    let options = PHImageRequestOptions()
//    options.version = .original
//    PHImageManager.default().requestImage(for: asset, targetSize: targetSize, contentMode: contentMode, options: options) { image, _ in
//        guard let image = image else { return }
//        switch contentMode {
//        case .aspectFill:
//            self.contentMode = .scaleAspectFill
//        case .aspectFit:
//            self.contentMode = .scaleAspectFit
//        @unknown default:
//
//        }
//        self.image = image
//    }
//   }
//}
