/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: concatenation_null_to_string
// description: ToString conversion from null value is "null" via implicit transformation
// (verified 2026-08-17: null + "" === "null" on es2panda)

function main(): void {
    arktest.assertEQ(null + '', 'null');
}
