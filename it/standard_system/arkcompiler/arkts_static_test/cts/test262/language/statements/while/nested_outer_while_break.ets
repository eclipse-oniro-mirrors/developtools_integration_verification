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

// arktsid: nested_outer_while_break
// description: A break from an inner loop can exit the outer control flow

function main(): void {
    let outerBefore: boolean = false;
    let innerBefore: boolean = false;
    let outerAfter: boolean = false;
    let exitOuter: boolean = false;
    do {
        outerBefore = true;
        while (true) {
            innerBefore = true;
            exitOuter = true;
            break;
        }
        if (exitOuter) {
            break;
        }
        outerAfter = true;
    } while (true);
    arktest.assertTrue(outerBefore && innerBefore && !outerAfter);
}
