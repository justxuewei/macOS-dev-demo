//
// Created by XavierNiu on 2019/10/6.
// Copyright (c) 2019 xav1er. All rights reserved.
//

import Cocoa

class LoginViewController: NSViewController {

    override func loadView() {
        let frame = CGRect(x: 0, y: 0, width: 230, height: 270)
        let view = NSView(frame: frame)
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupAutoLayout()
    }

    override func viewDidAppear() {
        super.viewDidAppear()
        self.view.window?.center()
    }

    // MARK: - UI

    lazy var imageView: NSImageView = {
        let imageView = NSImageView()
        imageView.image = NSImage(named: "ic_face")
        imageView.imageScaling = .scaleProportionallyUpOrDown
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var usernameField: NSTextField = {
        let f = NSTextField()
        f.placeholderString = "username"
        f.translatesAutoresizingMaskIntoConstraints = false
        return f
    }()

    lazy var passwordField: NSSecureTextField = {
        let f = NSSecureTextField()
        f.placeholderString = "password"
        f.translatesAutoresizingMaskIntoConstraints = false
        return f
    }()

    lazy var loginButton: NSButton = {
        let b = NSButton()
        b.bezelStyle = .rounded
        b.setButtonType(.momentaryPushIn)
        b.title = "Login"
        b.translatesAutoresizingMaskIntoConstraints = false
        b.target = self
        b.action = #selector(self.loginAction(_:))
        return b
    }()

    lazy var inputStackView: NSStackView = {
        let sv = NSStackView()
        sv.orientation = .vertical
        sv.distribution = .equalSpacing
        sv.alignment = .leading
        sv.spacing = 10.0
        sv.translatesAutoresizingMaskIntoConstraints = false

        sv.addArrangedSubview(usernameField)
        sv.addArrangedSubview(passwordField)
        return sv
    }()

    func addSubviews() {
        view.addSubview(imageView)
        view.addSubview(inputStackView)
        view.addSubview(loginButton)
    }

    func setupAutoLayout() {
        // logo
        imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 36.0).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 78.0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 78.0).isActive = true
        // input stack view
        inputStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 34.0).isActive = true
        inputStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25.0).isActive = true
        inputStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25.0).isActive = true
        // login button
        loginButton.topAnchor.constraint(equalTo: inputStackView.bottomAnchor, constant: 27).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }

    // MARK: - Actions

    @objc func loginAction(_ sender: NSButton) {
        NSLog("Login Successful...")
        NotificationCenter.default.post(name: Notification.Name.loginOK, object: nil)
        self.view.window?.close()
    }

}

extension Notification.Name {
    // loginOK
    static let loginOK = Notification.Name("loginOK")
}
