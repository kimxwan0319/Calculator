//
//  ViewController.swift
//  Calculator
//
//  Created by 김수완 on 2020/07/18.
//  Copyright © 2020 김수완. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Value: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var expression : [Character] = ["0",]
    var numArr : [Int] = []
    var signArr : [Character] = []
    var temp : [Character] = []
    
    func input(_ num : Character) -> Void {
        if expression[0] == "0" {
            expression.remove(at: 0)
            Value.text! = String(num)
        }
        else {
            Value.text! += String(num)
        }
        expression.append(contentsOf: String(num))
        temp.append(contentsOf: String(num))
    }
    
    func sign(_ char : Character) -> Void {
        let max : Int = temp.count - 2
        var i : Int = max
        var count = 1
        
        while i>=0 {
            count += 1
            numArr.append(Int(String(temp[i]))!*tenSquared(count))
            i -= 1
        }
        signArr.append(char)
        
        for _ in 0..<temp.count {
            temp.remove(at: 0)
        }
    }
    
    @IBAction func one(_ sender: Any) {
        input("1")
    }
    @IBAction func two(_ sender: Any) {
        input("2")
    }
    @IBAction func three(_ sender: Any) {
        input("3")
    }
    @IBAction func four(_ sender: Any) {
        input("4")
    }
    @IBAction func five(_ sender: Any) {
        input("5")
    }
    @IBAction func six(_ sender: Any) {
        input("6")
    }
    @IBAction func seven(_ sender: Any) {
        input("7")
    }
    @IBAction func eight(_ sender: Any) {
        input("8")
    }
    @IBAction func nine(_ sender: Any) {
        input("9")
    }
    @IBAction func zero(_ sender: Any) {
        input("0")
    }
    @IBAction func plus(_ sender: Any) {
        input("+")
        sign("+")
    }
    @IBAction func minus(_ sender: Any) {
        input("-")
        sign("-")
    }
    @IBAction func multiply(_ sender: Any) {
        input("×")
        sign("×")
    }
    @IBAction func division(_ sender: Any) {
        input("÷")
        sign("÷")
    }
    
    @IBAction func AC(_ sender: Any) {
        for _ in 0..<expression.count {
            expression.remove(at: 0)
        }
        expression.append(contentsOf: "0")
        Value.text = String(0)
    }
    
    @IBAction func equalSign(_ sender: Any) {
        for var i in 0..<signArr.count-1{
            switch signArr[i] {
            case "×":
                numArr[i+1] *= numArr[i]
                numArr.remove(at: i)
                signArr.remove(at: i)
                i -= 1
            case "÷":
                numArr[i+1] /= numArr[i]
                numArr.remove(at: i)
                signArr.remove(at: i)
                i -= 1
            default:
                continue
            }
        }
        for var i in 0..<signArr.count{
            switch signArr[i] {
            case "+":
                numArr[i+1] += numArr[i]
                numArr.remove(at: i)
                signArr.remove(at: i)
                i -= 1
            case "-":
                numArr[i+1] -= numArr[i]
                numArr.remove(at: i)
                signArr.remove(at: i)
                i -= 1
            default:
                continue
            }
        }
        Value.text = String(numArr[0])
    }
    
    func tenSquared (_ n : Int) -> Int {
        var result : Int = 1
        for _ in 0..<n-1 {
            result *= 10;
        }
        return result
    }

}

