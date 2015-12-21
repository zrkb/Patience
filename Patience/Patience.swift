//
//  Patience.swift
//  Patience
//
//  Created by Felix Ayala on 12/18/15.
//  Copyright © 2015 Pandorga. All rights reserved.
//

import UIKit

public class Patience:UIView {
	
	public static let sharedInstance = Patience()
	
	public let activityIndicator = UIActivityIndicatorView()
	
	private var isVisible = false
	
	private let kNavigationBarHeight:CGFloat = 44.0
	
	class func show(canvas: UIView) {
		self.sharedInstance.showActivityIndicator(canvas, true)
	}
	
	class func show(canvas: UIView, _ hasNavigationBar: Bool) {
		self.sharedInstance.showActivityIndicator(canvas, hasNavigationBar)
	}
	
	class func hide() {
		self.sharedInstance.hideActivityIndicator()
	}
	
	func showActivityIndicator(canvas: UIView, _ hasNavigationBar: Bool) {
		
		self.isVisible = true
		
		let window = UIApplication.sharedApplication().windows.first!
		
		self.activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
		self.activityIndicator.frame = canvas.bounds
		self.activityIndicator.backgroundColor = UIColor.clearColor()
		self.activityIndicator.center = CGPointMake(window.bounds.size.width / 2.0, (window.bounds.size.height / 2.0) - (hasNavigationBar ? kNavigationBarHeight : 0));
		self.activityIndicator.startAnimating()
		
		self.activityIndicator.activityIndicatorViewStyle = .Gray
		self.activityIndicator.startAnimating()
		
		canvas.addSubview(self.activityIndicator)
	}
	
	func hideActivityIndicator() {
		
		UIView.animateWithDuration(0.15, delay: 0, options: (UIViewAnimationOptions.CurveEaseIn), animations: { () -> Void in
			self.alpha = 0
			}) { (finished) -> Void in
			self.activityIndicator.removeFromSuperview()
			
			self.isVisible = false;
		}
	}
}