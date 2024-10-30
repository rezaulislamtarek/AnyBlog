//
//  SwiftUIView.swift
//  
//
//  Created by Rezaul Islam on 30/10/24.
//

import SwiftUI

public enum BottomTabs : String, CaseIterable{
    case latest = "Latest"
    case tags = "Tags"
    case settig = "Setting"
}

struct BottomTabBar: View {
    @Namespace private var menuItemTransition
    @State var selectedTab : BottomTabs = .latest
    var body: some View {
        HStack{
            
            ForEach(BottomTabs.allCases, id: \.self){ item in
                Spacer()
                VStack{
                    Text(item.rawValue)
                    if selectedTab == item {
                        Divider()
                            .matchedGeometryEffect(id: "highlightmenuitem", in:menuItemTransition)
                            .frame( width: 30 ,height: 2)
                            .overlay(.green)
                    }else {
                        Divider()
                            //.matchedGeometryEffect(id: "highlightmenuitem", in:menuItemTransition)
                            .frame( width: 30 ,height: 2)
                            //.overlay(.green)
                    }
                }
                .onTapGesture {
                    withAnimation {
                        selectedTab = item
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    BottomTabBar()
}
