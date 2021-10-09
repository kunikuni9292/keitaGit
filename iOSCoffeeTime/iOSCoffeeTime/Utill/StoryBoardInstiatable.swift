//
//  StoryBoardInstiatable.swift
//  Form
//
//  Created by 崎原邦達 on 2021/08/25.
//

import UIKit

public protocol StoryBoardInstiatable {
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle { get }
    static var instantiateType: StoryBoardInstantiateType { get }
}

public extension StoryBoardInstiatable where Self: NSObject {
    static var storyboardName: String {
        className
    }

    static var storyboardBundle: Bundle {
        Bundle(for: self)
    }
    
    static var storyboard: UIStoryboard {
        UIStoryboard(name: storyboardName, bundle: storyboardBundle)
    }
    
    static var instantiateType: StoryBoardInstantiateType {
        .identifier(className)
    }
}

public extension StoryBoardInstiatable where Self: UIViewController {
    static func instantiate() -> Self {
        switch instantiateType {
        case .initial:
            guard let instance = storyboard.instantiateInitialViewController() as? Self else { fatalError() }
            return instance
        case .identifier(let identifier):
            guard let instance = storyboard.instantiateViewController(withIdentifier: identifier) as? Self else { fatalError() }
            return instance
        }
    }
}
