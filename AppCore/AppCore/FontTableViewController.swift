//
//  FontTableViewController.swift
//  AppCore
//
//  Created by MENG, Joel on 13/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import UIKit

class FontTableViewController: UITableViewController {
    
    struct FontFamily {
        let familyName: String
        let fontFaces: [FontFace]
    }
    
    struct FontFace {
        let faceName: String
    }
    
    private var fonts: [FontFamily] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(UIFont.familyNames.sorted().count)
        fonts = UIFont.familyNames.sorted().map { family in
            let faceNames = UIFont.fontNames(forFamilyName: family).map({ (faceName) -> FontFace in
                FontFace(faceName: faceName)
            })
            return FontFamily(familyName: family, fontFaces: faceNames)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return fonts.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fonts[section].fontFaces.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let fontName = fonts[indexPath.section].fontFaces[indexPath.row].faceName
        cell.textLabel?.text = fontName
        cell.textLabel?.font = UIFont(name: fontName, size: 15)
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return fonts[section].familyName
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let font = fonts[indexPath.section].fontFaces[indexPath.row]
        performSegue(withIdentifier: "inspectFont", sender: font)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "inspectFont" {
            if let destinationViewController = segue.destination as? FontFeatureViewController {
                destinationViewController.font = sender as! FontFace
            }
        }
    }

}
