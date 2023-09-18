//
//  GalleryCollectionViewCell.swift
//  DemoCamera
//
//  Created by NFQ-222 on 18.09.23.
//

import UIKit
import Photos

class GalleryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    let pictureImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(pictureImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:)has not been implemented")
        
    }
    
    func configure(with image:UIImage){
        pictureImageView.image = image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
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

