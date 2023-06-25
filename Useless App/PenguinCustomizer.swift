//
//  PenguinCustomizer.swift
//  Useless App
//
//  Created by Milind Contractor on 24/6/23.
//

import SwiftUI

struct PenguinCustomizer: View {
    @State var penguin: penguinType = .normal
    @State var kind: kindOfBrain = .smartButDumb
    @State var traits: traitsHad = .curious
    @State var flipper: flipperKind = .normal
    @State var generation: generativeType = .natural
    @State var languageProcesser: languageProcessingAlgorithm = .saumil
    @State var penguinSize: sizeOfPenguin = .medium
    @State var gender: genderOfPenguin = .male
    @State var food: diet = .fish
    @State var summonAnimator: Bool = false
    @State var summonAlert: Bool = false
    
    var body: some View {
        VStack {
            List {
                Section("Penguin Type") {
                    Picker("Penguin Type", selection: $penguin) {
                        Text("Normal")
                            .tag(penguinType.normal)
                        Text("Robot")
                            .tag(penguinType.robot)
                    }
                    .pickerStyle(.segmented)
                }
                Section("Traits") {
                    Picker("Personality Trait 1", selection: $kind) {
                        Text("Lazy")
                            .tag(kindOfBrain.lazy)
                        Text("Sleepy")
                            .tag(kindOfBrain.sleepy)
                        Text("Smart")
                            .tag(kindOfBrain.smart)
                        Text("Smart but acts dumb")
                            .tag(kindOfBrain.smartButDumb)
                    }
                    .pickerStyle(.menu)
                    
                    Picker("Personality Trait 2", selection: $traits) {
                        Text("Curious")
                            .tag(traitsHad.curious)
                        Text("Dangerous")
                            .tag(traitsHad.dangerous)
                        Text("Loyal")
                            .tag(traitsHad.loyal)
                        Text("Brave")
                            .tag(traitsHad.brave)
                        Text("Bossy")
                            .tag(traitsHad.bossy)
                        
                    }
                    .pickerStyle(.menu)
                    
                    Picker("Flipper Type", selection: $flipper) {
                        Text("Super Slippery")
                            .tag(flipperKind.superSlippery)
                        Text("Slippery")
                            .tag(flipperKind.slippery)
                        Text("Normal")
                            .tag(flipperKind.normal)
                        Text("Suction")
                            .tag(flipperKind.suction)
                        Text("Super Strong Suction")
                            .tag(flipperKind.superStrongSuction)
                    }
                    .pickerStyle(.menu)
                    
                    Picker("Size", selection: $penguinSize) {
                        Text("Very Short")
                            .tag(sizeOfPenguin.veryShort)
                        Text("Short")
                            .tag(sizeOfPenguin.short)
                        Text("Normal")
                            .tag(sizeOfPenguin.medium)
                        Text("Tall")
                            .tag(sizeOfPenguin.tall)
                        Text("Very Tall")
                            .tag(sizeOfPenguin.veryTall)
                    }
                    .pickerStyle(.menu)
                    
                    Picker("Gender", selection: $gender) {
                        Text("Male")
                            .tag(genderOfPenguin.male)
                        Text("Female")
                            .tag(genderOfPenguin.female)
                        Text("Other")
                            .tag(genderOfPenguin.other)
                        
                    }
                    .pickerStyle(.menu)
                    
                    
                    Picker("Diet", selection: $food) {
                        Text("Fish Only")
                            .tag(diet.fish)
                        Text("Plants")
                            .tag(diet.plants)
                        Text("Plants and Fish")
                            .tag(diet.plantsAndFish)
                        Text("All kinds of meat")
                            .tag(diet.allMeats)
                        Text("Plants and all meats")
                            .tag(diet.plantsAndAllMeats)
                        Text("Everything it sees in its way")
                            .tag(diet.everything)
                    }
                    .pickerStyle(.menu)
                }
                
                if penguin == penguinType.robot {
                    Section("Robots Only") {
                        Picker("Generative Type", selection: $flipper) {
                            Text("Natural")
                                .tag(generativeType.natural)
                            Text("Robotic")
                                .tag(generativeType.robotic)
                        }
                        .pickerStyle(.menu)
                        
                        Picker("Language Processing Algorithm", selection: $languageProcesser) {
                            Text("ChatGPT3")
                                .tag(languageProcessingAlgorithm.gpt3)
                            Text("ChatGPT4")
                                .tag(languageProcessingAlgorithm.gpt4)
                            Text("S.A.U.M.I.L.")
                                .tag(languageProcessingAlgorithm.saumil)
                            Text("Stable Diffusion")
                                .tag(languageProcessingAlgorithm.stablediffusion)
                            Text("Text-DallE")
                                .tag(languageProcessingAlgorithm.dalle)
                            Text("Text-DallE2")
                                .tag(languageProcessingAlgorithm.dalle2)
                            Text("Google Bard")
                                .tag(languageProcessingAlgorithm.bard)
                        }
                        .pickerStyle(.menu)
                    }
                    Section("Minor Warning") {
                        Label("Generative AIs are prone to failure", systemImage: "exclamationmark.triangle.fill")
                    }
                }
                Button {
                    summonAlert = true
                } label: {
                    Text("See your penguin!")
                }
            }
        }
        .alert("Are you sure you want to continue? There is NO going back", isPresented: $summonAlert) {
            Button("Yes", role: .destructive) {
               summonAnimator = true
            }
            Button("No", role: .cancel) {
                summonAlert = false
            }
        }
        .fullScreenCover(isPresented: $summonAnimator) {
            AnimationView(penguin: $penguin)
        }
        
    }
}

struct PenguinCustomizer_Previews: PreviewProvider {
    static var previews: some View {
        PenguinCustomizer()
    }
}
