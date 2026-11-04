/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: string_lexicographic_ordering_non_prefix
// description: Non-prefix strings compare by lexicographic ordering of code values
// Conversion notes:
//  - Astral/surrogate cases (code-unit vs code-point ordering) dropped: ArkTS string comparison
//    orders by code point, so "\u{10000}" >= "￿" is true in ArkTS but false in JS.

function main(): void {
    arktest.assertTrue('xy' >= 'xx', "#1: ('xy' >= 'xx') === true");
    arktest.assertFalse('xx' >= 'xy', "#2: ('xx' >= 'xy') === false");
    arktest.assertTrue('y' >= 'x', "#3: ('y' >= 'x') === true");
    arktest.assertTrue('aba' >= 'aac', "#4: ('aba' >= 'aac') === true");
    arktest.assertFalse('aaaa' >= 'aaac', "#5: ('aaaa' >= 'aaac') === false");
    arktest.assertTrue('a\u0000b' >= 'a\u0000a', "#6: ('a\\u0000b' >= 'a\\u0000a') === true");
    arktest.assertTrue('aa' >= 'aB', "#7: ('aa' >= 'aB') === true");
}