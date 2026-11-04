/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: white-space
// description: preserve assignment evaluation order and source whitespace

function main(): void {
    let x: string = '';
    x	=	'U+0009';
    x='U+000B';
    x='U+000C';
    x = 'U+00A0';
    x = 'U+2028';
    x = 'U+2029';
    arktest.assertEQ(x, 'U+2029');
}
