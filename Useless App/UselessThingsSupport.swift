import ChatGPTSwift

let api = ChatGPTAPI(apiKey: "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")

func getUselessSpeech(message: String) async -> String {
    do {
        let stream = try await api.sendMessageStream(text: "What is ChatGPT?")
        for try await line in stream {
            return line
        }
    } catch {
        return "Text to speech failed. Please try again alter"
    }
    return "404 not found"
}
