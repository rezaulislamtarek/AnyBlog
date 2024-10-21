//
//  SwiftUIView.swift
//  
//
//  Created by Rezaul Islam on 22/10/24.
//
 
import SwiftUI
import RichText

// WebView that wraps WKWebView
public struct RichWebView: View {
    var htmlContent: String
    
    public init(htmlContent: String) {
        self.htmlContent = htmlContent
    }

    public var body: some View{
        ScrollView(showsIndicators: false ){
                    RichText(html: htmlContent)
                        .lineHeight(170)
                        .colorScheme(.auto)
                        .imageRadius(12)
                        .fontType(.system)
                        .foregroundColor(light: Color.black, dark: Color.white)
                        .linkColor(light: Color.blue, dark: Color.blue)
                        .colorPreference(forceColor: .onlyLinks)
                        .linkOpenType(.SFSafariView())
                        .customCSS("")
                        .placeholder {
                            Text("loading")
                        }
                        .transition(.easeOut)
                }
    }

    
}

#Preview {
    RichWebView(htmlContent: "<html><body><h1>Hello, SwiftUI!</h1><p>This is a paragraph of HTML content.</p></body></html>")
         
}
