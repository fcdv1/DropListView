//
//  ViewController.swift
//  DropListView
//
//  Created by CIA on 30/11/2017.
//  Copyright © 2017 CIA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var countryButton: UIButton!
    
    @IBAction func countryButtonPressed(_ sender: Any) {
        // cell labels
        let countrys = ["China","USA","UK","India"]
        
        //cell backgroundColor
        let colors = [UIColor.brown,UIColor.blue,UIColor.purple,UIColor.lightGray]
        
        //cell left images
        var cellImages:[UIImage] = []
        for i in 0 ..< countrys.count{
            cellImages.append(UIImage(named: "\(i)")!)
        }
        
        //configure cell
        var configures:[DropCellConfigure] = []
        for i in 0 ..< countrys.count{
            let configure = DropCellConfigure()
            configure.title = countrys[i]
            configure.cellBackGroundColor = colors[i]
            configure.iconImage = cellImages[i]
            configures.append(configure)
        }
        
        DropListView.showDropListViewWithRelateView(countryButton, showingItems: configures, cellAlignment: .left, cellSeletCallBack: { (index) in
            self.countryButton.setTitle(configures[index].title, for: .normal)
        }, userDismissDropViewCallBack: {
            print("user cancel")
        })
    }
    
}

