//
//  ViewController.swift
//  OverlaidImageView
//
//  Created by YukiOkudera on 2019/04/17.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import AVFoundation
import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var topImageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var topImageViewWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewWidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageViewConstraint(self.topImageView,
                                 heightConstraint: topImageViewHeightConstraint,
                                 widthConstraint: topImageViewWidthConstraint)
        setupImageViewConstraint(self.imageView,
                                 heightConstraint: imageViewHeightConstraint,
                                 widthConstraint: imageViewWidthConstraint)
    }
}

extension ViewController {
    
    private func setupImageViewConstraint(_ imageView: UIImageView,
                                          heightConstraint: NSLayoutConstraint,
                                          widthConstraint: NSLayoutConstraint) {
        heightConstraint.constant = calculateImageSize(imageView: imageView).height
        widthConstraint.constant = calculateImageSize(imageView: imageView).width
    }
    
    private func calculateImageSize(imageView: UIImageView) -> CGSize {
        guard let image = imageView.image else {
            return .zero
        }
        let imageSize = AVMakeRect(aspectRatio: image.size, insideRect: imageView.bounds).size
        return imageSize
    }
}
