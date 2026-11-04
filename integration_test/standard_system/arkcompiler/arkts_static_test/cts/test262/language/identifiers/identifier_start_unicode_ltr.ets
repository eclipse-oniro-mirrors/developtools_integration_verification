/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
// arktsid: identifier_start_unicode_ltr
// description: IdentifierStart Unicode letter and ASCII identifier forms

function main(): void {
    let x: int = 1;
    let xx: int = 2;
    let x$: int = 3;
    let x_: int = 4;

    arktest.assertEQ(x, 1);
    arktest.assertEQ(xx, 2);
    arktest.assertEQ(x$, 3);
    arktest.assertEQ(x_, 4);
}
