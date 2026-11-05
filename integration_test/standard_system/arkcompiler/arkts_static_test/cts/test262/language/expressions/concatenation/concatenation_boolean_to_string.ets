/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: concatenation_boolean_to_string
// description: ToString conversion from boolean value is "true"/"false" via implicit transformation
// (verified 2026-08-17: false + "" === "false" and true + "" === "true" on es2panda)

function main(): void {
    arktest.assertEQ(false + '', 'false');
    arktest.assertEQ(true + '', 'true');
}
