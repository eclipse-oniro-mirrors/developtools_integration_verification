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

// arktsid: optional_chain_optional_expression
// description: optional chain on a recursive optional expression (member and call base followed by further optional
// chain)
// Conversion notes: covers nested optional chains on a member-expression base and on a call-expression base whose
// result
// is an object or null.

class B {
    public b: number = 22;
}

class Obj {
    public a: B | null = new B();
}

class Empty {
    public a: B | null = null;
}

function fn(): Empty {
    return new Empty();
}

function main(): void {
    let obj: Obj = new Obj();
    let r1: number | undefined = obj?.a?.b;
    arktest.assertEQ(22, r1);

    let r2: number | undefined = fn()?.a?.b;
    arktest.assertEQ(undefined, r2);
}