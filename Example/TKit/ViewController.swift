import UIKit
import TK

class ViewController: UIViewController {
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    let view4 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view1.tk_size = CGSizeMake(50, 50)
        view1.backgroundColor = .redColor()
        view2.tk_size = CGSizeMake(50, 50)
        view2.backgroundColor = .greenColor()
        
        view3.tk_size = CGSizeMake(100, 100)
        view3.backgroundColor = .blueColor()
        
        view4.tk_size = CGSizeMake(50, 100)
        view4.backgroundColor = .grayColor()
        
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        view.addSubview(view4)

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view1.tk_top = 100
        view2.center.y = view1.center.y
        view3.center.y = view2.center.y
        view4.tk_bottom = view3.tk_bottom
        
        view.tk_layout(.Horizontal, items: [15, view1, 1.0, view2, 1.0, view3, 1.0, view4, 15])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

