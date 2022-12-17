enum Hoge {
    case test
    case test2((message: String, message2: String), isError: Bool)
}

func test(hoge: Hoge) -> String {
    
    let str: String = {
        switch hoge {
        case .test:
            return "test"
        case .test2((let message, let message2), let isError):
            return "test2"
        }
    }()
    
    return str
}

print(test(hoge: .test))
