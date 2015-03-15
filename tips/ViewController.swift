//
//  ViewController.swift
//  tips
//
//  Created by Anna Yelizarova on 3/14/15.
//  Copyright (c) 2015 Anna Yelizarova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        // 1
        var nav = self.navigationController?.navigationBar
        // 2
        nav?.barStyle = UIBarStyle.Black
        nav?.tintColor = UIColor.yellowColor()
        // 3
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
//        imageView.contentMode = .ScaleAspectFit
        // 4
//        let image = UIImage(named: "Apple_Swift_Logo")
//        imageView.image = image
        // 5
//        navigationItem.titleView = imageView
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        var stringValueFirst = defaults.objectForKey("first") as String
        var stringValueSecond = defaults.objectForKey("second") as String
        var stringValueThird = defaults.objectForKey("third") as String
        var first = stringValueFirst._bridgeToObjectiveC().doubleValue
        var second = stringValueSecond._bridgeToObjectiveC().doubleValue
        var third = stringValueThird._bridgeToObjectiveC().doubleValue
        
        tipControl.setTitle(stringValueFirst + "%", forSegmentAtIndex: 0)
        tipControl.setTitle(stringValueSecond + "%", forSegmentAtIndex: 1)
        tipControl.setTitle(stringValueThird + "%", forSegmentAtIndex: 2)
  
        var tipPercentages = [first/100, second/100, third/100]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount*tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

