/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: instanceof_error_typeerror
// description: a TypeError instance is an instanceof Error and TypeError
// Conversion notes: TypeError('failed') (call without new) is expressed as new TypeError('failed').

function main(): void {
    let err = new TypeError('failed');
    arktest.assertTrue(err instanceof Error);
    arktest.assertTrue(err instanceof TypeError);
}
