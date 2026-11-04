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

// arktsid: short-circuit-number-0
// description: coalesce short-circuit preserves the non-nullish int 0
// Conversion notes: ArkTS ?? rejects a non-nullable value-type left operand; the
// tested value is declared nullable (int | null) to preserve the test point.

function main(): void {
    let v: int | null = 0;
    let x: int | string | boolean | null | undefined = undefined;
    x = v ?? 1;
    arktest.assertEQ(x, 0);
    x = v ?? null;
    arktest.assertEQ(x, 0);
    x = v ?? undefined;
    arktest.assertEQ(x, 0);
    x = v ?? null ?? undefined;
    arktest.assertEQ(x, 0);
    x = v ?? undefined ?? null;
    arktest.assertEQ(x, 0);
    x = v ?? null ?? null;
    arktest.assertEQ(x, 0);
    x = v ?? undefined ?? undefined;
    arktest.assertEQ(x, 0);
    x = null ?? v ?? null;
    arktest.assertEQ(x, 0);
    x = null ?? v ?? undefined;
    arktest.assertEQ(x, 0);
    x = undefined ?? v ?? null;
    arktest.assertEQ(x, 0);
    x = undefined ?? v ?? undefined;
    arktest.assertEQ(x, 0);
}
