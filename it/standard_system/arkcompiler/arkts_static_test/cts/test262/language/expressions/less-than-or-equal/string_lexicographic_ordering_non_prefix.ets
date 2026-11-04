/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: string_lexicographic_ordering_non_prefix
// description: Non-prefix strings compare by lexicographic ordering of code values
// Conversion notes:
//  - Astral/surrogate cases (code-unit vs code-point ordering) dropped: ArkTS string comparison
//    orders by code point, so "\u{10000}" <= "￿" is false in ArkTS but true in JS.

function main(): void {
    arktest.assertTrue('xx' <= 'xy', "#1: ('xx' <= 'xy') === true");
    arktest.assertFalse('xy' <= 'xx', "#2: ('xy' <= 'xx') === false");
    arktest.assertTrue('x' <= 'y', "#3: ('x' <= 'y') === true");
    arktest.assertTrue('aac' <= 'aba', "#4: ('aac' <= 'aba') === true");
    arktest.assertFalse('aaac' <= 'aaaa', "#5: ('aaac' <= 'aaaa') === false");
    arktest.assertTrue('a\u0000a' <= 'a\u0000b', "#6: ('a\\u0000a' <= 'a\\u0000b') === true");
    arktest.assertTrue('aB' <= 'aa', "#7: ('aB' <= 'aa') === true");
}