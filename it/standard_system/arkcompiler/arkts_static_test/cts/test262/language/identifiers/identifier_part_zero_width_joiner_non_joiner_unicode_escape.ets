/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
// arktsid: identifier_part_zero_width_joiner_non_joiner_unicode_escape
// description: Zero width joiner and non-joiner are valid identifier parts

function main(): void {
    let $: int = 1;
    let $\u200D: int = 2;
    let $\u200C: int = 3;

    arktest.assertEQ($, 1);
    arktest.assertEQ($\u200D, 2);
    arktest.assertEQ($\u200C, 3);
}
