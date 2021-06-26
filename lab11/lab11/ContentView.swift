//
//  ContentView.swift
//  lab11
//
//  Created by LAB1422 on 2021/6/2.
//

import SwiftUI
import CoreML

struct ContentView: View {
    
    let imgName = ["images-8", "images-9", "images-10"]
    
    @State var index : Int = 0
    @State var label1 : String = ""
    @State var label2 : String = ""
    
    @State var percent1 : String = ""
    @State var percent2 : String = ""
    
    var body: some View {
        
        
        
        
        VStack{
            
            
            Image(imgName[index])
                .frame(width: 300.0, height: 300.0);
            
            HStack{
                
                Button(action: {
                    index  = index - 1
                    if index < 0 {
                        index = imgName.count - 1
                    }
                }) {
                    Text("Previous")
                        .foregroundColor(Color.white)
                        
                }
                .frame(width: 100.0, height: 50.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.gray/*@END_MENU_TOKEN@*/)
                
                
                Button(action: {
                    index  = index + 1
                    index = index % imgName.count
                }) {
                    Text("Next")
                        .foregroundColor(Color.white)
                        
                        
                }
                .frame(width: 100.0, height: 50.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.gray/*@END_MENU_TOKEN@*/)
            }.padding()
            
            
            Button(action: {
                setImage(index: index)
            }) {
                Text("Classify")
                    .foregroundColor(Color.white)
            }
            .frame(width: 100.0, height: 50.0)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.green/*@END_MENU_TOKEN@*/)
            
            
            HStack{
                Text("My Model: ").font(.title).padding()
                Text("SqueezeNet: ").font(.title).padding()
            }
            
            HStack{
                Text(label1).padding().frame(width: 200.0, height: 100.0)
                Text(label2).padding().frame(width: 200.0, height: 100.0)
            }
            
            HStack{
                Text(percent1).padding().frame(width: 200.0, height: 100.0)
                Text(percent2).padding().frame(width: 200.0, height: 100.0)
            }
            
            
            
        }

    }
}


extension ContentView {
    
    func setImage(index : Int) {

        classify(img: UIImage(named: imgName[index])!)
    }
    
    func classify(img : UIImage) {
        
        let buf = buffer(from: img)
        
        let model1 = AnimalClassifier_1()
        let model2 = SqueezeNet()
        
        do {
            let prediction1 = try
                model1.prediction(image: buf!)
            
            self.label1 = prediction1.classLabel
            self.percent1 = String(prediction1.classLabelProbs[label1]!)
            
            let prediction2 = try
                model2.prediction(image: buf!)
            
            self.label2 = prediction2.classLabel
            self.percent2  = String(prediction2.classLabelProbs[label2]!)

        } catch {
            print("can't predict model")
        }
         
    }
    
    func resizeImage(image: UIImage, width: CGFloat) -> UIImage {
            let size = CGSize(width: width, height:
                width)
            let renderer = UIGraphicsImageRenderer(size: size)
            let newImage = renderer.image { (context) in
                image.draw(in: renderer.format.bounds)
            }
            return newImage
    }
    
    func buffer(from img: UIImage) -> CVPixelBuffer? {
        
    let image = resizeImage(image: img, width: 227)
        
      let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
      var pixelBuffer : CVPixelBuffer?
      let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(image.size.width), Int(image.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
    
      guard (status == kCVReturnSuccess) else {
        return nil
      }

      CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
      let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)

      let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
      let context = CGContext(data: pixelData, width: Int(image.size.width), height: Int(image.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)

      context?.translateBy(x: 0, y: image.size.height)
      context?.scaleBy(x: 1.0, y: -1.0)

      UIGraphicsPushContext(context!)
      image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        
        
 
      UIGraphicsPopContext()
      CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))

      return pixelBuffer
    }
  
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
