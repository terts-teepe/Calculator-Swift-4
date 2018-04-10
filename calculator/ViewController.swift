//
//  ViewController.swift
//  calculator
//
//  Created by felix tertius teepe on 06/04/2018.
//  Copyright © 2018 felix tertius teepe. All rights reserved.
//

import UIKit
import Foundation

var storeNumbersPlus:String?
var storeNumbersMultiply:String?
var storeNumbersMin:String?
var storeNumbersDivide:String?
var lastClicked:Int = 0

class ViewController: UIViewController {
    @IBOutlet weak var displayNumbers: UILabel!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if displayNumbers.text == "0" || lastClicked == 10 {
            lastClicked = sender.tag
            displayNumbers.text = ("\(lastClicked)")
        }
        else {displayNumbers.text?.append("\(sender.tag)")}

    }
    
    
    @IBAction func dotPressed(_ sender: UIButton) {
        displayNumbers.text = displayNumbers.text! + "."
    }
    
    @IBAction func cPressed(_ sender: UIButton) {
        lastClicked = sender.tag
        displayNumbers.text = "0"
    }
    
    @IBAction func plusMinPressed(_ sender: UIButton) {
        let toDouble = Double(displayNumbers.text!)!
        displayNumbers.text! = "\(toDouble * -1)"
    }
    
    @IBAction func percentPressed(_ sender: UIButton) {
        let toDouble = Double(displayNumbers.text!)!
        displayNumbers.text! = "\(toDouble * 0.01)"
    }
    
    @IBAction func plusPressed(_ sender: UIButton) {
        lastClicked = sender.tag
        storeNumbersPlus = displayNumbers.text!
        displayNumbers.text = "0"
    }
    
    @IBAction func dividePressed(_ sender: UIButton) {
        lastClicked = sender.tag
        storeNumbersDivide = displayNumbers.text!
        displayNumbers.text = "0"
    }
    
    
    @IBAction func multiplyPressed(_ sender: UIButton) {
        lastClicked = sender.tag
        storeNumbersMultiply = displayNumbers.text!
        displayNumbers.text = "0"
    }
    
    @IBAction func minPressed(_ sender: UIButton) {
        lastClicked = sender.tag
        storeNumbersMin = displayNumbers.text!
        displayNumbers.text = "0"
    }
    
    
    @IBAction func isPressed(_ sender: UIButton) {
        
        let textAsFloat:Float = Float(displayNumbers.text!)!
        lastClicked = sender.tag
        
        if let userSetPlus = storeNumbersPlus {
            let storeNumbersPlusAsFloat:Float = Float(userSetPlus)!
            let answer = String(format:"%g", (textAsFloat + storeNumbersPlusAsFloat))
            displayNumbers.text = "\(answer)"
        }
        
        else if let userSetMultiply = storeNumbersMultiply {
            let storeNumbersMultiplyAsFloat:Float = Float(userSetMultiply)!
            let answer = String(format:"%g", (textAsFloat * storeNumbersMultiplyAsFloat))
            displayNumbers.text = "\(answer)"
        }
        
        else if let userSetDivide = storeNumbersDivide {
            let storeNumbersDividesAsFloat:Float = Float(userSetDivide)!
            let answer = String(format:"%g", (storeNumbersDividesAsFloat / textAsFloat))
            displayNumbers.text = "\(answer)"
            
        }
        
        else if let userSetMin = storeNumbersMin {
            let storeNumbersMinAsFloat:Float = Float(userSetMin)!
            let answer = String(format:"%g", (storeNumbersMinAsFloat - textAsFloat))
            displayNumbers.text = "\(answer)"
        }
        
        storeNumbersPlus = ""
        storeNumbersMultiply = ""
        storeNumbersMin = ""
        storeNumbersDivide = ""
        
    }
}

