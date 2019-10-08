//
// Created by XavierNiu on 2019/10/6.
// Copyright (c) 2019 xav1er. All rights reserved.
//

import Cocoa

class LoginWindowController: NSWindowController, NSWindowDelegate {

    lazy var windowBorderless: WindowBorderless = {
        let frame = CGRect(x: 0, y: 0, width: 400, height: 280)
        let style: NSWindow.StyleMask = [NSWindow.StyleMask.fullSizeContentView,
                                         NSWindow.StyleMask.titled,
                                         NSWindow.StyleMask.closable,
                                         NSWindow.StyleMask.miniaturizable]
        // 创建window
        let window = WindowBorderless(contentRect: frame, styleMask: style, backing: .buffered, defer: false)
        window.windowController = self
        window.delegate = self
        return window
    }()

    override init(window: NSWindow?) {
        super.init(window: window)
        self.window = windowBorderless
        self.contentViewController = LoginViewController()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func windowWillClose(_ notification: Notification) {
        self.contentViewController = nil
        self.window = nil
    }
}
