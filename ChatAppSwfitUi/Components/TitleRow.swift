//
//  TitleRow.swift
//  ChatAppSwfitUi
//
//  Created by THANSEEF on 22/02/22.
//

import SwiftUI

struct TitleRow: View {
    var imageUrl = URL(string:"https://upload.wikimedia.org/wikipedia/commons/6/6f/Emilia_Clarke_Dior_Rose_des_Vents.jpg")
    var name = "Emilia Clarke"
    
    var body: some View {
        HStack(spacing:20) {
            //AsyncImage To load the image (url)
            AsyncImage(url: imageUrl){ image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:50,height:50)
                    .cornerRadius(50)
            }placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading){
                Text(name)
                    .font(.title).bold()
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth:.infinity,alignment: .leading)
            Image(systemName: "phone.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        .padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            .background(Color("Peach"))
    }
}
