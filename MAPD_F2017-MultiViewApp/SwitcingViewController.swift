

import UIKit

class SwitchingViewController: UIViewController {
    
    //Private Instance Variables
    
    private var _blueViewController:BlueViewController!
    private var _yellowViewController:YellowViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue") as! BlueViewController
        _blueViewController.view.frame = view.frame
        switchViewController(from: nil, to: _blueViewController)
    }
    
    //triggers when the switch button on toolbar is pressed.
    @IBAction func switchViews(sender: UIBarButtonItem) {
        //instantiate the new view cintroller object
        if _yellowViewController?.view.superview == nil {
            if _yellowViewController == nil{
                _yellowViewController = storyboard?.instantiateViewController(withIdentifier: "Yellow") as! YellowViewController
            }
        }
        else if _blueViewController?.view.superview == nil {
            if _blueViewController == nil{
                    _blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue") as! BlueViewController
            }
        }
        
        //clean up current view controller and attach the new one.
        if _blueViewController != nil && _blueViewController!.view.superview != nil{
            _yellowViewController.view.frame = view.frame
            switchViewController(from: _blueViewController, to: _yellowViewController)
        }else {
        _blueViewController.view.frame = view.frame
            switchViewController(from: _yellowViewController, to: _blueViewController)
        
        }
        
    }
    
    private func switchViewController(from fromVC:UIViewController?, to toVC:UIViewController?) {
        
        //cleans up current view controller
        if fromVC != nil {
            fromVC!.willMove(toParentViewController: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParentViewController()
        }
        
        if toVC != nil {
                self.addChildViewController(toVC!)
                self.view.insertSubview(toVC!.view, at: 0)
                toVC!.didMove(toParentViewController: self)
        }
    }
}
