//: Playground - noun: a place where people can play

import UIKit
/*
 Write a struct named Circle.
 Give you circle a property named “radius” with the type double.
 Use a property observer to insure that the radius has a minimum value of 0.
 Create calculated properties for “area” and “circumference”.
 Create an initializer that sets the radius to 0, and another initializer that accepts a single parameter named radius.
 */

struct Circle{
    var radius : Double = 0.0 {
        //willSet會在設置新的值之前被呼叫，didSet在新的值被設置之後立即呼叫，
        //willSet觀察器會將新的屬性值作為固定參數傳入，在willSet的實作程式碼中可以為這個參數指定一個名稱。
        
        //Use a property observer to insure that the radius has a minimum value of 0.
        //property observier -> willset & didset
        willSet(newRadius){
            if radius < 0{
                print("radius cannot be \(newRadius)")
            }
        }
        didSet(oldRadius){
            if radius < 0{
                radius = 0
            }
            print("radius: \(radius)")
        }
    }
    //Create calculated properties for “area” and “circumference”.
    func area() -> Double {
        return pow(radius,2) * Double.pi
    }
    
    func circumference() -> Double {
        return 2 * Double.pi * radius
    }
    
    init(){
        radius = 0
    }
    
    init(radius : Double) {
        self.radius = radius
    }
}
/*
 Write a class named CircleCollection.
 It should have a private property of type [Circle].  An array of circles.
 It should have a method named add(circle: Circle), that adds a circle to the array.
 It should have a calculated property named “count” that returns the size of the circle array.
 It should have a method named removeCirclesWithRadiiLargerThan(min: Double, butSmallerThan: Double). The method should remove any circles that have a radius larger than the minimum requirement, and smaller than the max requirement.

 */
class CircleCollection{
    //It should have a private property of type [Circle].  An array of circles.
    private var Circles: [Circle] = []
    //It should have a calculated property named “count” that returns the size of the circle array.
    var count = 0
    
    //It should have a method named add(circle: Circle), that adds a circle to the array.
    func add(circle : Circle){
        Circles.append(circle)
        count += 1
    }
    //It should have a method named removeCirclesWithRadiiLargerThan(min: Double, butSmallerThan: Double). The method should remove any circles that have a radius larger than the minimum requirement, and smaller than the max requirement.
    func removeCirclesWithRadiiLargerThan(min: Double,butSmallerThan: Double){
        for i in 0...count{
            if Circles[i].radius > min || Circles[i].radius < butSmallerThan{
                Circles.remove(at: i)
            }
        }
    }
    /*
     ToDoItem
     Write a class named ToDoItem, that might be used in an app that keeps a list tasks that the user wants to do.
     Give the class a String property named “task”
     Give the class a Int property named “priority”. Use an observer to insure that the value is in the range of  0 to 10.
     Give the class an optional property named “dueDate”. It’s data type should be an NSDate optional.
     Give the class an init method that accepts three arguments, one for each property
     Give the class a method named fullDescription() that returns a string with the task, priority, and the due date if there is one. The format of this string is up to you. Anything that includes the information is file. You should conditionally unwrap the date, to form appropriate strings for items that have dates, and for items that do not.

     */
}

class ToDoItem{
    //Give the class a String property named “task”
    var task: String = ""
    var priority: Int = 0{
        //Give the class a Int property named “priority”. Use an observer to insure that the value is in the range of  0 to 10.b
        willSet(newPriority){
            print("Priority ranged in 0 - 10")
        }
        didSet(oldPriority){
            if priority < 0{
                priority = 0
            }
            else if priority > 10{
                priority = 10
            }
        }
    }
    
    var dueDate: NSDate?
    
    //constructor
    init(task: String, priority: Int, dueDate: NSDate?) {
        self.task = task
        self.priority = priority
        self.dueDate = dueDate
    }
    
    func fullDescription() -> (String, Int, NSDate?) {
        if dueDate == nil{
            return (task, priority, nil)
        }
        else{
            return (task,priority,dueDate!)
        }
    }
    /*
     AnnotatedToDoItem
     Write a class named AnnotatedToDoItem that is a subclass of ToDoItem, but adds an additional property.
     The additional property should be named “note”, and it should be a String optional
     Write an init method that accepts four arguments. The three in ToDoItem, and the additional note property.
     Override the fullDescription method so that it includes the note if there is one.
     */
    class AnnotatedToDoItem : ToDoItem{
        var note : String?
        init(task: String, priority: Int, dueDate: NSDate?, note : String?){
            self.note = note
            super.init(task: task, priority: priority, dueDate: dueDate)
        }
        
        func fullDescription() -> (String, Int, NSDate?, String?) {
            if dueDate == nil && note == nil {
                return (task, priority, nil, nil)
            }else if dueDate != nil && note == nil{
                return (task, priority, dueDate!, nil)
            }else if dueDate == nil && note != nil{
                return (task, priority, nil, note!)
            }else {
                return (task, priority, dueDate, note!)
            }
        }
    }
}


