//: Playground - noun: a place where people can play

import UIKit

struct Character {
    var name : String
    var life : Int
    
    /*
    returns random number between 0-2
    0 - good behavior
    1- neutral behavior
    2- bad behavior
*/
    var niceLevel: Int {
        get{
            return Int(arc4random_uniform(3))
        }
    }
    
    var attack : Int {
        get{
            return Int(arc4random_uniform(101))
        }
    }
    
    init(name: String) {
        self.name = name
        self.life = Int(arc4random_uniform(101))
    }
}

class Story {
    var mainCharacter : Character
    var enemyName : String = "Charles"
    var loversName : String
    var wonFight : Bool = false
    
    init(mainCharacter: String, loversName: String) {
        self.mainCharacter = Character(name: mainCharacter)
        self.loversName = loversName
    }
    
    func run() {
        //place all of our methods to run this story
        sceneOne()
        sceneTwo()
        sceneThree()
        sceneFour()
        finalScene()
    }
    
    func sceneOne() {
        print("BZZZT!! Your alarm clock buzzes inches from your face. The red blinker shows 11:00am. \"CRAP\" You yelp as you burst out of bed. You're late again. You meant to set the timer for earlier. You put on the jeans you had on yesterday and run out of your house.")
    }
    
    func sceneTwo() {
        print("\nYou hop on your board and skate to school. You wonder if \(loversName) is late to school also. She's this cute red head girl from math class. She lives a couple of houses down and you've always wanted to ask her out but sheepishly chicken out every time. ")
    }
    
    func sceneThree() {
        print("\nYou peer over to her house and see her being pushed around by \(enemyName). He is this huge kid who's a bad ass because he dropped out of school. Now he just hangs around during school hours.\n\"Hurry up, I want your lunch money!\" He exclaims towering over the small girl. She notices you out of the corner of her eyes. Well you always wanted to show her what you're made of. Will you help? \n\(getDecision(mainCharacter.niceLevel))")
        
    }
    
    func sceneFour() {
        print("\nAs you sit in your final class bored, you notice \(enemyName) is pacing outside of the door waiting for school to let out. As soon as the bell rings, you make a break for it in the crowd. You think you lost \(enemyName) when \"BAM\" \(enemyName) slaps the shit out of you right in front of \(loversName). Knowing you have to fight you rush up to hit \(enemyName)")
        
        startFight(enemyName)
    }
    
    func finalScene() {
        var ending = ""
        
        if wonFight {
            ending = "\n\(enemyName) lays on the floor like a scrub as you \(loversName) runs up and kisses you"
        } else {
            ending = "\nYou awake to see \(loversName) staring at you with dissapointment. She realizes she doesnt like guys that cant fight and starts to date \(enemyName)"
        }
        
        print(ending)
    }
    
    func startFight(enemyName: String) {
        var fighting : Bool = true
        var enemy = Character(name: enemyName)
        var damage : Int
        
        repeat {
            damage = mainCharacter.attack
            enemy.life = enemy.life - damage
            print("You hit \(enemy.name) with \(damage) damage")
            
        if enemy.life <= 0 {
            //execute code only if condition is true
            fighting = false
            wonFight = true
            print("\(enemyName) falls to the floor after that last punch lands.")
        } else {
            damage = enemy.attack
            mainCharacter.life -= damage
            print("\(enemy.name) hits you for \(damage)")
            }
        
        if mainCharacter.life <= 0 {
            fighting = false
            wonFight = false
            print("You feel that hit land so hard you dream of blue skys")
            }
        } while fighting
    }
    
    func getDecision(decision: Int) -> String {
        var response : String
        
        switch decision {
        case 0:
            response = "\nYou decide she's not your problem and walk away. Not like she ever paid you any attention. Chris rides this really cool bmx bike that you grab with all his stuff and leave."
        case 1:
            response = "\nYou decide she's not your problem. You skate on and act like you didn't see anything. You probably just ruined all your chances of getting with her."
        default:
            response = "\nYou grab the biggest rock you can find and and yell over to them. \"Pick on someone your own size Moron.\" \"Stay out of this,it's none of your business \(mainCharacter.name)\" \"\(loversName) is my business\" You cock your arm back as if you're going to beam the rock at his freckly face. He buys into the bluff and backs off. \"This isn't over. \"He says with a menacing growl. He gets on his bike and cycles away. \"Thanks! \" emily proclaims as she enbraces you. This is almost worth it you think to yourself, but you know Chris is going to come back and make you pay."
            
        }
        
        return response
    }
}

var myStory = Story(mainCharacter: "Bryan", loversName: "Patricia")
myStory.run()










