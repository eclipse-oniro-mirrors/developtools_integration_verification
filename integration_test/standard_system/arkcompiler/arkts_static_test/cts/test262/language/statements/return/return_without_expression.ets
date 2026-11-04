/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: return_without_expression
// description: A return statement without an expression returns undefined

function noValue(): undefined {
    return;
}

function main(): void {
    arktest.assertEQ(noValue(), undefined);
}
