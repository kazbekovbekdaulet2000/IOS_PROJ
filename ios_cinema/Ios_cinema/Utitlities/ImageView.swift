//
//  ImageView.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 18.12.2021.
//

import Foundation
import SwiftUI


struct ImageView: View {
    let url: String
    
    @State var width: CGFloat
    @State var height: CGFloat
    @State var cornerRadius: CGFloat
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, width: CGFloat = 156, height: CGFloat = 230, cornerRadius: CGFloat = 24){
        self.url = url
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
        self.imageLoader.loadImage(with: self.url)
    }
    var body: some View {
        if let data = self.imageLoader.image {
//            Image(uiImage: UIImage(data: data)!)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: self.width, height: self.height)
//                .cornerRadius(cornerRadius)
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.gray.opacity(0.3))
                .frame(width: self.width, height: self.height)
        }else{
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.gray.opacity(0.3))
                .frame(width: self.width, height: self.height)
        }
    }
}
