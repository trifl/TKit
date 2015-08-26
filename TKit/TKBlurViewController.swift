import UIKit

public class TKBlurViewController: UIViewController {
  public let rootViewController: UIViewController
  private let blurView: UIVisualEffectView = {
    let blurEffect = UIBlurEffect(style: .Dark)
    let blurView = UIVisualEffectView(effect: blurEffect)
    return blurView
    }()
  
  init(rootViewController: UIViewController) {
    self.rootViewController = rootViewController
    super.init(nibName: nil, bundle: nil)
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    blurView.alpha = 0
    blurView.frame = view.bounds
    blurView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
    view.addSubview(blurView)
    
    addChildViewController(rootViewController)
    view.addSubview(rootViewController.view)
    rootViewController.didMoveToParentViewController(self)
    
    rootViewController.view.alpha = 0
    rootViewController.view.frame = view.bounds
    rootViewController.view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
  }
  
  public func present(parentViewController: UIViewController) {
    parentViewController.addChildViewController(self)
    parentViewController.view.addSubview(view)
    didMoveToParentViewController(parentViewController)
    
    view.frame = parentViewController.view.bounds
    view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
    
    UIView.animateWithDuration(0.2, animations: {
      self.blurView.alpha = 1
      self.rootViewController.view.alpha = 1
      }) { completed in
    }
  }
  
  public func dismiss(completion: ((Bool) -> Void)? = nil) {
    let theCompletion = completion
    willMoveToParentViewController(nil)
    UIView.animateWithDuration(0.2, animations: {
      self.blurView.alpha = 0
      self.rootViewController.view.alpha = 0
      }, completion: { completed in
        self.removeFromParentViewController()
        self.view.removeFromSuperview()
        theCompletion?(completed)
    })
  }
}
