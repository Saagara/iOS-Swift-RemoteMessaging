import UIKit

class RemoteMessageViewController: UIViewController {
    let RemoteMessage = RemoteMessageManager()
    
    @IBOutlet weak var ButtonRemoteMessage: UIButton!
    
    @IBOutlet weak var ButtonClose: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let background = UIColor.blackColor()
        background.colorWithAlphaComponent(0.75)
        
        self.view.backgroundColor = background
        
        
        self.ButtonRemoteMessage.setBackgroundImage(RemoteMessage.RemoteImage, forState: .Normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ButtonRemoteMessageClicked(sender: UIButton) {
        
        RemoteMessage.OpenLink()
    }

    @IBAction func ButtonCloseClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
