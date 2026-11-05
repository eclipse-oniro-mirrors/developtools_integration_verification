/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: method_invocation_in_expression_position_of_templateliteral
// description: Method invocation in expression position of TemplateLiteral

class MethodObject {
    fn(): string {
        return 'result';
    }
}

function main(): void {
    let obj = new MethodObject();
    arktest.assertEQ(`foo ${obj.fn()} bar`, 'foo result bar');
}
