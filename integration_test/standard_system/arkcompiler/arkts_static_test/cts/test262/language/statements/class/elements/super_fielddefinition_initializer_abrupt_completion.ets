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

// arktsid: super_fielddefinition_initializer_abrupt_completion
// description: base field initializer throwing propagates through super() to new C()

function f(): number {
    throw new Error('boom');
}

class A {
    public x: number = f();
}

class C extends A {
    constructor() {
        super();
    }
}

function main(): void {
    let caught: boolean = false;
    try {
        let c: C = new C();
    } catch (e) {
        caught = true;
    }
    arktest.assertTrue(caught);
}
