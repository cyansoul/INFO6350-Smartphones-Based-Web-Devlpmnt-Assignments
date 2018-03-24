//
//  main.swift
//  Assignment4
//
//  Created by Tianyu Wang on 2/17/18.
//  Copyright © 2018 Tianyu Wang. All rights reserved.
//

import Foundation

class Customer{
    var Name:String = ""
    var Address:String = ""
    var IdNumber:String = ""
    var phoneNumber:Int = 0
    init(Name:String, Address:String, IdNumber:String, phoneNumber:Int){
        self.Name = Name
        self.Address = Address
        self.IdNumber = IdNumber
        self.phoneNumber = phoneNumber
    }
    init(){}
}

enum type{
    case Single
    case Double
}

class Room{
    var roomId:Int = roomCount
    var Name:String = ""
    var roomType:type = type.Single
    var price:Double = 0.0
    static var roomCount:Int = 1
    init(Name:String,roomType:type,price:Double){
        Room.roomCount += 1
        self.Name = Name
        self.roomType = roomType
        self.price = price
    }
    init(){
    }
}

var CustomerList: Array<Customer> = Array()
var RoomList: Array<Room> = Array()

class Booking {
    var bookingId:Int = bookingCount
    var fromDate:String = "2018-2-16"
    var toDate:String = "2018-2-16"
    var customer:Customer = CustomerList[0]
    var room:Room = RoomList[0]
    static var bookingCount:Int = 1
    init(fromDate:String,toDate:String, customer:Customer, room:Room){
        Booking.bookingCount += 1
        self.fromDate = fromDate
        self.toDate = toDate
        self.customer = customer
        self.room = room
    }
    init(){
    }
    
}
var BookingList : Array<Booking> = Array()

func AddCustomer(){
    let C = Customer()
    while(true){
        print("Name: ")
        guard let name:String = readLine(), !name.isEmpty else{
            print("Name cannot be empty!")
            continue
        }
        C.Name = name
        break
    }
    
    while(true){
        print("Address: ")
        guard let address:String = readLine(), !address.isEmpty else{
            print("Address cannot be empty!")
            continue
        }
        C.Address = address
        break
    }
    
    while(true){
        print("ID: ")
        guard let id:String = readLine(), !id.isEmpty else{
            print("ID number cannot be empty!")
            continue
        }
        C.IdNumber = id
        break
    }
    
    while(true){
        print("Phone Number: ")
        guard let number:String = readLine(), !number.isEmpty, Int(number) != nil else{
            print("Phone Number cannot be empty!")
            continue
        }
        C.phoneNumber = Int(number)!
        break
    }
    CustomerList.append(C)
    print("Customer created successfully!")
    var index:Int = 1
    for Customer in CustomerList{
        print("\(index).  Name: \(Customer.Name)  Address: \(Customer.Address)  ID: \(Customer.IdNumber)  Phone: \(Customer.phoneNumber)")
        index=index+1
    }
}


func CreateRoom(){
    let R = Room()
    while(true){
        print("Room Name: ")
        guard let name:String = readLine(), !name.isEmpty else{
            print("Room name cannot be empty!")
            continue
        }
        R.Name = name
        break
    }
    while(true){
        print("Price: ")
        guard let price:String = readLine(), !price.isEmpty, Double(price) != nil else{
            print("Price cannot be empty!")
            continue
        }
        R.price = Double(price)!
        break
    }
    while(true){
        print("Room Type: 1-Single, 2-Double")
        guard let roomType:String = readLine(), roomType=="1" || roomType=="2" else{
            print("Please enter a correct number!")
            continue
        }
        if(roomType=="1"){
            R.roomType = type.Single
        }else if(roomType == "2"){
            R.roomType = type.Double
        }
        break
    }
    
    RoomList.append(R)
    print("Room created successfully!")
    var index:Int = 1
    for Room in RoomList{
        print("ID: \(Room.roomId) \(Room.Name)   Price: \(Room.price)   Type: \(Room.roomType) ")
        index=index+1
    }
}

