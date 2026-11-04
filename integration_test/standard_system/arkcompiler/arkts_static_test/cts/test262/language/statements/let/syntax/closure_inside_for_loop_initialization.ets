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

// arktsid: closure_inside_for_loop_initialization
// description: A closure created during for-loop initialization sees the initial binding

function main(): void {
    let callbacks: (() => int)[] = [];
    for (let i: int = 0, f: () => int = (): int => i; i < 5; ++i) {
        callbacks.push(f);
    }
    for (let k: int = 0; k < 5; ++k) {
        arktest.assertEQ(0, callbacks[k]());
    }
}