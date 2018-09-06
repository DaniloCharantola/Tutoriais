//
//  ViewController.swift
//  OpenCV-Project
//
//  Created by Rodrigo Maximo on 11/07/18.
//  Copyright © 2018 Rodrigo Maximo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let opencv = OpenCVWrapper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        teste(a: 20) { (a: Int, b: Int) -> Int in
            return a * b
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func grayScale(_ sender: UIButton) {
        guard let image = imageView.image else { return }
        let finalImage = opencv.grayScale(of: image)
        imageView.image = finalImage
    }
    
    @IBAction func negative(_ sender: UIButton) {
        guard let image = imageView.image else { return }
        let finalImage = opencv.negative(of: image)
        imageView.image = finalImage
    }
    
    func teste(a: Int, completion: (Int, Int) -> Int) {
        let b = completion(3,3)
        let _ = a + b
    }
    
    
}