func DisplayRooms(){
    print("All Rooms: ")
    for Room in RoomList{
        print("ID: \(Room.roomId)   Name: \(Room.Name)   Price: \(Room.price)   Type: \(Room.roomType) ")
        for Booking in BookingList{
            if(Booking.room === Room){
                print("Date: \(Booking.fromDate)-\(Booking.toDate)  Customer: \(Booking.customer.Name)")
            }
        }
    }
}

func SearchRoom(id:Int) -> Room{
    var r: Room = Room()
    for Room in RoomList{
        if(Room.roomId == id){
            r = Room
        }
    }
    return r
}

func SearchCustomer(name:String) -> Customer {
    var c: Customer = Customer()
    for Customer in CustomerList{
        if(Customer.Name == name){
            c = Customer
        }
    }
    return c
}

func CreateBooking(){
    DisplayRooms()
    LabelCreateBooking: while(true){
        var custName:String = "Jack"
        var startDate = "2018-2-15"
        var endDate = "2018-2-15"
        var index:Int = 1
        
        LabelId: while(true){
            print("Room ID: ")
            guard let id:String = readLine(), !id.isEmpty else{
                print("Room name cannot be empty!")
                continue
            }
            var flag = 0
            for Room in RoomList{
                if(id == String(Room.roomId)){
                    flag = 1
                }
            }
            if(flag == 0){
                print("This room doesn't exist!")
                continue
            }else{
                index = Int(id)!
                break LabelId
            }
            
        }
        
        LabelFrom: while(true){
            print("Start Date: ")
            guard let sDate:String = readLine(), !sDate.isEmpty else{
                print("Start date cannot be empty!")
                continue
            }
            startDate = sDate
            break
        }
        
        LabelTo: while(true){
            print("End Date: ")
            guard let eDate:String = readLine(), !eDate.isEmpty else{
                print("End date cannot be empty!")
                continue
            }
            endDate = eDate
            break
        }
        
        LabelCustomer: while(true){
            print("All customers: ")
            var index:Int = 1
            for Customer in CustomerList{
                print("\(index).  Name: \(Customer.Name)  Address: \(Customer.Address)  ID: \(Customer.IdNumber)  Phone: \(Customer.phoneNumber)")
                index = index + 1
            }
            print("Enter the name of customer: ")
            
            guard let name:String = readLine(), !name.isEmpty else{
                print("Name cannot be empty!")
                continue
            }
            var flag = 0
            for Customer in CustomerList{
                if(name == String(Customer.Name)){
                    flag = 1
                }
            }
            if(flag == 0){
                print("This customer doesn't exist!")
                continue
            }else{
                custName = name
                break LabelCustomer
            }
        }
        
        let B = Booking()
        B.fromDate = startDate
        B.toDate = endDate
        B.room = SearchRoom(id:index)
        B.customer = SearchCustomer(name:custName)
        BookingList.append(B)
        print("Created booking successfully!")
        break
    }
}

func DisplayBooking(){
    print("All bookings:")
    var index:Int = 1
    for Booking in BookingList{
        print("ID:\(Booking.bookingId)  Room: \(Booking.room.Name)  Price: $\(Booking.room.price) ")
        print("Date: \(Booking.fromDate)-\(Booking.toDate) Customer: \(Booking.customer.Name)")
        index = index + 1
    }
}

func SearchBooking(){
    DisplayBooking()
    DeleteLabel: while(true){
        print("Search by name: 1 || Search by Date: 2 || Back to home: Q")
        guard let choice:String = readLine(), !choice.isEmpty, choice=="1" || choice=="2" || choice=="Q" else{
            print("You must select 1 or 2!")
            continue
        }
        if(choice == "1"){
            NameLabel: while(true){
                print("Full name of customer: ")
                guard let name:String = readLine(), !name.isEmpty else{
                    print("Name cannot be empty!")
                    continue
                }
                var flag = 0
                for Customer in CustomerList{
                    if(name == String(Customer.Name)){
                        flag = 1
                    }
                }
                if(flag == 0){
                    print("This name doesn't exist!")
                    continue
                }else{
                    print("\(name)'s bookings: ")
                    for Booking in BookingList{
                        if(Booking.customer.Name == name){
                            print("ID:\(Booking.bookingId) \(Booking.room.Name)  From:\(Booking.fromDate) To:\(Booking.toDate)  Customer: \(Booking.customer.Name)")
                        }
                    }
                }
                break NameLabel
            }
        }else if(choice == "2"){
            while(true){
                print("Start date: ")
                guard let sDate:String = readLine(), !sDate.isEmpty else{
                    print("Start date cannot be empty!")
                    continue
                }
                print("Bookings on: \(sDate): ")
                for Booking in BookingList{
                    if(Booking.fromDate == sDate){
                        print("\(Booking.room.Name)  From:\(Booking.fromDate) To:\(Booking.toDate) Customer: \(Booking.customer.Name)")
                    }
                }
                break
            }
        }else{
            break DeleteLabel
        }
    }
}

