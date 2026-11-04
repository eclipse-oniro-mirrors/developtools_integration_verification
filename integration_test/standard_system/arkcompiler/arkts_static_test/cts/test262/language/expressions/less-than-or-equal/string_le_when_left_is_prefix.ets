/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: string_le_when_left_is_prefix
// description: If left operand is a prefix of right, less-than-or-equal is true

function main(): void {
    arktest.assertTrue('x' <= 'x', "#1: ('x' <= 'x') === true");
    arktest.assertTrue('' <= 'x', "#2: ('' <= 'x') === true");
    arktest.assertTrue('ab' <= 'abcd', "#3: ('ab' <= 'abcd') === true");
    arktest.assertTrue('abcd' <= 'abcd', "#4: ('abcd' <= 'abcd') === true");
    arktest.assertTrue('x' <= 'x' + 'y', "#5: ('x' <= 'x' + 'y') === true");
    let x: string = 'x';
    arktest.assertTrue(x <= x + 'y', "#6: (x <= x + 'y') === true");
    arktest.assertTrue('a\u0000' <= 'a\u0000a', "#7: ('a\\u0000' <= 'a\\u0000a') === true");
    arktest.assertFalse('x' <= ' x', "#8: ('x' <= ' x') === false");
}