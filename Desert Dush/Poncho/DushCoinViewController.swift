//
//  DushCoinViewController.swift
//  Desert Dush
//
//  Created by Vadim Brondz on 19.03.2024.
//

import UIKit
import WebKit
import SnapKit

class DushCoinViewController: UIViewController, WKNavigationDelegate  {
    
    let coin: URL
    
    // MARK: - UI
    
    lazy var mana: WKWebView = {
        let ededed = WKWebViewConfiguration()
        ededed.applicationNameForUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 16_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1"
        ededed.defaultWebpagePreferences.allowsContentJavaScript = true
        ededed.allowsPictureInPictureMediaPlayback = true
        ededed.allowsAirPlayForMediaPlayback = true
        ededed.allowsInlineMediaPlayback = true
        let pref = WKWebpagePreferences()
        pref.preferredContentMode = .mobile
        ededed.defaultWebpagePreferences = pref
        let webView = WKWebView(frame: .zero, configuration: ededed)
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadViewUI()
        load()
    }
    
    init(game: URL) {
        self.coin = game
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init() {
        let game = URL(string: "https://www.privacypolicies.com/live/cef25d4c-09a5-4e37-8a87-ea2f7daad96b")!
        self.init(game: game)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setupViews
    
    private func loadViewUI() {
        view.addSubview(mana)
        mana.load(URLRequest(url: coin))
        mana.allowsBackForwardNavigationGestures = true
        mana.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.right.left.bottom.equalToSuperview()
        }
    }
    
    private func save() {
        let cookieJar: HTTPCookieStorage = HTTPCookieStorage.shared
        if let cookies = cookieJar.cookies {
            let data: Data? = try? NSKeyedArchiver.archivedData(withRootObject: cookies, requiringSecureCoding: false)
            if let data = data {
                let userDefaults = UserDefaults.standard
                userDefaults.set(data, forKey: "cvcvcv")
            }
        }
    }
    
    func load() {
        let eqwqweeoeoeoeo: UserDefaults = UserDefaults.standard
        let data: Data? = eqwqweeoeoeoeo.object(forKey: "cvcvcv") as? Data
        if let cookie = data {
            let datas: NSArray? = try? NSKeyedUnarchiver.unarchivedObject(ofClass: NSArray.self, from: cookie)
            if let cookies = datas {
                for c in cookies {
                    if let cookieObject = c as? HTTPCookie {
                        HTTPCookieStorage.shared.setCookie(cookieObject)
                    }
                }
            }
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        save()
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DesertConstant.lastУРЛ = webView.url
    }
}

