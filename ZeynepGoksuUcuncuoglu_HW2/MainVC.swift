//
//  ViewController.swift
//  ZeynepGoksuUcuncuoglu_HW2
//
//  Created by Zeynep Üçüncüoğlu on 14.11.2022.
//

import UIKit

class MainVC: UIViewController {
    
    
    @IBOutlet weak var calcBtn: UIButton!
    @IBOutlet weak var currBtn: UIButton!
    @IBOutlet weak var infoBtn: UIButton!
    func setBackground() {
            // Create a gradient layer.
            let gradientLayer = CAGradientLayer()
            // Set the size of the layer to be equal to the size of display.
            gradientLayer.frame = view.bounds
            // Set an array of Core Graphics colors (.cgColor) to create the gradient.
            gradientLayer.colors = [#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1).cgColor, #colorLiteral(red: 0.9622398019, green: 0.9249638319, blue: 0.7202355266, alpha: 1).cgColor]
            // Rasterize this static layer to improve app performance.
            gradientLayer.shouldRasterize = true
            // Apply the gradient to the view.
            self.view.layer.insertSublayer(gradientLayer, at: 0)
            
        }

    override var shouldAutorotate: Bool {
            return false
        }
    
   
    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {
    
    }
    
    @IBAction func calcOnClick(_ sender: Any) {
        performSegue(withIdentifier: "calcID", sender: sender)
    }
    @IBAction func currencyOnclick(_ sender: Any) {
        performSegue(withIdentifier: "currID", sender: sender)
    }
    @IBAction func onClick(_ sender: Any) {
        performSegue(withIdentifier: "aboutID", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="aboutID")
        {
            let av = segue.destination as! AboutVC
            av.titleText = "About Controller"
            av.titleColor = UIColor.red
            av.titleBackgroundColor = UIColor.systemOrange
            av.titleFont=UIFont.boldSystemFont(ofSize: 24.0)
            av.bodyText = "CTIS 480: HW2 Solution"
            av.bodyColor = UIColor.purple
            
            //av.btnText = UILabel(frame: "Close")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
    }


}