func DeleteBooking(){
    DisplayBooking()
    DeleteLabel: while(true){
        var Id:Int = 0
        print("Booking ID you need to delete: ")
        guard let id:String = readLine(), !id.isEmpty else{
            print("Booking ID cannot be empty!")
            continue
        }
        var flag = 0
        for Booking in BookingList{
            if(id == String(Booking.bookingId)){
                flag = 1
            }
        }
        if(flag == 0){
            print("This ID doesn't exist!")
            continue
        }else{
            Id = Int(id)!
            var index:Int = 0
            for Booking in BookingList{
                if(Booking.bookingId == Id){
                    print("Deleted successfully!")
                    BookingList.remove(at: index)
                }
                index += 1
            }
            DisplayBooking()
            break DeleteLabel
        }
    }
}

func HotelSystem(){
    print("Choose a number:")
    print("1 - Add A Customer")
    print("2 - Create A Room")
    print("3 - Display All Rooms")
    print("4 - Create A Booking")
    print("5 - Display All Bookings")
    print("6 - Search A Booking")
    print("7 - Delete A Booking")
    print("0 - Exit")
}

func ExitApp() {
    exit(0)
}

var functions: [String: () -> (Void)] = [:]
functions["0"] = ExitApp
functions["1"] = AddCustomer
functions["2"] = CreateRoom
functions["3"] = DisplayRooms
functions["4"] = CreateBooking
functions["5"] = DisplayBooking
functions["6"] = SearchBooking
functions["7"] = DeleteBooking

func LoadData(){
    let c1 = Customer(Name:"Skyla", Address:"360 Huntington Ave, Boston, MA, 02215", IdNumber:"212134321", phoneNumber: 564728321)
    let c2 = Customer(Name:"Jesse", Address:"24 Westland Ave, Boston, MA, 02115", IdNumber:"185492341", phoneNumber: 234762891)
    let c3 = Customer(Name:"Walt", Address:"32 Boylston Street, Boston, MA, 02115", IdNumber:"534351235", phoneNumber: 234764478)
    let c4 = Customer(Name:"Tatoo", Address:"10 Brookline Ave, Boston, MA, 02115", IdNumber:"623245232", phoneNumber: 126374892)
    let c5 = Customer(Name:"Walt", Address:"48 Westland Ave, Boston, MA, 02115", IdNumber:"693438238", phoneNumber: 263784567)
    CustomerList.append(c1)
    CustomerList.append(c2)
    CustomerList.append(c3)
    CustomerList.append(c4)
    CustomerList.append(c5)
    
    let r1 = Room(Name:"Room 1", roomType:type.Double, price:200.0)
    let r2 = Room(Name:"Room 2", roomType:type.Double, price:320.0)
    let r3 = Room(Name:"Romm 3", roomType:type.Double, price:175.0)
    let r4 = Room(Name:"Room 4", roomType:type.Single, price:75.0)
    let r5 = Room(Name:"Room 5", roomType:type.Single, price:60.0)
    RoomList.append(r1)
    RoomList.append(r2)
    RoomList.append(r3)
    RoomList.append(r4)
    RoomList.append(r5)
}

LoadData()
while(true) {
    HotelSystem()
    print("Please choose a command:")
    
    guard let command: String = readLine() ,!command.isEmpty else {
        print("Error!")
        continue
    }
    
    if functions.keys.contains(command) {
        functions[command]!()
    } else {
        print("This command doesn't exsit!")
    }
}


