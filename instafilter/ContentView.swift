//
//  ContentView.swift
//  instafilter
//
//  Created by Aldiyar Batyrbekov on 6/10/20.
//  Copyright © 2020 Aldiyar Batyrbekov. All rights reserved.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)
                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Select a Picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture {
                    self.showingImagePicker = true
                }
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                    
                }
                .padding(.vertical)
                HStack {
                    Button("Change Filter") {
                        
                    }
                    Spacer()
                    Button("Save") {
                        
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Instafilter")
        }
    }
}

// saving images


//class ImageSaver: NSObject {
//    func writeToPhotoAlbum(image: UIImage) {
//        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
//        }
//    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
//        print("Save finished")
//    }
//}
//
//struct ContentView: View {
//    @State private var isSheetShowing = false
//    @State private var image: Image?
//    @State private var inputImage: UIImage?
//
//
//    var body: some View {
//        VStack {
//            image?
//                .resizable()
//                .scaledToFit()
//            Button("Select Image") {
//                self.isSheetShowing = true
//            }
//        }
//        .sheet(isPresented: $isSheetShowing, onDismiss: loadImage, content: {
//            ImagePicker(image: self.$inputImage)
//        })
//    }
//
//    func loadImage() {
//        guard let inputImage = inputImage else { return }
//        image = Image(uiImage: inputImage)
//        UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
//        let imageSaver = ImageSaver()
//        imageSaver.writeToPhotoAlbum(image: inputImage)
//    }
//}

// working with image

//struct ContentView: View {
//    @State private var image: Image?
//    var body: some View {
//        VStack {
//            image?
//                .resizable()
//                .scaledToFit()
//        }
//        .onAppear(perform: loadImage)
//    }
//    func loadImage() {
//        guard let inputImage = UIImage(named: "example") else { return }
//        let beginImage = CIImage(image: inputImage)
//
//        let context = CIContext()
//        let currentFilter =  CIFilter.crystallize()
//
//        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
//        currentFilter.radius = 200
//
//        guard let outputImage = currentFilter.outputImage else { return }
//
//        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
//            let uiImage = UIImage(cgImage: cgimg)
//            image = Image(uiImage: uiImage)
//        }
//
//    }
//}


//struct ContentView: View {
//
//    @State private var blurAmount: CGFloat = 0 {
//        didSet {
//            print(blurAmount)
//        }
//    }
//    @State private var isActionSheetShowing = false
//    @State private var backgroundColor = Color.primary
//    var body: some View {
//        let blur = Binding<CGFloat>(
//            get: {
//                self.blurAmount
//        }, set: {
//            self.blurAmount = $0
//            print(self.blurAmount)
//        }
//        )
//        return VStack {
//            Text("Hello, World!")
//                .blur(radius: blurAmount)
//                .background(backgroundColor)
//                .onTapGesture {
//                    self.isActionSheetShowing = true
//            }
//            Slider(value: blur, in: 0...20)
//        }
//        .actionSheet(isPresented: self.$isActionSheetShowing, content: {
//            ActionSheet(title: Text(""), buttons: [
//                .default(Text("RED")) {
//                    self.backgroundColor = .red
//
//                }
//            ])
//        })
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
