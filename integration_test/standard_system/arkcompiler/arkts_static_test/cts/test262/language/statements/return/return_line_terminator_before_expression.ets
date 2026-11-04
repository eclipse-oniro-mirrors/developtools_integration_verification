/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: return_line_terminator_before_expression
// description: A line terminator between return and an expression ends the return statement
function lineFeed(): undefined {
    return
    1;
}

function lineSeparator(): undefined {
    return
    1;
}

function paragraphSeparator(): undefined {
    return
    1;
}

function main(): void {
    arktest.assertEQ(lineFeed(), undefined);
    arktest.assertEQ(lineSeparator(), undefined);
    arktest.assertEQ(paragraphSeparator(), undefined);
}