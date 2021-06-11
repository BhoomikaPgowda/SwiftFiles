//
//  ViewController.swift
//  Wheather
//
//  Created by Bhoomika H P on 09/06/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var ContentView: UIView!
    let newLayer = CAGradientLayer()
    var heightNotSet = true
    var screenHeight: CGFloat = 0.0
    var flag = false
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y:0, width:375, height: 667))
           imageView.image = UIImage(named: "backgroundImg")
           imageView.contentMode = .scaleToFill
           imageView.translatesAutoresizingMaskIntoConstraints = false
           return imageView
       }()
    @IBOutlet weak var screenSelectView: UIView!
    @IBOutlet weak var celciusButton: UIButton!
    @IBOutlet weak var fahrenhietButton: UIButton!
    @IBOutlet weak var homeButton: UIView!
    @IBOutlet weak var favouriteButton: UIView!
    @IBOutlet weak var recentSearchButton: UIView!
    @IBOutlet weak var MenuButton: UIButton!
    
    var weatherCondition = [WeatherCondition.minmax.rawValue,WeatherCondition.precipitation.rawValue,WeatherCondition.humudity.rawValue,WeatherCondition.wind.rawValue,WeatherCondition.visibality.rawValue]
    var weatherImg = [WeatherImages.temperature.rawValue,WeatherImages.rain.rawValue,WeatherImages.humidity.rawValue,WeatherImages.wind.rawValue,WeatherImages.visibality.rawValue]
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        newLayer.frame = view.frame
        newLayer.locations = [0, 1]
        newLayer.startPoint = CGPoint(x: 0.5, y: 0)
        newLayer.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(newLayer, at: 0)
        self.navigationController?.isNavigationBarHidden = true
        view.insertSubview(imageView, at: 0)
        self.screenSelectView.isHidden = true
        celciusButton.layer.borderWidth = 2.0
        celciusButton.layer.borderColor = UIColor.white.cgColor
        fahrenhietButton.layer.borderWidth = 2.0
        fahrenhietButton.layer.borderColor = UIColor.white.cgColor
        
        //add tapGesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        ContentView.addGestureRecognizer(tap)
        ContentView.isUserInteractionEnabled = true
        
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
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.screenSelectView.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
      //  super.viewDidLayoutSubviews()
        
        newLayer.frame = view.bounds
        if UIDevice.current.orientation.isLandscape  {
            imageView.frame = view.frame
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
    
    @IBAction func MenuButtonClicked(_ sender: Any) {
        if (flag == false ){
            self.screenSelectView.isHidden = false
        }
    
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 1
       }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherCondition.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CollectionViewCell
        cell.cellImage.image = UIImage(named: weatherImg[indexPath.row])
        cell.weatherPerameter.text = weatherCondition[indexPath.row]
        cell.weatherParamtrData.text = "27"
        return cell
    }
   
}

