//
//  SettingsViewController.swift
//  tips
//
//  Created by Anna Yelizarova on 3/15/15.
//  Copyright (c) 2015 Anna Yelizarova. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var firstTipField: UITextField!
    @IBOutlet weak var secondTipField: UITextField!
    @IBOutlet weak var thirdTipField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         var defaults = NSUserDefaults.standardUserDefaults()
        firstTipField.text = defaults.objectForKey("first") as String
        secondTipField.text = defaults.objectForKey("second") as String
        thirdTipField.text = defaults.objectForKey("third") as String
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        var first = firstTipField.text
        var second = secondTipField.text
        var third = thirdTipField.text
        defaults.setObject(first, forKey: "first")
        defaults.setObject(second, forKey: "second")
        defaults.setObject(third, forKey: "third")
        defaults.synchronize()
        
    }
    
    @IBAction func onTapSettings(sender: AnyObject) {
        view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
