//
//  SettingsViewController.swift
//  Tip
//
//  Created by Kunwar Sahni on 1/16/20.
//  Copyright © 2020 purdue. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let tipDefault = defaults.integer(forKey: "Tip")
        segmentedControl.selectedSegmentIndex = tipDefault
    }
    

    @IBAction func valueChanged(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(segmentedControl.selectedSegmentIndex, forKey: "Tip")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
