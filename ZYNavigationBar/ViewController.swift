//
//  ViewController.swift
//  ZYNavigationBar
//
//  Created by yu zhou on 11/09/2018.
//  Copyright © 2018 yu zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var barAlphtLabel: UILabel!
    var tttttt = 0
    let barTintColors = [UIColor.green,UIColor.yellow,UIColor.red,UIColor.blue]
    let vc = UIViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.zy_barTintColor = UIColor.brown
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func barAlphaSliderHandle(_ sender: UISlider) {
        barAlphtLabel.text = "\(sender.value)"
        self.zy_barAlpha = CGFloat(sender.value)
        self.zy_needsUpdateNavigationBarAlpha()
        self.zy_needsUpdateNavigationBarShadowAlpha()
    }
    @IBAction func hiddenBarSwitchHandle(_ sender: UISwitch) {
        vc.zy_barIsHidden = sender.isOn
    }
    @IBAction func hiddenBarShadowSwitchHandle(_ sender: UISwitch) {
        vc.zy_barShadowIsHidden = sender.isOn
    }
    @IBAction func hiddenblackBarStyleSwitchHandle(_ sender: UISwitch) {
        vc.zy_barStyle = sender.isOn ? .black : .default
    }
    @IBAction func barBackgroundImageSwitchHandle(_ sender: UISwitch) {
        vc.zy_barImage = sender.isOn ? #imageLiteral(resourceName: "image1") : nil
    }
    @IBAction func barTintColorSegmentHandle(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            vc.zy_barTintColor = UIColor.blue
        case 1:
            vc.zy_barTintColor = UIColor.red
        case 2:
            vc.zy_barTintColor = UIColor.yellow
        default:
            break
        }
    }
    
    @IBAction func pushtoNextVCButtonHandle(_ sender: UIButton) {
       let v = self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        v.zy_barTintColor = vc.zy_barTintColor
        v.zy_barImage = vc.zy_barImage
        v.zy_barIsHidden = vc.zy_barIsHidden
        v.zy_barShadowIsHidden = vc.zy_barShadowIsHidden
        v.zy_barStyle = vc.zy_barStyle
        self.navigationController?.pushViewController(v, animated: true)
    }
    
}
