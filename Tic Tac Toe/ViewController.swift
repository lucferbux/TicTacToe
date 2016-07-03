//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by lucas fernández on 07/07/15.
//  Copyright (c) 2015 lucas fernández. All rights reserved.
//

import UIKit

var crossesWon = 0

var nougthsWon = 0

var tieGame = 0


class ViewController: UIViewController {
    
    
    
    
    var activePlayer = 1 //1 = cross, 2 = noughts
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    var gameActive = true
    
    var winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    
    
    @IBOutlet var gameOverLabel: UILabel!
    
    
    @IBOutlet var playAgain: UIButton!
    
    @IBOutlet var button: UIButton!
    
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        
        activePlayer = 1 //1 = cross, 2 = noughts
        
        gameState = [0,0,0,0,0,0,0,0,0]
        
        gameActive = true
        
        var button : UIButton
        
        for i in 0 ..< 9 {
        
        button = view.viewWithTag(i) as! UIButton //al principio daba error porque al tener tag 0 podía confundirse con los demás botones, así que hay que asignar tags a los demás elementos
            
        
        button.setImage(nil, forState: .Normal) //convierte el boton a nada
        
        }
        
        gameOverLabel.hidden = true
        playAgain.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        
        playAgain.center = CGPointMake(playAgain.center.x - 400, playAgain.center.y)
        
        
    }
    
    @IBAction func buttonPress(sender: AnyObject) {
        
        if gameActive{
            
            if gameState[sender.tag] == 0{
                
                var image = UIImage() //crea variable con uimage
                
                gameState[sender.tag] = activePlayer
                
                if activePlayer == 1{
                    
                    image = UIImage(named: "cross")!
                    
                    activePlayer = 2
                    
                    
                } else {
                    
                    image = UIImage(named: "nought")!
                    
                    activePlayer = 1
                    
                }
                
                sender.setImage(image, forState: .Normal) //el estado son los distintos estados que tienen los botones //el sender es el objeto que ha enviado la acción, acabamos de meter esa función a varios botones, y para que cambie el que nosotros queremos tenemos que poner el nombre del sender
                
                var tie = 0
                for combination in winningCombinations{
                    
                    if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{ // comprobación de todas las combinaciones posibles
                        
                        
                        
                        gameOverLabel.backgroundColor = UIColor(red: (178/255.0), green: (251/255.0), blue: (167/255.0), alpha: 0.8)
                        
                        if gameState[combination[0]] == 1{
                            
                            gameOverLabel.text = "Crosses Has Won!"
                            crossesWon += 1
                            
                            
                        }else{
                            
                            gameOverLabel.text = "Noughts Has Won!"
                            nougthsWon += 1
                        }
                        
                        gameOverLabel.hidden = false
                        playAgain.hidden = false
                        
                        UIView.animateWithDuration(0.5, animations: { () -> Void in
                            
                            self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
                            
                            self.playAgain.center = CGPointMake(self.playAgain.center.x + 400, self.playAgain.center.y)
                            
                        })
                        
                        gameActive = false
                        
                    }
                    
                }
                
                for cell in gameState{
                   
                    if cell == 0{
                        tie += 1
                    }
                    
                    
                }
                
                if tie == 0 && gameActive{
                    
                    gameActive = false
                    
                    gameOverLabel.alpha = 1
                    
                    gameOverLabel.backgroundColor = UIColor(red: (255/255.0), green: (232/255.0), blue: (124/255.0), alpha: 0.8)
                    
                    gameOverLabel.text = "Tie!"
                    tieGame += 1
                    
                    gameOverLabel.hidden = false
                    playAgain.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        
                        self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
                        
                        self.playAgain.center = CGPointMake(self.playAgain.center.x + 400, self.playAgain.center.y)
                        
                    })
                    
                }
                
            }
            
        }
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UIApplication.sharedApplication().statusBarHidden = true //para ocultar la barra de arriba, también hay que modificar la info plist con View controller-based status bar appearance
        
        gameOverLabel.hidden = true
        playAgain.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        
        playAgain.center = CGPointMake(playAgain.center.x - 400, playAgain.center.y)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() { //cuando las cosas se han crado pero no aparecen en pantalla
     
        
    }

}

