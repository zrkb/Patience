//
//  Patience.swift
//  Patience
//
//  Created by Felix Ayala on 12/18/15.
//  Copyright © 2015 Pandorga. All rights reserved.
//

import UIKit

public class Patience:UIView {
	
	class func sharedManager() -> Patience {
		
		struct Static {
			static let Manager = Patience()
		}
		
		return Static.Manager
	}
	
	public let activityIndicator = UIActivityIndicatorView()
	
	public var isVisible = false
	
	private let kNavigationBarHeight:CGFloat = 44.0
	
	public class func show(canvas: UIView, _ hasNavigationBar: Bool = true) {
		Patience.sharedManager().showActivityIndicator(canvas, hasNavigationBar)
	}
	
	public class func hide() {
		Patience.sharedManager().hideActivityIndicator()
	}
	
	func showActivityIndicator(canvas: UIView, _ hasNavigationBar: Bool = true) {
		
		isVisible = true
		
		let window = UIApplication.sharedApplication().windows.first!
		
		activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
		activityIndicator.frame = canvas.bounds
		activityIndicator.backgroundColor = UIColor.clearColor()
		activityIndicator.center = CGPointMake(window.bounds.size.width / 2.0, (window.bounds.size.height / 2.0) - (hasNavigationBar ? kNavigationBarHeight : 0));
		activityIndicator.startAnimating()
		
		activityIndicator.activityIndicatorViewStyle = .Gray
		activityIndicator.startAnimating()
		
		canvas.addSubview(activityIndicator)
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