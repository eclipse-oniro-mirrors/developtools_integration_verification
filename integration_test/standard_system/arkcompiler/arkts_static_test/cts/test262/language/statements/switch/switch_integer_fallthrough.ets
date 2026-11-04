/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: switch_integer_fallthrough
// description: A switch statement selects an integer case and falls through until break

function switchTest(value: int): int {
    let result: int = 0;
    switch (value) {
      case 0:
        result += 2;
      case 1:
        result += 4;
        break;
      case 2:
        result += 8;
      case 3:
        result += 16;
      default:
        result += 32;
        break;
      case 4:
        result += 64;
    }
    return result;
}

function main(): void {
    arktest.assertEQ(switchTest(0), 6);
    arktest.assertEQ(switchTest(1), 4);
    arktest.assertEQ(switchTest(2), 56);
    arktest.assertEQ(switchTest(3), 48);
    arktest.assertEQ(switchTest(4), 64);
}
