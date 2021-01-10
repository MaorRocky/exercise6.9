//
//  ViewController.swift
//  exercise6V2
//
//  Created by Scores_Main_User on 1/10/21.
//

import UIKit

class ViewController: UIViewController
{


    var myView: UIView = UIView()


    override func viewDidLoad()
    {


        super.viewDidLoad()


        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .red
        self.view.addSubview(myView)


        // constraints
        myView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        myView.widthAnchor.constraint(equalToConstant: 50).isActive = true

        myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        myView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true


        DispatchQueue.main.asyncAfter(deadline: .now() + 2)
        { [self] in

            myView.changeColor(duration: 1,options: .curveEaseOut)
            myView.scale(duration: 2, options: .curveEaseIn)
            myView.rotate(duration: 2, options: .curveLinear)
            myView.changeOpacity(duration: 1, options: .curveEaseOut)
            Timer.scheduledTimer(withTimeInterval: 8.0, repeats: false)
            { timer in
                reset()
            }
        }
    }


    func reset()
    {

        for constraint in myView.constraints
        {
            constraint.isActive = false
        }

        self.myView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.myView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.myView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.myView.backgroundColor = .red
        self.myView.transform = CGAffineTransform(rotationAngle: 0)
        self.myView.alpha = 1
    }

}


extension UIView
{


    func changeColor( duration: TimeInterval, delay: Double = 0.0,
                     options: UIView.AnimationOptions)
    {
        UIView.animate(withDuration: duration, delay: delay, options: options, animations: {
            self.backgroundColor = .green
        }, completion: nil)
    }


    func rotate(duration: TimeInterval, delay: Double = 1.0, options: UIView.AnimationOptions)
    {
        UIView.animate(withDuration: duration, delay: delay, options: options)
        {
            self.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        }
    }


    func changeOpacity(duration: TimeInterval, delay: Double = 3.0, options: UIView.AnimationOptions, opacity: Double = 0.3) // 0.3 makes the change more visable than 0.5
    {
        UIView.animate(withDuration: duration, delay: delay, options: options)
        {
            self.alpha = CGFloat(opacity)
        }
    }


    func scale(duration: TimeInterval, delay: Double = 0.0,
               options: UIView.AnimationOptions)
    {

        for constraint in self.constraints
        {
            constraint.isActive = false
        }
        self.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.heightAnchor.constraint(equalToConstant: 100).isActive = true


    }

}

