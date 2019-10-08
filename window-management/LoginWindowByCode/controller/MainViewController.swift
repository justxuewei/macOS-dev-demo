//
// Created by XavierNiu on 2019/10/8.
// Copyright (c) 2019 xav1er. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {

    override func loadView() {
        let frame = CGRect(x: 0, y: 0, width: 480, height: 270)
        let v = NSView(frame: frame)
        self.view = v
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        setupAutoLayout()
    }

    override func viewDidAppear() {
        super.viewDidAppear()
        self.view.window?.isRestorable = true
        self.view.window?.center()
    }

    // MARK: - UI

    lazy var label: NSTextField = {
        let l = NSTextField(labelWithString: "Welcome to my first app created by code totally.")
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    func setupAutoLayout() {
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }

    func addSubview() {
        self.view.addSubview(label)
    }

}
