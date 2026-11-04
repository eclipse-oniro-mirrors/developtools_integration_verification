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

// arktsid: typedarrayarg_returns_new_instance
// description: new Int32Array(Int8Array) creates a new instance (not the same object)
// Conversion notes: Cross-type copy.

function main(): void {
    let src = new Int8Array(10);
    let a = new Int32Array(src);
    arktest.assertEQ(a.length, 10, 'length');
    arktest.assertTrue(a.buffer !== src.buffer, 'new buffer');
}