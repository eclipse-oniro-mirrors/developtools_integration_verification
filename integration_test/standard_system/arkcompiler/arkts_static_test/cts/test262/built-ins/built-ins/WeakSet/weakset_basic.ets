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
// arktsid: weakset_basic
// description: WeakSet basic operations: add, has, delete

function main(): void {
    let ws = new WeakSet<Object>();
    let obj: Object = {};

    // Initially empty
    arktest.assertEQ(ws.has(obj), false);

    // Add and check
    ws.add(obj);
    arktest.assertEQ(ws.has(obj), true);

    // Duplicate add is no-op
    ws.add(obj);
    arktest.assertEQ(ws.has(obj), true);

    // Delete
    arktest.assertEQ(ws.delete(obj), true);
    arktest.assertEQ(ws.has(obj), false);
    arktest.assertEQ(ws.delete(obj), false);
}
