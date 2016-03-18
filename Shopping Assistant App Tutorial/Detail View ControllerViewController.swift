
//
//  Detail View ControllerViewController.swift
//  Shopping Assistant App Tutorial
//
//  Created by Cynthia Whitlatch on 3/18/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class Detail_View_ControllerViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView?    
    @IBOutlet weak var shoe: UILabel!

    @IBOutlet weak var name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
