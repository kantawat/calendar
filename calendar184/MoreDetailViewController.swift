//
//  MoreDetailViewController.swift
//  calendar184
//
//  Created by Yuan Kan on 29/1/20.
//  Copyright © 2020 kantawat. All rights reserved.
//

import UIKit

class MoreDetailViewController: UIViewController {

    @IBOutlet weak var yearNotLike1: UILabel!
    
    @IBOutlet weak var goodOrbad: UILabel!
    @IBOutlet weak var yearNotLike2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let arrNotLike2 = ["ปีระกา, ปีไก่ : Rooster","ปีจอ, ปีหมา : Dog","ปีกุน, หมู : Pig","ปีชวด, ปีหนู : Rat","ปีฉลู, ปีวัว : Cow","ปีขาล, ปีเสือ : Tiger","ปีเถาะ, ปีกระต่าย : Rabbit","ปีมะโรง, ปีงูใหญ่ : Dragon","ปีมะเส็ง, ปีงูเล็ก : Snake","ปีมะเมีย, ปีม้า : Horse","ปีมะแม, แพะ : Goat","ปีวอก, ปีลิง : Monkey"]
        let arrNotLike1 = ["ปีเถาะ, ปีกระต่าย : Rabbit","ปีมะโรง, ปีงูใหญ่ : Dragon","ปีมะเส็ง, ปีงูเล็ก : Snake","ปีมะเมีย, ปีม้า : Horse","ปีมะแม, แพะ : Goat","ปีวอก, ปีลิง : Monkey","ปีระกา, ปีไก่ : Rooster","ปีจอ, ปีหมา : Dog","ปีกุน, หมู : Pig","ปีชวด, ปีหนู : Rat","ปีฉลู, ปีวัว : Cow","ปีขาล, ปีเสือ : Tiger"]
        let arrgoodOrbad = ["ฤกษ์ที่ 14 เปียะ (壁) เป็นฤกษ์มงคล เหมาะสำหรับทำการก่อสร้าง แต่งงาน","ฤกษ์ที่ 15 กุย (奎) เป็นฤกษ์อัปมงคล ห้ามประกอบพิธีต่างๆ","ฤกษ์ที่ 16 ลู้ (婁) เป็นฤกษ์มงคล เหมาะสำหรับแต่งงาน ซ่อมบ้าน","ฤกษ์ที่ 17 อุ่ย (胃) เป็นฤกษ์มงคล เหมาะสำหรับทำการก่อสร้าง","ฤกษ์ที่ 18 งัง (昴) เป็นฤกษ์อัปมงคล ห้ามประกอบพิธีต่างๆ","ฤกษ์ที่ 19 ปิ๊ก (畢) เป็นฤกษ์มงคล เหมาะสำหรับทำการก่อสร้าง และไปงานศพ","ฤกษ์ที่ 20 ฉุ่ย (觜) เป็นฤกษ์อัปมงคล ห้ามประกอบพิธีต่างๆ","ฤกษ์ที่ 21 ซำ (參) เป็นฤกษ์มงคล เหมาะสำหรับแต่งงาน เดินทางไกล ขอพร ขอบุตร แต่ห้ามไปงานศพ","ฤกษ์ที่ 22 แจ้ (井) เป็นฤกษ์มงคล เหมาะสำหรับทำการก่อสร้าง แต่ห้ามทำพิธีฝังศพ","ฤกษ์ที่ 23 กุ้ย (鬼) เป็นฤกษ์อัปมงคล ห้ามประกอบพิธีต่างๆ","ฤกษ์ที่ 24 หลิว (柳) เป็นฤกษ์อัปมงคล ห้ามประกอบพิธีต่างๆ","ฤกษ์ที่ 26 เตีย (張) เป็นฤกษ์มงคล เหมาะสำหรับทำการก่อสร้าง แต่งงาน เซ่นไหว้","ฤกษ์ที่ 27 เอ็ก (翌) เป็นฤกษ์อัปมงคล ห้ามประกอบพิธีต่างๆ","ฤกษ์ที่ 28 เจี้ยง (趁) เป็นฤกษ์มงคล เหมาะสำหรับก่อสร้าง แต่งงาน ซื้อเสื้อผ้าใหม่ งานฝังศพ","ฤกษ์ที่ 1 กัก (角) เป็นฤกษ์มงคล เหมาะสำหรับเดินทางไกล แต่งงาน ซื้อเสื้อผ้าใหม่ ขุดดิน ย้ายบ้าน แต่ห้ามไปงานศพ","ฤกษ์ที่ 2 ขั่ง (亢) เป็นฤกษ์อัปมงคล ห้ามประกอบพิธีต่างๆ","ฤกษ์ที่ 3 สี่ (氐) เป็นฤกษ์อัปมงคล ห้ามประกอบพิธีต่างๆ","ฤกษ์ที่ 4 ปั๊ง (房) เป็นฤกษ์มงคล เหมาะสำหรับเซ่นไหว้ แต่งงาน ซ่อมบ้าน ขุดดิน ย้ายบ้าน","ฤกษ์ที่ 5 ซิม (心) เป็นฤกษ์อัปมงคลมากที่สุด ห้ามประกอบพิธีทุกอย่าง","ฤกษ์ที่ 6 บ้วย (尾) เป็นฤกษ์มงคล เหมาะสำหรับทำการก่อสร้าง แต่งงาน ซื้อเสื้อผ้าใหม่","ฤกษ์ที่ 7 กี (箕) เป็นฤกษ์มงคล เหมาะสำหรับทำการก่อสร้าง เก็บบัญชี ห้ามไปงานศพและแต่งงาน","ฤกษ์ที่ 8 เต้า (斗) เป็นฤกษ์มงคล เหมาะสำหรับทำการก่อสร้าง ซื้อเสื้อผ้าใหม่","ฤกษ์ที่ 9 งู้ (牛) เป็นฤกษ์อัปมงคล ห้ามประกอบพิธีต่างๆ","ฤกษ์ที่ 10 นึ่ง (女) เป็นฤกษ์อัปมงคล ห้ามประกอบพิธีต่างๆ","ฤกษ์ที่ 11 ฮือ (虛) เป็นฤกษ์อัปมงคล ห้ามประกอบพิธีต่างๆ","ฤกษ์ที่ 12 งุ้ย (危) เป็นฤกษ์อัปมงคล ห้ามประกอบพิธีต่างๆ","ฤกษ์ที่ 13 สิก (室) เป็นฤกษ์มงคล เหมาะสำหรับทำการก่อสร้าง ย้ายบ้าน แต่งงาน แต่ห้ามไปงานศพ"]
        

        let calendar = Calendar.current
        
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: "01-01-2020".toDateTime() as Date)
        let date2 = calendar.startOfDay(for: initDay as Date)
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        var diffDay = components.day
        print(components)
        
        let posnotlike = ( diffDay! % arrNotLike1.count)
        print(arrNotLike1.count)
        print(posnotlike)
        
        let posgoodbad = ( diffDay! % arrgoodOrbad.count)
        print(arrgoodOrbad.count)
        print(posgoodbad)
        
        self.yearNotLike1.text = arrNotLike1[posnotlike-1]
        self.yearNotLike2.text = arrNotLike2[posnotlike-1]
        self.goodOrbad.text = arrgoodOrbad[posgoodbad-1]
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    

}
