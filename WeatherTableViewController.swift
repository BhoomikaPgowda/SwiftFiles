//
//  WeatherTableViewController.swift
//  Wheather
//
//  Created by Bhoomika H P on 11/06/21.
//

import UIKit
class WeatherTableViewController: UIViewController {
    
   
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var ContentView: UIView!
    let newLayer = CAGradientLayer()
    var heightNotSet = true
    var screenHeight: CGFloat = 0.0
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y:0, width:375, height: 667))
           imageView.image = UIImage(named: "backgroundImg")
           imageView.contentMode = .scaleToFill
           imageView.translatesAutoresizingMaskIntoConstraints = false
           return imageView
       }()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        newLayer.frame = view.frame
        newLayer.locations = [0, 1]
        newLayer.startPoint = CGPoint(x: 0.5, y: 0)
        newLayer.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(newLayer, at: 0)
        self.navigationController?.isNavigationBarHidden = true
        view.insertSubview(imageView, at: 0)
        self.tableView.rowHeight = 80
        
        //for bgimg orientation
        if UIDevice.current.orientation.isLandscape{
            imageView.frame = ScrollView.frame

            return
        }
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    override func viewDidLayoutSubviews() {
      //  super.viewDidLayoutSubviews()
        
        newLayer.frame = view.bounds
        if UIDevice.current.orientation.isLandscape  {
           // imageView.frame = view.frame
            screenHeight = ScrollView.frame.size.width
            heightNotSet = false

           } else if heightNotSet {
            screenHeight = ScrollView.frame.size.height
            print( screenHeight)
            heightNotSet = false
           }
        
        let heightConstraint = NSLayoutConstraint(item: ContentView ?? "nil"  , attribute: NSLayoutConstraint.Attribute
           .height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: screenHeight)
        ContentView.addConstraint(heightConstraint)

       }
    


}
