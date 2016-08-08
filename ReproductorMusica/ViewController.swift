//
//  ViewController.swift
//  ReproductorMusica
//
//  Created by Faktos on 07/08/16.
//  Copyright © 2016 ERM. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    var pickerDataSource = ["","The Boys Are Back In Town", "The Spirit Of Radio", "About a girl", "Wasted Years","YYZ"];
    
    var pickerDataSourceAlbums = ["","Jailbreak.jpg", "Permanent Waves.jpg", "Unplugged.jpg", "Somewhere in Time.jpg","Moving Pictures.jpg"];
    
    let MAX : UInt32 = 5
    let MIN : UInt32 = 1
    
    private var reproductor: AVAudioPlayer!
    
    @IBOutlet weak var img_portada: UIImageView!
    
    @IBOutlet weak var lbl_name: UILabel!
    
    @IBOutlet weak var slider_outlet: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.picker.dataSource = self;
        self.picker.delegate = self;
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var picker: UIPickerView!
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
        if(row == 0){
            if (reproductor != nil){
                reproductor.stop()
                reproductor.currentTime = 0.0
                img_portada.image = nil
                lbl_name.text = pickerDataSource[0]
            }
        }
        
        else if(row == 1)
        {
            let sonidoURL = NSBundle.mainBundle().URLForResource("The Boys Are Back In Town", withExtension: "mp3")
            
            do{
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
                reproductor.play()
                img_portada.image = UIImage(named: "Jailbreak.jpg")
                lbl_name.text = pickerDataSource[1]
            }
            catch{
                print("Error al cargar el archivo de sonido")
            }

        }
        else if(row == 2)
        {
            let sonidoURL = NSBundle.mainBundle().URLForResource("The Spirit Of Radio", withExtension: "mp3")
            
            do{
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
                reproductor.play()
                img_portada.image = UIImage(named: "Permanent Waves.jpg")
                lbl_name.text = pickerDataSource[2]
            }
            catch{
                print("Error al cargar el archivo de sonido")
            }
        }
        else if(row == 3)
        {
            let sonidoURL = NSBundle.mainBundle().URLForResource("About a girl", withExtension: "mp3")
            
            do{
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
                reproductor.play()
                img_portada.image = UIImage(named: "Unplugged.jpg")
                lbl_name.text = pickerDataSource[3]
            }
            catch{
                print("Error al cargar el archivo de sonido")
            }
        }
        else if(row == 4)
        {
            let sonidoURL = NSBundle.mainBundle().URLForResource("Wasted Years", withExtension: "mp3")
            
            do{
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
                reproductor.play()
                img_portada.image = UIImage(named: "Somewhere in Time.jpg")
                lbl_name.text = pickerDataSource[4]
            }
            catch{
                print("Error al cargar el archivo de sonido")
            }
        }
        else if(row == 5)
        {
            let sonidoURL = NSBundle.mainBundle().URLForResource("YYZ", withExtension: "mp3")
            
            do{
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
                reproductor.play()
                img_portada.image = UIImage(named: "Moving Pictures.jpg")
                lbl_name.text = pickerDataSource[5]
            }
            catch{
                print("Error al cargar el archivo de sonido")
            }
        }
    }
    
    @IBAction func btn_stop() {
        if (reproductor != nil) {
            if reproductor.playing{
                reproductor.stop()
                reproductor.currentTime = 0.0
            }
        }
    }
    
    @IBAction func btn_play() {
        if (reproductor != nil) {
            if !reproductor.playing{
               reproductor.play()
            }
        }
        
    }
    
    @IBAction func btn_pause() {
        if (reproductor != nil) {
            if reproductor.playing{
                reproductor.pause()
            }
        }

    }

    @IBAction func slider_action(sender: UISlider) {
        let selectedValue = Float(sender.value)
        if (reproductor != nil) {
            reproductor.volume = selectedValue
        }
    }
    
    @IBAction func shuffle_btn() {
        let random_number = Int(arc4random_uniform(MAX) + MIN)
        let sonidoURL = NSBundle.mainBundle().URLForResource(pickerDataSource[random_number], withExtension: "mp3")
        
        do{
            try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
            reproductor.play()
            img_portada.image = UIImage(named: pickerDataSourceAlbums[random_number])
            lbl_name.text = pickerDataSource[random_number]
        }
        catch{
            print("Error al cargar el archivo de sonido")
        }
        
    }
}

