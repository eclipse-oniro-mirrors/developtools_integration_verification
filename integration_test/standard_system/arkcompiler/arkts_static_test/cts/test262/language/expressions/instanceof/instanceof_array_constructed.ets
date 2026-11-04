/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: instanceof_array_constructed
// description: an array instance is an instanceof Array (constructed with Array)
// Conversion notes: The "arr.constructor === Array" check is dropped: the constructor property is not accessible in
// ArkTS.

function main(): void {
    let arr: number[] = [];
    arktest.assertTrue(arr instanceof Array);
}