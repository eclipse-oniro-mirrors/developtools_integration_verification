/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: const_declaration_with_initializer_in_case
// description: A const declaration with an initializer is allowed in a case statement list

function main(): void {
    switch (true) {
      case true:
        const x: int = 1;
        arktest.assertEQ(x, 1);
        break;
      default:
        break;
    }
}
