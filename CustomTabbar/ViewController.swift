//
//  ViewController.swift
//  CustomTabbar
//
//  Created by 刘浩浩 on 16/7/6.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var _myTabbar = LHHTabbar()
    var _vcTabbarArray:[UIViewController] = []
    var _vcArray = NSArray()
    var _normalImageArray = NSArray()
    var _selectImagerray = NSArray()
    var _tabbarTitleArray = NSArray()
    var _tabbar = UITabBarController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let vc1 = ViewController1()
//        let nav1 = UINavigationController(rootViewController: vc1)
//        
//        let vc2 = ViewController2()
//        let nav2 = UINavigationController(rootViewController: vc2)
//
//        let vc3 = ViewController3()
//        let nav3 = UINavigationController(rootViewController: vc3)
//
//        let vc4 = ViewController4()
//        let nav4 = UINavigationController(rootViewController: vc4)
//
//        _vcArray = [nav1,nav2,nav3,nav4]
//        _tabbar.viewControllers = _vcArray as? [UIViewController];

        _vcArray = ["ViewController1","ViewController2","ViewController3","ViewController4"]
        _normalImageArray = ["normalImage1.png","normalImage2","normalImage3","normalImage4"]
        _selectImagerray = ["selectImage1.png","selectImage2","selectImage3","selectImage4"];
        _tabbarTitleArray = ["药房","咨询","手环","个人"]
        
        for var i = 0;i<_vcArray.count;i++ {
      
            let nameSpace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"]
            guard let ns = nameSpace as? String else{
                return
            }
            let myClass: AnyClass? = NSClassFromString(ns + "." + (_vcArray[i] as! String))
            guard let myClassType = myClass as? UIViewController.Type else{
                return
            }
            
            let myVC = myClassType.init()
            
            
            let nvc = UINavigationController(rootViewController: myVC)
            
            _vcTabbarArray.append(nvc)
            
            
        }
        //    自定义控件  －   真实控件的功能＋假的UI
        _tabbar.viewControllers = _vcTabbarArray;
        _tabbar.tabBar.alpha = 0.6;
        _myTabbar.frame = CGRectMake(0, self.view.frame.size.height-49, self.view.frame.size.width, 49);
        _myTabbar.creatLHHTabbar(nil, orUseBackGroundView: true, bgViewColor: UIColor.orangeColor(), viewControllerArray: _vcTabbarArray, normalImageArray: _normalImageArray, selectImageArray: _selectImagerray, itemTitleArray: _tabbarTitleArray, currentTarget:self, selector:#selector(self.itemAction(_:)))
        _tabbar.view.addSubview(_myTabbar)
        self.view.addSubview(_tabbar.view)
        
     
    }
    func itemAction(btn:UIButton) {
        
        for var view in (btn.superview?.superview?.subviews)! {
            
            if !view.isKindOfClass(UILabel) {
                let imageView = view.subviews[0] as! UIImageView
                let label = view.subviews[1] as! UILabel
                
                if imageView.tag == btn.tag {
                    imageView.image = UIImage(named: "\(_selectImagerray[Int(btn.tag)])")
                    label.textColor = UIColor.init(red: 0.00, green: 0.76, blue: 0.83, alpha: 1.00)
                }
                else
                {
                    imageView.image = UIImage(named: "\(_normalImageArray[Int(imageView.tag)])")
                    label.textColor = UIColor.whiteColor();
                }
            }
            
        }
        _tabbar.selectedIndex = btn.tag;

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




