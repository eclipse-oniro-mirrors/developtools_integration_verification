/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: string_prefix_ordering_when_right_is_longer
// description: A string is not greater than an equal or longer prefix

function main(): void {
    arktest.assertFalse('x' > 'x');
    arktest.assertFalse('' > 'x');
    arktest.assertFalse('ab' > 'abcd');
    arktest.assertFalse('abcd' > 'abcd');
    arktest.assertFalse('x' > 'x' + 'y');
    let x: string = 'x';
    arktest.assertFalse(x > x + 'y');
}
