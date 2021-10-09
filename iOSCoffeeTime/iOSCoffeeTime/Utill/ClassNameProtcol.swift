//
//  ClassNameProtcol.swift
//  Form
//
//  Created by 崎原邦達 on 2021/08/25.
//

import UIKit

public protocol ClassNameProtcol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtcol {
    static var className: String {
        String(describing: self)
    }

    var className: String {
        Self.className
    }
}

extension NSObject: ClassNameProtcol {}
