/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: async_function_declaration_line_terminators
// description: Async function declarations allow line breaks after function and the parameter list

async function
foo()
:
Promise<void> {
}

function main(): void {
    let result: Promise<void> = foo();
    arktest.assertTrue(result != null);
}
