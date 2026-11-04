/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: labeled_break_nested_do_while
// description: A labeled break exits the nested do-while and resumes the outer flow

function main(): void {
    let outerValue: int = 0;
    let innerValue: int = 0;
    do {
        outerValue = 1;
        inner: do {
            innerValue = 1;
            break inner;
        } while (false);
        outerValue = 2;
    } while (false);
    arktest.assertEQ(outerValue, 2);
    arktest.assertEQ(innerValue, 1);
}
