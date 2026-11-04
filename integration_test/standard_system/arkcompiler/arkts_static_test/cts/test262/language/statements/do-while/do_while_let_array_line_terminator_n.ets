/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: A let array binding cannot be parsed as a do-while single statement
tags: [compile-only]
---*/

do {
let [x]: int[] = [0]

} while (false);

function main(): void {
}
