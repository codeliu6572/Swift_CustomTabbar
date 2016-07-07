//
//  LHHTabbar.swift
//  CustomTabbar
//
//  Created by 刘浩浩 on 16/7/6.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

import UIKit

class LHHTabbar: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    /*
     bgImageName和isUse只能有一个使用另一个必为nil，用来设置整个Tabbar背景色
     */
    func creatLHHTabbar(backGroundImage:String?,orUseBackGroundView:Bool,bgViewColor:UIColor ,viewControllerArray:NSArray,normalImageArray:NSArray,selectImageArray:NSArray,itemTitleArray:NSArray,currentTarget:AnyObject,selector:Selector) {
        //创建tabbar背景色，可用图片背景也可用纯色view设置背景
        self.creatLHHTabbarBG(backGroundImage, orUseBackGroundView: orUseBackGroundView, bgViewColor: bgViewColor)
        //创建选择器
        for var i = 0; i<viewControllerArray.count;i++ {
            self.creatLHHTabbarItem(viewControllerArray, normalImageArray: normalImageArray, selectImageArray: selectImageArray, itemTitleArray: itemTitleArray, currentIndex: i, currentTarget: currentTarget, selector: selector)
        }

    }
    func creatLHHTabbarBG(bgImageName:String?,orUseBackGroundView:Bool,bgViewColor:UIColor) {
        if (bgImageName != nil) {
            let imageView = UIImageView(image: UIImage(named: bgImageName!))
            imageView.frame = self.bounds
            self.addSubview(imageView)
        }
        else
        {
            let label = UILabel(frame: self.bounds)
            label.backgroundColor = bgViewColor
            self.addSubview(label)
            
        }
    }
    func creatLHHTabbarItem(controllerArray:NSArray,normalImageArray:NSArray,selectImageArray:NSArray,itemTitleArray:NSArray,currentIndex:Int,currentTarget:AnyObject,selector:Selector) {
        
        let bgView = UIView(frame: CGRectMake((self.bounds.size.width / CGFloat(Float(controllerArray.count))) * CGFloat(Float(currentIndex)), 0, self.bounds.size.width / CGFloat(Float(controllerArray.count)), self.bounds.size.height))
        if currentIndex == 0 {

        }
        else
        {
            bgView.backgroundColor = UIColor.clearColor();
        }
        self.addSubview(bgView)
        
        let imageView = UIImageView(frame: CGRectMake(0, 0, 20, 20))
        imageView.center = CGPointMake(self.bounds.size.width/CGFloat(Float(controllerArray.count))/2, self.bounds.size.height/2-10)
        imageView.tag = currentIndex;
        imageView.userInteractionEnabled = true;
        if currentIndex == 0 {
            imageView.image = UIImage(named: "\(selectImageArray[currentIndex])")
        }
        else
        {
            imageView.image = UIImage(named: "\(normalImageArray[currentIndex])")
        }
        bgView.addSubview(imageView)
        
        let label = UILabel(frame: CGRectMake(0, imageView.center.y+20/2, self.bounds.size.width/CGFloat(controllerArray.count), self.bounds.size.height-(imageView.center.y+20/2)))
        
        label.text = "\(itemTitleArray[currentIndex])"
        if currentIndex == 0 {
            label.textColor = UIColor.init(colorLiteralRed: 0.00, green: 0.76, blue: 0.83, alpha: 1.00)
        }
        else
        {
            label.textColor = UIColor.whiteColor()
        }
        label.textAlignment = NSTextAlignment.Center;
        label.font = UIFont.systemFontOfSize(10)
        bgView.addSubview(label)
        
        let button = UIButton(type: .System)
        button.frame = CGRectMake(0, 0, bgView.frame.size.width, bgView.frame.size.height)
        button.tag = currentIndex;
        button.addTarget(currentTarget, action: selector, forControlEvents: .TouchUpInside)
        bgView.addSubview(button)
    }

}

