/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: grammar_fields_multi_line
// description: multiple fields across lines without semicolons (ASI), typed
// source: valid/grammar-fields-multi-line.js

class C {
    public x: number
    public y: number
}

function main(): void {
    let c: C = new C();
    c.x = 1;
    c.y = 2;
    arktest.assertTrue(c.x === 1);
    arktest.assertTrue(c.y === 2);
}