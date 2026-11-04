/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: switch_nested_integer
// description: A switch statement may contain a nested switch statement

function switchTest(value: int): int {
    let result: int = 0;
    switch (value) {
      case 0:
        switch (value) {
          case 0:
            result += 3;
            break;
          default:
            result += 32;
            break;
        }
        result *= 2;
        break;
      default:
        result += 32;
        break;
    }
    return result;
}

function main(): void {
    arktest.assertEQ(switchTest(0), 6);
}
