//
//  Extension+ImageView.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/20/21.
//

import Kingfisher
import UIKit

extension UIImageView {
        
    func setImage(with resource: ImageResource, activateLoader: Bool) {
        activateLoader == true ? setupLoader() : ()
        self.kf.setImage(with: resource, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { (_, _, _, _) in
            activateLoader == true ? self.kf.indicator?.stopAnimatingView() : ()
        })
    }
    
    func setupLoader() {
        
        kf.indicatorType = .activity
        (kf.indicator?.view as? UIActivityIndicatorView)?.color = .white
        kf.indicator?.startAnimatingView()
    }
    
}
