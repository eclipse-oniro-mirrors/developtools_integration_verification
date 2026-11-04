/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: short-circuit-number-object
// description: coalesce short-circuits on a non-nullish object reference

// Conversion notes:
//  - The JS source wraps the object in toString/valueOf coercion traps. ArkTS
//    `??` performs no value coercion, so a plain object reference reproduces
//    the same short-circuit semantics.

class Obj {
}

function main(): void {
    let obj = new Obj();
    let x: Obj | int | null | undefined = undefined;
    x = obj ?? 1;
    arktest.assertEQ(x, obj, 'obj ?? 1');
    x = obj ?? null;
    arktest.assertEQ(x, obj, 'obj ?? null');
    x = obj ?? undefined;
    arktest.assertEQ(x, obj, 'obj ?? undefined');
    x = obj ?? null ?? undefined;
    arktest.assertEQ(x, obj, 'obj ?? null ?? undefined');
    x = obj ?? undefined ?? null;
    arktest.assertEQ(x, obj, 'obj ?? undefined ?? null');
    x = obj ?? null ?? null;
    arktest.assertEQ(x, obj, 'obj ?? null ?? null');
    x = obj ?? undefined ?? undefined;
    arktest.assertEQ(x, obj, 'obj ?? undefined ?? undefined');
    x = null ?? obj ?? null;
    arktest.assertEQ(x, obj, 'null ?? obj ?? null');
    x = null ?? obj ?? undefined;
    arktest.assertEQ(x, obj, 'null ?? obj ?? undefined');
    x = undefined ?? obj ?? null;
    arktest.assertEQ(x, obj, 'undefined ?? obj ?? null');
    x = undefined ?? obj ?? undefined;
    arktest.assertEQ(x, obj, 'undefined ?? obj ?? undefined');
}
