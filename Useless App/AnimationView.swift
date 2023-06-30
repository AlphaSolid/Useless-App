import SwiftUI
import AVKit

struct AnimationView: View {
    @Binding var penguin: penguinType
    @State var up: CGFloat = 0.0
    @State var rotation: Double = 0.0
    @Binding var stationary: slideSpeed
    let synthesizer = AVSpeechSynthesizer()
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            ZStack {
                if penguin == penguinType.normal {
                    withAnimation {
                        Image("Normal")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .offset(y: up)
                    }
                } else {
                    withAnimation {
                        Image("Robot")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .offset(y: up)
                        
                    }
                }
            }
            
            if up != -900 {
                Button {
                    if stationary != slideSpeed.stationary {
                        withAnimation(.easeIn(duration: 3)) {
                            up = up - 900
                            print(up)
                        }
                    }
                    let utterance = AVSpeechUtterance(string: penguinPhrases.randomElement() ?? "Waddle-icious greetings! Did you know that penguins invented the phrase 'cool beans'? We're the masters of chilly lingo!")
                    utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                    synthesizer.speak(utterance)
                } label: {
                    HStack {
                        Image(systemName: "chevron.up.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Go Upwards")
                            .font(.system(size: 30, weight: .regular, design: .monospaced))
                    }
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
            } else {
                Button {
                    if stationary != slideSpeed.stationary {
                        withAnimation(.easeIn(duration: 3)) {
                            up = up + 900
                            rotation = 90
                        }
                    }
                    let utterance = AVSpeechUtterance(string: penguinPhrases.randomElement() ?? "Waddle-icious greetings! Did you know that penguins invented the phrase 'cool beans'? We're the masters of chilly lingo!")
                    utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                    synthesizer.speak(utterance)
                } label: {
                    HStack {
                        Image(systemName: "chevron.down.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Downwards!")
                            .font(.system(size: 30, weight: .regular, design: .monospaced))
                    }
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
            }
        }
    }
}
