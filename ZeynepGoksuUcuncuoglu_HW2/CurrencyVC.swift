//
//  CurrencyVC.swift
//  ZeynepGoksuUcuncuoglu_HW2
//
//  Created by Zeynep Üçüncüoğlu on 14.11.2022.
//

import UIKit

enum Controller: Int {
    case one = 1, two, three
}

class CurrencyVC: UIViewController, UITextFieldDelegate {
    
   
    
    var controller = Controller.one
    
    @IBOutlet weak var segmentedCurr: UISegmentedControl!
    @IBOutlet weak var imageCurr: UIImageView!
    @IBOutlet weak var result: UITextField!
    @IBOutlet weak var toBeConverted: UITextField!
    @IBOutlet weak var toBeConvertedLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    
    @IBAction func onSingleTap(_ sender: UITapGestureRecognizer) {
        switch (controller){
        case .one:
            segmentedCurr.selectedSegmentIndex=1
            imageCurr.image=UIImage(named: "tl_euro")
            controller = .two
            resultLabel.text="EUR(€):"
            toBeConverted.text=" "
            result.text=" "
        case .two:
            segmentedCurr.selectedSegmentIndex=2
            imageCurr.image=UIImage(named: "tl_gbp")
            controller = .three
            resultLabel.text="GBP(£):"
            toBeConverted.text=" "
            result.text=" "
        case .three:
            segmentedCurr.selectedSegmentIndex=0
            imageCurr.image=UIImage(named: "tl_usd")
            controller = .one
            resultLabel.text="USD($):"
            
        }
    }
    
    @IBAction func onSegmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            imageCurr.image=UIImage(named: "tl_usd")
            controller = Controller.one
            resultLabel.text="USD($):"
        case 1:
            imageCurr.image=UIImage(named: "tl_euro")
            controller = Controller.two
            resultLabel.text="EUR(€):"
        case 2:
            imageCurr.image=UIImage(named: "tl_gbp")
            controller = Controller.three
            resultLabel.text="GBP(£):"
        default:
            break
        }
    }
    
    @IBAction func resEditingBegin(_ sender: UITextField) {
        toBeConverted.text = "0.0"
    }
    @IBAction func resEditingChanged(_ sender: UITextField) {
        toBeConverted.text=String(calculateData2())
    }
    
    @IBAction func tlEditingBegin(_ sender: UITextField) {
        result.text = "0.0"
    }
    @IBAction func tlEditingChanged(_ sender: UITextField) {
        result.text=String(calculateData1())
    }
    
    func calculateData1() -> (Double) {
        
        var tl = Double(toBeConverted.text!)
        
        var res = 1.0
        
        switch (controller){
        case .one:
            res = tlToUSD(tl: tl!)
        case .two:
            res  = tlToEURO(tl: tl!)
        case .three:
            res = tlToGBP(tl: tl!)
        }
        
        
        return (res)
    }
    
    func calculateData2() -> (Double) {
        
        var tl = 1.0
        let res = Double(result.text!)!
        
        switch (controller){
        case .one:
            tl = USDtoTl(money: res)
        case .two:
            tl  = EUROtoTl(money: res)
        case .three:
            tl = GBPtoTl(money: res)
        }
        
        
        return (tl)
    }
    
    func tlToUSD(tl: Double) -> Double {
        return ( tl * 18.6 )
    }
    
    func tlToEURO(tl: Double) -> Double {
        return ( tl * 18.2 )
    }
    
    func tlToGBP(tl: Double) -> Double {
        return ( tl * 21.5 )
    }
    func USDtoTl(money: Double) -> Double {
        return ( money / 18.6 )
    }
    
    func EUROtoTl(money: Double) -> Double {
        return ( money / 18.2 )
    }
    
    func GBPtoTl(money: Double) -> Double {
        return ( money / 21.5 )
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            toBeConvertedLabel.text="TL(₺):"
            resultLabel.text="USD($):"
           
            
        }
        
    
        
    
}
