//
//  SearchWebViewController.swift
//  Music Player
//
//  Created by Takuya Okamoto on 2015/12/30.
//  Copyright © 2015年 Sem. All rights reserved.
//

import UIKit
import WebKit

class SearchWebViewController: UIViewController {
    
    let webView: YouTubeSearchWebView
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        self.webView = YouTubeSearchWebView()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        self.webView = YouTubeSearchWebView()
        super.init(coder: aDecoder)
        setup()
    }
    init() {
        self.webView = YouTubeSearchWebView()
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    private func setup() {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let tabBarHeight: CGFloat = tabBarController?.tabBar.frame.size.height ?? 0

        webView.frame = CGRect(
            x: 0,
            y: statusBarHeight,
            width: view.frame.width,
            height: view.frame.height - statusBarHeight - tabBarHeight
        )
        view.addSubview(webView)
        
        let req = NSURLRequest(URL: NSURL(string:"https://www.youtube.com/results?filters=playlist&search_query=playlist&lclk=playlist")!)
        webView.loadRequest(req)
    }
}