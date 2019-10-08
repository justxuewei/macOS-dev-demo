//
// Created by XavierNiu on 2019/10/5.
// Copyright (c) 2019 xav1er. All rights reserved.
//

import Cocoa

class WindowBorderless: NSWindow {

    override init(contentRect: NSRect, styleMask style: StyleMask, backing backingStoreType: BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: style, backing: backingStoreType, defer: flag)

        self.titlebarAppearsTransparent = true
        self.titleVisibility = .hidden
        self.showsToolbarButton = false

        self.standardWindowButton(NSWindow.ButtonType.zoomButton)?.isHidden = true
    }

}
