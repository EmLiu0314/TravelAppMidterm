//
//  FileUploader.swift
//  TravelAppMidterm
//
//  Created by Liu, Emily on 4/19/24.
//

import SwiftUI
import UIKit

struct FileUploader: View {
    @State private var selectedFile: URL?

    var body: some View {
        VStack {
            Text("Selected File: \(selectedFile?.lastPathComponent ?? "None")")
                .padding()

            Button("Import File") {
                let picker = UIDocumentPickerViewController(documentTypes: ["public.item"], in: .import)
                picker.allowsMultipleSelection = false
                picker.delegate = context.coordinator

                UIApplication.shared.windows.first?.rootViewController?.present(picker, animated: true)
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    class Coordinator: NSObject, UIDocumentPickerDelegate {
        var parent: ContentView

        init(parent: ContentView) {
            self.parent = parent
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            guard let selectedFileURL = urls.first else { return }
            parent.selectedFile = selectedFileURL
        }
    }
}



#Preview {
    FileUploader()
}
