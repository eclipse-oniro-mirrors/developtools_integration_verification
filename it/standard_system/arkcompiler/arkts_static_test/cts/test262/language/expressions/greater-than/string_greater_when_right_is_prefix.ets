/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: string_greater_when_right_is_prefix
// description: If right operand is a proper prefix of left, greater-than is true

function main(): void {
    arktest.assertTrue('x ' > 'x', "#1: ('x ' > 'x') === true");
    arktest.assertTrue('x' > '', "#2: ('x' > '') === true");
    arktest.assertTrue('abcd' > 'ab', "#3: ('abcd' > 'ab') === true");
    arktest.assertFalse('abcd' > 'abcd', "#4: ('abcd' > 'abcd') === false");
    arktest.assertTrue('x' + 'y' > 'x', "#5: ('x' + 'y' > 'x') === true");
    let x: string = 'x';
    arktest.assertTrue(x + 'y' > x, "#6: (x + 'y' > x) === true");
    arktest.assertTrue('a\u0000a' > 'a\u0000', "#7: ('a\\u0000a' > 'a\\u0000') === true");
    arktest.assertFalse(' x' > 'x', "#8: (' x' > 'x') === false");
}