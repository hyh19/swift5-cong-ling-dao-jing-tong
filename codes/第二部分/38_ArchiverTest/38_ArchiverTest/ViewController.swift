//
//  ViewController.swift
//  38_ArchiverTest
//
//  Created by 珲少 on 2021/2/9.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        //获取根目录
//        let homeDicPath = NSHomeDirectory()
//        //创建文件完整路径
//        let filePath = homeDicPath + "archiver.file"
//        //将字符串数据“jaki”进行归档操作
//        NSKeyedArchiver.archiveRootObject("jaki", toFile: filePath)
        
        //获取根目录
//        let homeDicPath = NSHomeDirectory()
        //创建文件完整路径
//        let filePath = homeDicPath + "archiver.file"
//        进行解归档
//        let name = NSKeyedUnarchiver.unarchiveObject(withFile: filePath)
//        //打印数据
//        print(name)
        
        //创建归档载体数据
//       let mutableData = NSMutableData()
//       //创建归档对象
//       let archiver = NSKeyedArchiver(forWritingWith: mutableData)
//       //进行年龄数据编码
//       archiver.encode(24, forKey: "age")
//       //进行姓名数据编码
//       archiver.encode("jaki", forKey: "name")
//       //编码完成
//       archiver.finishEncoding()
//       //将数据写入文件
//       mutableData.write(toFile: filePath, atomically: true)
//
//        //将文件读取成Data数据
//        let data = try? Data(contentsOf: URL(fileURLWithPath: filePath))
//        //创建解归档对象
//        let unArchiver = NSKeyedUnarchiver(forReadingWith: data!)
//        //进行年龄的解归档
//        let age = unArchiver.decodeInt32(forKey: "age")
//        //进行姓名的解归档
//        let name = unArchiver.decodeObject(forKey: "name")
//        //输出数据
//        print("\(name):\(age)")
        
        //获取根目录
        let homeDicPath = NSHomeDirectory()
        //创建文件完整路径
        let filePath = homeDicPath + "archive.file"
        //创建People实例
        let people = People()
        people.name = "jaki";
        people.age = 24
        //进行归档
        NSKeyedArchiver.archiveRootObject(people, toFile: filePath)

        //进行解归档
        let getPeople = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as! People
        print("\(getPeople.name):\(getPeople.age)")
    }


}

