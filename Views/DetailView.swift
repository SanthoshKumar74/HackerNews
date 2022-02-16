//
//  DetailView.swift
//  H4R News
//
//  Created by Santhosh Kumar on 14/12/21.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let url: String?
    var body: some View {
        WebView(url: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "http:\\Google.com")
    }
}
struct WebView: UIViewRepresentable{
    let url: String?
    func makeUIView(context: Context) -> some WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let safeUrl = url {
            if let url = URL(string: safeUrl){
            let recquest = URLRequest(url: url)
                uiView.load(recquest)
            }
        }
    }
}
