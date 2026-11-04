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

// arktsid: setters_restricted_ids
// description: setters named eval/arguments (instance + static)

let x: number = 0;

class C {
    get eval(): number {
        return 1;
    }
    get arguments(): number {
        return 2;
    }
    static get eval(): number {
        return 3;
    }
    static get arguments(): number {
        return 4;
    }
    set eval(v: number) {
        x = v;
    }
    set arguments(v: number) {
        x = v;
    }
    static set eval(v: number) {
        x = v;
    }
    static set arguments(v: number) {
        x = v;
    }
}

function main(): void {
    let c: C = new C();
    arktest.assertTrue(c.eval === 1);
    arktest.assertTrue(c.arguments === 2);
    arktest.assertTrue(C.eval === 3);
    arktest.assertTrue(C.arguments === 4);
    c.eval = 1;
    arktest.assertTrue(x === 1);
    c.arguments = 2;
    arktest.assertTrue(x === 2);
    C.eval = 3;
    arktest.assertTrue(x === 3);
    C.arguments = 4;
    arktest.assertTrue(x === 4);
}
