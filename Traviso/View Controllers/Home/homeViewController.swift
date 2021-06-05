//
//  homeViewController.swift
//  Traviso
//
//  Created by aksa nazir on 04/04/21.


import UIKit


class homeViewController: UIViewController  {

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    
    @IBOutlet weak var SlideShow: UIImageView!
    
    var imageNames = [ "gulmarg3","Pahalgam" , "wular lake2", "WULAR LAKE","yusmarg","VERINAAG","Sonmarg","SHALIMAR","Parimahal","KOKARNAAG","nishat", "KHILANMARG","GULMARG","Dachigamnationalpark","CHASHMASHAHI" ]//List of image names
        override func viewDidLoad() {
            super.viewDidLoad()
            let timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
                self.SlideShow.image = UIImage(named: self.imageNames.randomElement()!) //Slideshow logic
            }
            timer.fire() 
        }
    }

 

        
    
    
    
    
    
  
    








