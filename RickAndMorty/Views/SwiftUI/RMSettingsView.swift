//
//  RMSettingsView.swift
//  RickAndMorty
//
//  Created by 1 on 05.09.2023.
//

import SwiftUI

struct RMSettingsView: View {
    
    let viewModel: RMSettingsViewViewModel
    
    init(viewModel: RMSettingsViewViewModel) {
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        List(viewModel.cellViewModels) { viewModel in
            HStack {
                if let image = viewModel.icon {
                    Image(uiImage: image)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .padding(10)
                        .background(Color(viewModel.iconContainerColor))
                        .cornerRadius(10)
                        
                    
                }
               
                Text(viewModel.title)
                    .padding(.leading, 5)
                Spacer()
            }
            .padding(10)
            .onTapGesture {
                viewModel.onTapHandler(viewModel.type)
            }

        }
        
    
    }
}

struct RMSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        RMSettingsView(viewModel: .init(cellViewModels: RMSettingsOptions.allCases.compactMap({
            return RMSettingsCellViewModel(type: $0) { option in
                
            }
        })))
        .preferredColorScheme(.dark)
    }
}
