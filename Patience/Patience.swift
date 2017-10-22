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
	var isVisible = false
	private let kNavigationBarHeight: CGFloat = 44.0
	
	var spinnerView = Spinner()
	
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
		
		if isVisible {
			return
		}
		
		isVisible = true
		
		backgroundView.frame = canvas.frame
		backgroundView.backgroundColor = UIColor(white: 1.0, alpha: 0.9)
		backgroundView.alpha = 0
		
		let size: CGFloat = 40.0
		let pos = CGPoint(x: backgroundView.center.x - (size / 2.0), y: backgroundView.center.y - (size / 2.0))
		backgroundView.addSubview(spinnerView)
		spinnerView.frame = CGRect(x: pos.x, y: pos.y, width: size, height: size)

		spinnerView.circleLayer.lineWidth = 4.0
		spinnerView.circleLayer.strokeColor = UIColor(red: 0.351, green: 0.264, blue: 0.580, alpha: 1).cgColor
		spinnerView.beginRefreshing()
		
		backgroundView.addSubview(spinnerView)
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
			self.spinnerView.endRefreshing()
		}
	}
}
