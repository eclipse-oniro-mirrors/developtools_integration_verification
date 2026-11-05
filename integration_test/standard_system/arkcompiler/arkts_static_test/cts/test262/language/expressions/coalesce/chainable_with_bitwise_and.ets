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

// arktsid: chainable-with-bitwise-and
// description: coalesce RHS with a bitwise AND expression

function main(): void {
    let x: int | boolean | null | undefined = null;
    let f: boolean | null = false;
    let t: boolean | null = true;
    x = null ?? (42 & 43);
    arktest.assertEQ(x, 42);
    x = undefined ?? (42 & 43);
    arktest.assertEQ(x, 42);
    x = f ?? (42 & 43);
    arktest.assertEQ(x, false);
    x = t ?? (42 & 43);
    arktest.assertEQ(x, true);
}
