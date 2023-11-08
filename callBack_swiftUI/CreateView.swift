//
//  CreateView.swift
//  callBack_swiftUI
//
//  Created by Tung Viet on 08/11/2023.
//

import SwiftUI

struct CreateView: View {
    
    @State var isShowPicker: Bool = false
    @State var imageDidChoose: Image? = Image("placeholder")
    @State var newUser: User = User(avatar: Image(""), name: "", age: 0)
    @Environment(\.presentationMode) var presentationMode
    
    var onTapDone: ((User) -> Void)?
    var body: some View {
        ZStack {
            VStack {
                imageDidChoose?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                Button(action: {
                    isShowPicker.toggle()
                }) {
                    Text("Add Image")
                }
                .sheet(isPresented: $isShowPicker) {
                    
                    ImagePicker(image: self.$imageDidChoose)
                }
                
                TextField("Input name", text: $newUser.name)
                TextField("Input age", value: $newUser.age, format: .number)
                
                Button(action: {
                    if let image = imageDidChoose {
                        newUser.avatar = image
                    } else {
                        
                    }
                    
                    self.onTapDone?(newUser)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Done")
                }
            }
        }
    }
}


struct ImagePicker: UIViewControllerRepresentable {

    @Environment(\.presentationMode)
    var presentationMode

    @Binding var image: Image?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        @Binding var presentationMode: PresentationMode
        @Binding var image: Image?

        init(presentationMode: Binding<PresentationMode>, image: Binding<Image?>) {
            _presentationMode = presentationMode
            _image = image
        }

        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            image = Image(uiImage: uiImage)
            presentationMode.dismiss()

        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            presentationMode.dismiss()
        }

    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(presentationMode: presentationMode, image: $image)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<ImagePicker>) {

    }

}
struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
