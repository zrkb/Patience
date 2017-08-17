//
//  Patience.swift
//  Patience
//
//  Created by Felix Ayala on 12/18/15.
//  Copyright © 2016 Pandorga. All rights reserved.
//

import UIKit

public class Patience {
	
	// MARK: - Properties
	let backgroundView = UIView()
	let activityIndicator = UIActivityIndicatorView()
	var isVisible = false
	private let kNavigationBarHeight: CGFloat = 44.0
	
	/**
		This prevent instance initialization.
	*/
	private init() {}
	
	/**
		Shared Instance used to call methods without initialization.
	
		- returns: A shared instance from `Patience` class
	*/
	public class func sharedManager() -> Patience {
		
		struct Static {
			static let Manager = Patience()
		}
		
		return Static.Manager
	}
	
	public class func show(_ canvas: UIView? = nil) {
		if let canvas = canvas {
			Patience.sharedManager().showInView(canvas)
		} else if let window: UIWindow = UIApplication.shared.keyWindow {
			Patience.sharedManager().showInView(window)
		} else {
			print("We can't show the loader because there is no view.")
		}
	}
	
	public class func hide() {
		Patience.sharedManager().hideActivityIndicator()
	}
	
	func showInView(_ canvas: UIView) {
		
		isVisible = true
		
		backgroundView.frame = canvas.frame
		backgroundView.backgroundColor = UIColor(white: 1.0, alpha: 0.9)
		backgroundView.alpha = 0
		
		activityIndicator.activityIndicatorViewStyle = .gray
		activityIndicator.frame = canvas.bounds
		activityIndicator.backgroundColor = UIColor.clear
		activityIndicator.activityIndicatorViewStyle = .gray
		activityIndicator.startAnimating()
		activityIndicator.center = CGPoint(x: backgroundView.frame.width / 2.0, y: (backgroundView.frame.height / 2.0))
		
		backgroundView.addSubview(activityIndicator)
		canvas.addSubview(backgroundView)
		
		UIView.animate(withDuration: 0.2, delay: 0, options: (.curveEaseIn), animations: {
			self.backgroundView.alpha = 1
		}, completion: nil)
	}
	
	func hideActivityIndicator() {
		
		UIView.animate(withDuration: 0.15, delay: 0, options: (.curveEaseIn), animations: { () -> Void in
			self.backgroundView.alpha = 0
		}) { (_) -> Void in
			self.backgroundView.removeFromSuperview()
			self.isVisible = false
		}
	}
}
