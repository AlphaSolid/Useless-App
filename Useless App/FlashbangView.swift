import SwiftUI
import AVFoundation
import Subsonic


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
    @StateObject private var sound = SubsonicPlayer(sound: "PunjabiMC.mp3")
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
            sound.play()
            
        }
        .onDisappear {
            toggleTorch(on: false)
            UIScreen.main.brightness = 0
            sound.stop()
        }
    }
}

struct FlashbangView_Previews: PreviewProvider {
    static var previews: some View {
        FlashbangView()
    }
}
 
