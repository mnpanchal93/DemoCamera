//
//  ViewController.swift
//  DemoCamera
//
//  Created by NFQ-222 on 18.09.23.
//

import UIKit
//import AVFoundation

class CameraViewController: UIViewController {

    
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var galleryViewButton: UIButton!
    
    @IBOutlet weak var cameraView: UIImageView!
    private var imageVC: UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCameraVC()
    }
    
    @IBAction func galleryViewButtonPressed(_ sender: UIButton) {
        //stopCamera()
        performSegue(withIdentifier: "goToGallery", sender: self)
    }
    
    
    @IBAction func captureImage(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imageVC?.takePicture()

        } else{

         //Camera not available.
       }
    }
    
    func showCameraVC() {
        self.imageVC = UIImagePickerController()

        if UIImagePickerController.isCameraDeviceAvailable(.front) {
            self.imageVC?.sourceType = .camera
            self.imageVC?.cameraDevice = .front
            self.imageVC?.showsCameraControls = false
                    
            let screenSize = UIScreen.main.bounds.size
            let cameraAspectRatio = CGFloat(4.0 / 3.0)
            let cameraImageHeight = screenSize.width * cameraAspectRatio
            let scale = screenSize.height / cameraImageHeight
            self.imageVC?.cameraViewTransform = CGAffineTransform(translationX: 0, y: (screenSize.height - cameraImageHeight)/2)
            self.imageVC?.cameraViewTransform = self.imageVC!.cameraViewTransform.scaledBy(x: scale, y: scale)
        
            self.imageVC?.view.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
            self.view.addSubview(self.imageVC!.view)
            self.view.sendSubviewToBack(self.imageVC!.view)
        }
    }
    

}



// MARK: - ImagePicker Delegate Methods

//extension CameraViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
//
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        picker.dismiss(animated: true, completion: nil)
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//        picker.dismiss(animated: true, completion: nil)
//
//        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
//            return
//        }
//
//        cameraView.image = image
//    }
//
//
//}

