//
//  ViewController.swift
//  RectangularRoomGUI
//
//  Created by Christopher Everett on 4/19/16.
//  Copyright © 2016 Christopher Everett. All rights reserved.
//

// Note:  This is a toy app, so I haven't bothered to implement the MVC pattern 

import Cocoa

class ViewController: NSViewController {
    
    // Constants
    let METER_FT_CONV_FACTOR = 0.09290304
    let FT_METER_CONV_FACTOR = 10.7639

    @IBOutlet weak var lblRoomSize: NSTextFieldCell!
    @IBOutlet weak var lblRoomArea: NSTextFieldCell!
    @IBOutlet weak var lengthError: NSTextFieldCell!
    @IBOutlet weak var widthError: NSTextFieldCell!
    
    enum UOM {
        case Feet
        case Meters
    }
    
    var uom = UOM.Feet
    var length = -1
    var width = -1

    @IBAction func setUOM(sender: NSButton) {
        if sender.title == "Feet" {
            uom = UOM.Feet
        }
        else {
            uom = UOM.Meters
        }
        updateDisplay()
    }
    
    @IBAction func updateLength(sender: NSTextField) {
        length = Int(sender.intValue)
        lengthError.title = length > 0 ? "" : "*"
        updateDisplay()
    }
    
    @IBAction func updateWidth(sender: NSTextField) {
        width = Int(sender.intValue)
        widthError.title = width > 0 ? "" : "*"
        updateDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func updateDisplay() {
        let measure = (uom == UOM.Feet) ? "feet" : "meters"
        if length > 0 && width > 0 {
            let areaFeetStr = String(format: "%.2f", areaInFeet())
            let areaMetersStr = String(format: "%.2f", areaInMeters())
            lblRoomSize.title = "You entered dimensions of \(length) \(measure) by \(width) \(measure)."
            lblRoomArea.title = "\(areaFeetStr) feet squared / \(areaMetersStr) meters squared"
        }
        else {
            lblRoomSize.title = ""
            lblRoomArea.title = ""
        }
    }
    
    func areaInFeet()->Double {
        var area: Double
        if uom == UOM.Feet {
            area = Double(length * width)
        }
        else {
            area = Double(length * width) * FT_METER_CONV_FACTOR
        }
        return area
    }

    func areaInMeters()->Double {
        var area: Double
        if uom == UOM.Feet {
            area = Double(length * width) * METER_FT_CONV_FACTOR
        }
        else {
            area = Double(length * width)
        }
        return area
    }

}

