import SwiftUI
import AVFoundation

func toggleTorch(on: Bool) {
    guard let device = AVCaptureDevice.default(for: .video) else { return }
    if device.hasTorch {
        do {
            try device.lockForConfiguration()

            device.torchMode = on ? .on : .off

            device.unlockForConfiguration()
        } catch {
            print("Torch could not be used")
        }
    } else {
        print("Torch is not available")
    }
}

struct FlashbangView: View {
    var body: some View {
        ZStack {
            Color.white
            VStack {
                Text("Flashbang")
            }
        }
        .ignoresSafeArea()
        .onAppear {
            UIScreen.main.brightness = 1
            toggleTorch(on: true)
        }
        .onDisappear {
            toggleTorch(on: false)
            UIScreen.main.brightness = 0
        }
    }
}

struct FlashbangView_Previews: PreviewProvider {
    static var previews: some View {
        FlashbangView()
    }
}
 
