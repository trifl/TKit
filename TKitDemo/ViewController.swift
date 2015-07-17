import UIKit
import TKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let soundManager = TKSoundManager.sharedInstance    
    soundManager.prepareSound(fileName: "test.wav")

    var view1 = UIView(frame: CGRectMake(0, 100, 25, 25))
    view1.backgroundColor = .greenColor()
    view.addSubview(view1)
    
    var view2 = UIView(frame: CGRectMake(0, 100, 50, 50))
    view2.backgroundColor = .redColor()
    view.addSubview(view2)
    
    var view3 = UIView(frame: CGRectMake(0, 100, 25, 25))
    view3.backgroundColor = .redColor()
    view.addSubview(view3)
    
    view.tk_layout(.Horizontal, items: [
      .Linear(15),
      .View(view1),
      .View(view2),
      .Relative(1),
      .View(view3),
      .Linear(15)
      ]
    )
        
    soundManager.playSound(fileName: "test.wav")
    soundManager.removeSound(fileName: "test.wav")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

