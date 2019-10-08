//
// Created by XavierNiu on 2019/10/8.
// Copyright (c) 2019 xav1er. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController, NSWindowDelegate {

    lazy var windowInstance: NSWindow = {
        let frame = CGRect(x: 0, y: 0, width: 480, height: 270)
        let styleMask: NSWindow.StyleMask = [NSWindow.StyleMask.titled,
                                             NSWindow.StyleMask.closable,
                                             NSWindow.StyleMask.resizable,
                                             NSWindow.StyleMask.miniaturizable]
        let window = NSWindow(contentRect: frame, styleMask: styleMask, backing: .buffered, defer: false)
        window.title = "Main Window"
        window.windowController = self
        window.delegate = self
        return window
    }()

    override init(window: NSWindow?) {
        super.init(window: window)
        self.window = windowInstance
        self.contentViewController = MainViewController()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func windowWillClose(_ notification: Notification) {
        self.contentViewController = nil
        self.window = nil
    }
}
