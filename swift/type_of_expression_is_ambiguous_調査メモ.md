1. この前調べた通り、対象のエラーメッセージは意味解析において失敗しているようである https://github.com/apple/swift/blob/05443c442e94fe709131011fe23bc69fe3fe47b8/include/swift/AST/DiagnosticsSema.def#L3851 `type_of_expression_is_ambiguous `
2. 上記がどう呼ばれてそうか探ってみる
    1. https://github.com/apple/swift/blob/850c280df9a317ce102b5de29d89b6414e64a15f/lib/Sema/ConstraintSystem.cpp#L6531 
        1. https://github.com/apple/swift/blob/850c280df9a317ce102b5de29d89b6414e64a15f/lib/Sema/ConstraintSystem.cpp#L6496
            1. https://github.com/apple/swift/blob/850c280df9a317ce102b5de29d89b6414e64a15f/lib/Sema/CSSolver.cpp#L1441
                1. https://github.com/apple/swift/blob/850c280df9a317ce102b5de29d89b6414e64a15f/lib/Sema/CSSolver.cpp#L1326
                    1. https://github.com/apple/swift/blob/58aaa4f111d087efb5af0d98dde315d1ca470036/lib/Sema/BuilderTransform.cpp#L2342
                        1. https://github.com/apple/swift/blob/58aaa4f111d087efb5af0d98dde315d1ca470036/lib/Sema/BuilderTransform.cpp#L2233 
                            1. ここから2番目の流れと同じになりそう
            2. https://github.com/apple/swift/blob/58aaa4f111d087efb5af0d98dde315d1ca470036/lib/Sema/BuilderTransform.cpp#L2358
                1. https://github.com/apple/swift/blob/58aaa4f111d087efb5af0d98dde315d1ca470036/lib/Sema/BuilderTransform.cpp#L2233 
                    1. https://github.com/apple/swift/blob/d9382b1bdb9d66ccc8d59443f675cc058458088d/lib/Sema/TypeCheckStmt.cpp#L2053
                        1. あまり自信ない https://github.com/apple/swift/blob/d9382b1bdb9d66ccc8d59443f675cc058458088d/lib/Sema/TypeCheckStmt.cpp#L1861 
                            1. https://github.com/apple/swift/blob/8e857d55c379f9764340db754e7a56496f46a7f8/lib/Sema/TypeChecker.cpp#L543 
                                1. https://github.com/apple/swift/blob/527d9a85d2eac41f262626737ea62ba0138030c4/lib/IDE/ExprContextAnalysis.cpp#L78
                                2. https://github.com/apple/swift/blob/58aaa4f111d087efb5af0d98dde315d1ca470036/lib/IDE/CursorInfo.cpp#L42
                                    1. https://github.com/apple/swift/blob/58aaa4f111d087efb5af0d98dde315d1ca470036/lib/IDE/CursorInfo.cpp#L223
                                        1. ここから構文きつい
                                3. https://github.com/apple/swift/blob/d9382b1bdb9d66ccc8d59443f675cc058458088d/lib/Sema/TypeCheckStmt.cpp#L2080
