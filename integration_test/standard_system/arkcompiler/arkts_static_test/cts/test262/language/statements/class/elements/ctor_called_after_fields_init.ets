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

// arktsid: ctor_called_after_fields_init
// description: field initializers run before constructor body (ctor reads this.foo)

let ctor: number = 0;

class C {
    constructor() {
        ctor = this.foo;
    }
    public foo: number = 42;
}

function main(): void {
    let c: C = new C();
    arktest.assertTrue(c.foo === 42);
    arktest.assertTrue(ctor === 42);
}
