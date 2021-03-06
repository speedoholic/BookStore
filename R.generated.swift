//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 6 colors.
  struct color {
    /// Color `barbiePink`.
    static let barbiePink = Rswift.ColorResource(bundle: R.hostingBundle, name: "barbiePink")
    /// Color `coral`.
    static let coral = Rswift.ColorResource(bundle: R.hostingBundle, name: "coral")
    /// Color `lightGold`.
    static let lightGold = Rswift.ColorResource(bundle: R.hostingBundle, name: "lightGold")
    /// Color `lightMustard`.
    static let lightMustard = Rswift.ColorResource(bundle: R.hostingBundle, name: "lightMustard")
    /// Color `paleGrey`.
    static let paleGrey = Rswift.ColorResource(bundle: R.hostingBundle, name: "paleGrey")
    /// Color `warmGrey`.
    static let warmGrey = Rswift.ColorResource(bundle: R.hostingBundle, name: "warmGrey")
    
    /// `UIColor(named: "barbiePink", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func barbiePink(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.barbiePink, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "coral", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func coral(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.coral, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "lightGold", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func lightGold(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.lightGold, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "lightMustard", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func lightMustard(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.lightMustard, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "paleGrey", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func paleGrey(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.paleGrey, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "warmGrey", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func warmGrey(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.warmGrey, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 1 files.
  struct file {
    /// Resource file `books.json`.
    static let booksJson = Rswift.FileResource(bundle: R.hostingBundle, name: "books", pathExtension: "json")
    
    /// `bundle.url(forResource: "books", withExtension: "json")`
    static func booksJson(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.booksJson
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 3 images.
  struct image {
    /// Image `bg`.
    static let bg = Rswift.ImageResource(bundle: R.hostingBundle, name: "bg")
    /// Image `idea`.
    static let idea = Rswift.ImageResource(bundle: R.hostingBundle, name: "idea")
    /// Image `menu`.
    static let menu = Rswift.ImageResource(bundle: R.hostingBundle, name: "menu")
    
    /// `UIImage(named: "bg", bundle: ..., traitCollection: ...)`
    static func bg(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.bg, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "idea", bundle: ..., traitCollection: ...)`
    static func idea(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.idea, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "menu", bundle: ..., traitCollection: ...)`
    static func menu(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.menu, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 1 nibs.
  struct nib {
    /// Nib `BookTableViewCell`.
    static let bookTableViewCell = _R.nib._BookTableViewCell()
    
    /// `UINib(name: "BookTableViewCell", in: bundle)`
    static func bookTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.bookTableViewCell)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `BookTableViewCell`.
    static let bookTableViewCell: Rswift.ReuseIdentifier<BookTableViewCell> = Rswift.ReuseIdentifier(identifier: "BookTableViewCell")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    struct _BookTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = BookTableViewCell
      
      let bundle = R.hostingBundle
      let identifier = "BookTableViewCell"
      let name = "BookTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> BookTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? BookTableViewCell
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
      try launchScreen.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if UIKit.UIImage(named: "bg") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'bg' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = LoginViewController
      
      let baseNavigationController = StoryboardViewControllerResource<UIKit.UINavigationController>(identifier: "BaseNavigationController")
      let booksTableViewController = StoryboardViewControllerResource<BooksTableViewController>(identifier: "BooksTableViewController")
      let bundle = R.hostingBundle
      let loginViewController = StoryboardViewControllerResource<LoginViewController>(identifier: "LoginViewController")
      let name = "Main"
      
      func baseNavigationController(_: Void = ()) -> UIKit.UINavigationController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: baseNavigationController)
      }
      
      func booksTableViewController(_: Void = ()) -> BooksTableViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: booksTableViewController)
      }
      
      func loginViewController(_: Void = ()) -> LoginViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: loginViewController)
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "menu") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'menu' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "idea") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'idea' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "bg") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'bg' is used in storyboard 'Main', but couldn't be loaded.") }
        if _R.storyboard.main().booksTableViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'booksTableViewController' could not be loaded from storyboard 'Main' as 'BooksTableViewController'.") }
        if _R.storyboard.main().baseNavigationController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'baseNavigationController' could not be loaded from storyboard 'Main' as 'UIKit.UINavigationController'.") }
        if _R.storyboard.main().loginViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'loginViewController' could not be loaded from storyboard 'Main' as 'LoginViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
