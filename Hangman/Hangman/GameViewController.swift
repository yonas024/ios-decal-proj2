//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var text: UILabel!

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var guessedLetters: UILabel!
    
    var characters: [String] = []
    
    var dashesAndCorrectLetters: [String] = []
    
    var buttons: [UIButton] = []
    
    var resultString = ""
    
    var characterString = ""
    
    var errorCount = 1
    
    var phrase = ""
    

    @IBAction func restart(sender: AnyObject) {
        super.viewDidLoad()
        
        characters.removeAll()
        dashesAndCorrectLetters.removeAll()
        resultString = ""
        characterString = ""
        guessedLetters.text = "Guessed:  "
        errorCount = 1
        for button in buttons {
            button.enabled = true
        }
        for char in phrase.characters {
            if char == " " {
                dashesAndCorrectLetters.append("  ")
                characters.append("  ")
            } else {
                dashesAndCorrectLetters.append("_ ")
                characters.append("\(char)")
            }
        }
        for i in dashesAndCorrectLetters {
            resultString += i
        }
        
        text.text = resultString
        image.image = UIImage(named:"hangman1.gif")
    }
    
    @IBAction func newGame(sender: AnyObject) {
        super.viewDidLoad()
        
        characters.removeAll()
        dashesAndCorrectLetters.removeAll()
        resultString = ""
        characterString = ""
        guessedLetters.text = "Guessed:  "
        errorCount = 1
        for button in buttons {
            button.enabled = true
        }
        let hangmanPhrases = HangmanPhrases()
        phrase = hangmanPhrases.getRandomPhrase()
        for char in phrase.characters {
            if char == " " {
                dashesAndCorrectLetters.append("  ")
                characters.append("  ")
            } else {
                dashesAndCorrectLetters.append("_ ")
                characters.append("\(char)")
            }
        }
        for i in dashesAndCorrectLetters {
            resultString += i
        }
        text.text = resultString
        image.image = UIImage(named:"hangman1.gif")
        print(characters)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let hangmanPhrases = HangmanPhrases()
        phrase = hangmanPhrases.getRandomPhrase()
        for char in phrase.characters {
            if char == " " {
                dashesAndCorrectLetters.append("  ")
                characters.append("  ")
            } else {
                dashesAndCorrectLetters.append("_ ")
                characters.append("\(char)")
            }
        }
        for i in dashesAndCorrectLetters {
            resultString += i
        }
        text.text = resultString
        image.image = UIImage(named:"hangman1.gif")
        print(characters)
        text.reloadInputViews()
        //print(phrase)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func letterA(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterB(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterC(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterD(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterE(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterF(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterG(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterH(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterI(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterJ(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterK(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterL(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterM(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterN(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterO(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterP(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterQ(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterR(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterS(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterT(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterU(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterV(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterW(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterX(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterY(sender: UIButton) {
        guess(sender)
    }
    @IBAction func letterZ(sender: UIButton) {
        guess(sender)
    }
    
    func guess(button: UIButton) {
        let letter = button.titleLabel!.text
        var count = 0
        for var char = 0; char < characters.count; char+=1 {
            if characters[char] == letter {
                dashesAndCorrectLetters[char] = letter!
                count+=1
            }
        }
        resultString = ""
        for i in dashesAndCorrectLetters {
            resultString += i
        }
        characterString = ""
        for i in characters {
            characterString += i
        }
        if count >= 1 {
            button.titleLabel?.textColor = UIColor.greenColor()
        } else {
            button.titleLabel?.textColor = UIColor.redColor()
            errorCount+=1
            image.image = UIImage(named:"hangman\(errorCount).gif")
        }
        guessedLetters.text! += letter! + "  "
        button.enabled = false
        buttons.append(button)
        text.text = resultString
        print("Resultstring: " + resultString)
        print("Phrase:" + characterString)
        if resultString == characterString{
            let alertController = UIAlertController(title: "Hello Player", message:
                "Congrats! You Win!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Restart", style: UIAlertActionStyle.Default,handler: restart))
            alertController.addAction(UIAlertAction(title: "New Game", style: UIAlertActionStyle.Default,handler: newGame))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        if errorCount == 7 {
            let alertController = UIAlertController(title: "Hello Player", message:
                "You have Lost!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Restart", style: UIAlertActionStyle.Default,handler: restart))
            alertController.addAction(UIAlertAction(title: "New Game", style: UIAlertActionStyle.Default,handler: newGame))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
