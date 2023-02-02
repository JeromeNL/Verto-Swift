import OpenAISwift
import SwiftUI

final class ChatGptModel: ObservableObject {
    init() {}

    private var client: OpenAISwift?

    func setup() {
        client = OpenAISwift(authToken: "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")
    }

    func send(text: String,
              completion: @escaping (String) -> Void) {
        client?.sendCompletion(with: text,
                               maxTokens: 500,
                               completionHandler: { result in
            switch result {
            case .success(let model):
                let output = model.choices.first?.text ?? ""
                completion(output)
            case .failure:
                break
            }
        })
    }
}
