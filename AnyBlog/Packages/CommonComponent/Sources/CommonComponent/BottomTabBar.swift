//
//  BottomTabBar.swift
//  
//
//  Created by Rezaul Islam on 30/10/24.
//

import SwiftUI

public enum BottomTabs: String, CaseIterable {
    case latest = "Latest"
    case tags = "Tags"
    case setting = "Setting"
}

public struct BottomTabBar: View {
    @Namespace private var menuItemTransition
    @Binding private var selectedTab: BottomTabs
    
    public init(selectedTab : Binding<BottomTabs>){
        self._selectedTab = selectedTab
    }

   public var body: some View {
        HStack {
            ForEach(BottomTabs.allCases, id: \.self) { item in
                Spacer()
                VStack (spacing : 6) {
                    Text(item.rawValue)
                    
                    if selectedTab == item {
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .fill(.green)
                            .frame(width: 30, height: 2)
                            .matchedGeometryEffect(id: "highlightmenuitem", in: menuItemTransition)
                    } else {
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .fill(.clear)
                            .frame(width: 30, height: 2)
                    }
                }
                .onTapGesture {
                    withAnimation() {
                        selectedTab = item
                    }
                }
                Spacer()
            }
        }
        .padding(.top, 8)
        .background(.white)
    }
}

#Preview {
    BottomTabBar(selectedTab: .constant(.latest))
}
