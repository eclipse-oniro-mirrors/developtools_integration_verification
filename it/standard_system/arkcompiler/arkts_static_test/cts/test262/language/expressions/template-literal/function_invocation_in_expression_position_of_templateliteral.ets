/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: function_invocation_in_expression_position_of_templateliteral
// description: Function invocation in expression position of TemplateLiteral

function fn(): string {
    return 'result';
}

function main(): void {
    arktest.assertEQ(`foo ${fn()} bar`, 'foo result bar');
}
