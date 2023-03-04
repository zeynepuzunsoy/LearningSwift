import UIKit

class ViewController: UIViewController {

    var score = 0
    var timer = Timer()
    var counter = 0
    var mickeyArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var mickey1: UIImageView!
    @IBOutlet weak var mickey2: UIImageView!
    @IBOutlet weak var mickey3: UIImageView!
    @IBOutlet weak var mickey4: UIImageView!
    @IBOutlet weak var mickey6: UIImageView!
    @IBOutlet weak var mickey5: UIImageView!
    @IBOutlet weak var mickey7: UIImageView!
    @IBOutlet weak var mickey8: UIImageView!
    @IBOutlet weak var mickey9: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score: \(score)"
        
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        
        
        
        mickey1.isUserInteractionEnabled = true
        mickey2.isUserInteractionEnabled = true
        mickey3.isUserInteractionEnabled = true
        mickey4.isUserInteractionEnabled = true
        mickey5.isUserInteractionEnabled = true
        mickey6.isUserInteractionEnabled = true
        mickey7.isUserInteractionEnabled = true
        mickey8.isUserInteractionEnabled = true
        mickey9.isUserInteractionEnabled = true
        
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        mickey1.addGestureRecognizer(recognizer1)
        mickey2.addGestureRecognizer(recognizer2)
        mickey3.addGestureRecognizer(recognizer3)
        mickey4.addGestureRecognizer(recognizer4)
        mickey5.addGestureRecognizer(recognizer5)
        mickey6.addGestureRecognizer(recognizer6)
        mickey7.addGestureRecognizer(recognizer7)
        mickey8.addGestureRecognizer(recognizer8)
        mickey9.addGestureRecognizer(recognizer9)
        
        mickeyArray = [mickey1,mickey2,mickey3,mickey4,mickey5,mickey6,mickey7,mickey8,mickey9]
        
        counter = 10
        timeLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.6 , target: self, selector: #selector(hideMickey), userInfo: nil, repeats: true)
        
       hideMickey()

    }
    
    @objc func hideMickey(){
        for mickey in mickeyArray{
            mickey.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(mickeyArray.count - 1)))
        mickeyArray[random].isHidden = false
    }

    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    
    @objc func countDown() {
        counter -= 1
        timeLabel.text = String(counter)
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            for mickey in mickeyArray{
                mickey.isHidden = true
            }
            
            
            if self.score > self.highScore{
                self.highScore = self.score
                highScoreLabel.text = "Highscore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore")
                
            }
            
            
            
            
            
            let alert = UIAlertController(title: "Time's Up", message: "Do you want to ply again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) {
                (UIAlertAction) in
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(self.hideMickey), userInfo: nil, repeats: true)
                
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true ,completion: nil)
            
        }
    }
}

