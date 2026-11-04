/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: string_prefix_ordering_when_left_is_longer
// description: A longer string is not less than its proper prefix

function main(): void {
    arktest.assertFalse('x' < 'x');
    arktest.assertFalse('x' < '');
    arktest.assertFalse('abcd' < 'ab');
    arktest.assertFalse('abcd' < 'abcd');
    arktest.assertFalse('x' + 'y' < 'x');
    let x: string = 'x';
    arktest.assertFalse(x + 'y' < x);
}
